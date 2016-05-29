<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="utf-8">
	<base href=" <%=basePath%>">
	<meta name="viewport" content="width=device-width; initial-scale=1.0">
	<title>在线选座</title>
	<meta name="keywords" content="jQuery,选座">
	<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.css'>
	<link rel="stylesheet" href="resources/css/selectSeats.css">
	<script src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.js'></script>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.seat-charts.min.js"></script>
</head>

<body>
	<!-- 菜单栏 -->
	<div class="ui inverted borderless menu">
		<div class="ui container">
			<a href="#" class="header item"><img src="" class="ui centered mini image"></a>
			<div class="right menu">
				<a class="right item">登陆</a>
				<a class="right item">注册</a>
			</div>
		</div>
	</div>

	<div id="main">
	   <div class="demo">
	   		<div id="seat-map">
				<div class="front">屏幕</div>
			</div>
			<div class="booking-details">
				<p>影片：<span id = "movieName">星际穿越</span></p>
				<p>时间：<span id = "movieTime">11月14日 21:00</span></p>
				<p>座位：</p>
				<ul id="selected-seats"></ul>
				<p>票数：<span id="counter">0</span></p>
				<p>总计：<b>￥<span id="total">0</span></b></p>
						
				<button id="submitInfo" class="checkout-button">确定购买</button>
						
				<div id="legend"></div>
			</div>
			<div style="clear:both"></div>
	   </div>
		
	  <br/>
	</div>



	<script type="text/javascript">
	
	var showingid = '1';
	var getJSON;
	$.ajax({
		type: "GET",
  		url: "/MovieBooking/bookSeat/showingInfo",
  		data: "showingid=" + showingid,
  		async: false,
 		error: function(textStatus, errorThrown) {
 			alert("系统ajax交互错误: " + textStatus);
 		},
  		success: function(data) {
					getJSON = JSON.parse(data)
				},
		dataType: "text"
	});
	
	/*var getJSON;
	$.get("/MovieBooking/bookSeat/showingInfo?showingid=1",function(data,status) {
		alert(status);
		if (status == "success") {
			getJSON = JSON.parse(data);
			alert(getJSON);
		}
    		
  	});*/
	
	//var getJSON = JSON.parse('{"showingId":"123","movieName":"美国队长3","movieTime":"2016年8月30日  21:00","ticketPrice":30.00,"row":4,"col":17,"seatStatus":["aaaaaaaaaaaaaaaaa","aabbaaaaaaaaaaaaa","aaaaaaaaccaaaaaaa","aaaaaaaaaaaaaaaaa"]}');
	var price = getJSON.ticketPrice; //票价
	$(document).ready(function() {
		var $cart = $('#selected-seats'), //座位区
		$counter = $('#counter'), //票数
		$total = $('#total'); //总计金额

		$('#movieName').text(getJSON.movieName);
		$('#movieTime').text(getJSON.movieTime);
		var soldSeats = new Array();
		var othersSeats = new Array();
		var _r, _c;
		for (var r = 0; r < getJSON.row; r++)
			for (var c = 0; c < getJSON.col; c++)
				if (getJSON.seatStatus[r][c] == 'b') {
					_r = r + 1; _c = c + 1;
					soldSeats.push(_r + '_' + _c);
				} else if (getJSON.seatStatus[r][c] == 'c') {
					_r = r + 1; _c = c + 1;
					othersSeats.push(_r + '_' + _c);
				}
					
		//$total.text(soldSeats);

		var sc = $('#seat-map').seatCharts({
			/*map: [  //座位图
				'aaaaaaaaaa',
	            'aaaaaaaaaa',
	            '__________',
	            'aaaaaaaaaa',
	            'aaaaaaaaaa',
				'aaaaaaaaaa',
				'aaaaaaaaaa',
				'aaaaaaaaaa',
				'aa_aaaa_aa',
	            'aa_aaaa_aa'
			],*/
			map : getJSON.seatStatus,
			naming : {
				top : false,
				getLabel : function (character, row, column) {
					return column;
				}
			},
			legend : { //定义图例
				node : $('#legend'),
				items : [
					[ 'a', 'available',   '可选座' ],
					[ 'a', 'unavailable', '已售出'],
					[ 'b', 'availableFromOther', '待转售'],
					[ 'w', 'selected', '已选中']
				]
			},
			click: function () { //点击事件
				if (this.status() == 'available') { //可选座
					$('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
						.attr('id', 'cart-item-'+this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);

					$counter.text(sc.find('selected').length+1);
					$total.text(recalculateTotal(sc)+price);
								
					return 'selected';
				} else if (this.status() == 'selected') { //已选中
						//更新数量
						$counter.text(sc.find('selected').length-1);
						//更新总计
						$total.text(recalculateTotal(sc)-price);
							
						//删除已预订座位
						$('#cart-item-'+this.settings.id).remove();

						if (getJSON.seatStatus[this.settings.row][this.settings.label-1] == 'a')
							return 'available';  //可选座
						else if (getJSON.seatStatus[this.settings.row][this.settings.label-1] == 'c')
							return 'availableFromOther';
				} else if (this.status() == 'unavailable') { //已售出
					return 'unavailable';
				} else if (this.status() == 'availableFromOther') {
					$('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
						.attr('id', 'cart-item-'+this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);

					$counter.text(sc.find('selected').length+1);
					$total.text(recalculateTotal(sc)+price);
					return 'selected';
				} else {
					return this.style();
				}
			}
		});
		//已售出的座位
		sc.get(soldSeats).status('unavailable');
		sc.get(othersSeats).status('availableFromOther');

		// 提交订单
		$('#submitInfo').click(function() {
			var shoppingBasket = "";
			var len = $cart.text().length;
			for (var i = 0; i < len-1; i++) {
				if ($cart.text()[i] == '排') {
					shoppingBasket += '_';
				} else if ($cart.text()[i] == '座') {
					shoppingBasket += ',';
				} else {
					shoppingBasket += $cart.text()[i];
				}
			}
			var postInfo = "showingId=" + getJSON.showingId + "&ticketNumber=" + $('#counter').text()
		 		+ "&tickets=" + shoppingBasket + "&totalPrice=" + $('#total').text();
    		//alert(postInfo);
    		//$.post("/bookSeat/book",postInfo);
			$.ajax({
				type: "POST",
		  		url: "/MovieBooking/bookSeat/book",
		  		async: true,
		  		data: postInfo,
		 		error: function(textStatus, errorThrown) {
		 			alert("系统ajax交互错误: " + textStatus);
		 		},
		  		success: function(data) {
		  					alert(data);
							//getJSON = JSON.parse(data)
						},
				dataType: "text"
			});
  		});
	});

	//计算总金额
	function recalculateTotal(sc) {
		var total = 0;
		sc.find('selected').each(function () {
			total += price;
		});
				
		return total;
	}


	</script>





	<!-- 页脚 -->
	<div class="ui inverted vertical footer segment">
		<div class="ui center aligned container">
			<div class="ui stackable inverted divided grid">
				<div class="three wide column">
					<h4 class="ui inverted header">购票指南</h4>
					<div class="ui inverted link list">
						<a href="#" class="item">购票流程</a>
						<a href="#" class="item">领票制度</a>
						<a href="#" class="item">积分说明</a>
						<a href="#" class="item">常见问题</a>
					</div>
				</div>
				<div class="three wide column">
					<h4 class="ui inverted header">支付方式</h4>
					<div class="ui inverted link list">
						<a href="#" class="item">在线支付</a>
						<a href="#" class="item">银行转账</a>
						<a href="#" class="item">邮局汇款</a>
						<a href="#" class="item">优惠卡券</a>
					</div>
				</div>
				<div class="three wide column">
					<h4 class="ui inverted header">售后服务</h4>
					<div class="ui inverted link list">
						<a href="#" class="item">退换票政策</a>
						<a href="#" class="item">退换票流程</a>
						<a href="#" class="item">退款说明</a>
						<a href="#" class="item">购票保障</a>
					</div>
				</div>
				<div class="seven wide column">
					<h3 class="ui inverted header">客服电话</h3>
					<div class="ui horizontal inverted large divided list">
						<h4 class="item">83312312</h4>
						<h4 class="item">83398989</h4>
					</div>
				</div>
			</div>
			<div class="ui inverted section divider"></div>
			<img src="" class="ui centered mini image">
			<div class="ui horizontal inverted small divided link list">
				<a class="item" href="#">网站地图</a>
				<a class="item" href="#">联系我们</a>
				<a class="item" href="#">条款声明</a>
				<a class="item" href="#">隐私策略</a>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<base href=" <%=basePath%>">
	<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.js'></script>
    <script type="text/javascript" src="resources/js/lazyload-min.js"></script>
    <script type="text/javascript" src="resources/js/menu.js"></script>
	<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.css'>
	<link rel="stylesheet" href="resources/css/index.css">
	<title>选择影院场次</title>
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

	<div class="ui main container">
		<div class="ui segment content">
			<h2 class="ui left floated header">愤怒的小鸟</h2>
			<div class="ui clearing divider"></div>
			<div class="ui secondary pointing four item menu" id="menu_day">
				<!--<a class="active item">今天(05月22日)</a>
				<a class="item">明天(05月23日)</a>
				<a class="item">后天(05月24日)</a>
				<a class="item">大后天(05月25日)</a>-->
			</div>
			<div class="ui center aligned secondary top attached menu" id="menu_zone">
				<!--<a class="active item" zoneNum="0">白云区</a>
				<a class="item" zoneNum="1">花都区</a>
				<a class="item" zoneNum="2">越秀区</a>
				<a class="item" zoneNum="3">从化市</a>
				<a class="item" zoneNum="4">荔湾区</a>
				<a class="item" zoneNum="5">天河区</a>
				<a class="item" zoneNum="6">南沙区</a>
				<a class="item" zoneNum="7">增城市</a>
				<a class="item" zoneNum="8">海珠区</a>
				<a class="item" zoneNum="9">黄埔区</a>
				<a class="item" zoneNum="10">番禺区</a>
				<a class="item" zoneNum="11">萝岗区</a>-->
			</div>
			<div class="ui attached segment grid">
				<div class="three wide column">
				<div class="ui left vertical compact menu" id="menu_cinema">
					<!--<a class="active item">中华广场电影城</a>
					<a class="item 0">永汉电影院</a>
					<a class="item 2">广州星汇电影院</a>
					<a class="item 0">广州金逸国际影城二沙岛店</a>
					<a class="item 0">广州保利国际影城</a>
					<a class="item 0">华影青宫电影城</a>
					<a class="item 2">广州五月花电影城</a>
					<a class="item 0">广州蓓蕾剧院</a>-->
				</div>
				</div>
				<div class="thirteen wide column">
					<table class="ui celled padded table" id="session">
						<thead>
							<tr>
								<th class="single line center aligned">放映时间</th>
								<th class="single line center aligned">结束时间</th>
								<th class="single line center aligned">语言版本</th>
								<th class="single line center aligned">放映厅</th>
								<th class="single line center aligned">价格</th>
								<th class="single line center aligned">选座购票</th>
							</tr>
						</thead>
						<tbody>
							<!--<tr>
								<td><h2 class="ui center aligned header">18:45</h2></td>
								<td class="single line center aligned">20:46</td>
								<td class="single line center aligned">英语 2D</td>
								<td class="single line center aligned">4号厅</td>
								<td class="single line center aligned">36.00</td>
								<td class="single line center aligned"><div class="ui button"> 选座购票</div></td>
							</tr>
							<tr>
								<td><h2 class="ui center aligned header">20:45</h2></td>
								<td class="single line center aligned">22:46</td>
								<td class="single line center aligned">英语 2D</td>
								<td class="single line center aligned">3号厅</td>
								<td class="single line center aligned">36.00</td>
								<td class="single line center aligned"><div class="ui button"> 选座购票</div></td>
							</tr>
							<tr>
								<td><h2 class="ui center aligned header">22:00</h2></td>
								<td class="single line center aligned">次日00:01</td>
								<td class="single line center aligned">英语 2D</td>
								<td class="single line center aligned">1号厅</td>
								<td class="single line center aligned">36.00</td>
								<td class="single line center aligned"><div class="ui button"> 选座购票</div></td>
							</tr>-->

						</tbody>
					</table>
					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">

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
		<a id="movieId" style="display:none">1</a>
	</div>
</body>
</html>
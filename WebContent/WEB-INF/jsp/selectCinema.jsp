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
	<link rel="stylesheet" href="resources/css/home.css">
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/main.js"></script> <!-- Gem jQuery -->
	<link rel="stylesheet" href="resources/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="resources/css/style.css"> <!-- Gem style -->
	<title>选择影院场次</title>
</head>
<body>
	<!-- 菜单栏 -->
	<!--  <div class="ui inverted borderless menu">
		<div class="ui container">
			<a href="#" class="header item"><img src="" class="ui centered mini image"></a>
			<div class="right menu">
				<a class="right item cd-signin">登陆</a>
				<a class="right item cd-signup">注册</a>
			</div>
		</div>
	</div>-->
	
	<header role="banner">
		<div id="cd-logo"><a href="/MovieBooking/home"><img src="resources/img/loginBar/cd-logo.svg" alt="Logo"></a></div>
		<div class = "user-banner">
			
		<nav class="main-nav">
			<ul>
				<li><a class="cd-signin" href="javascript:">登陆</a></li>
				<li><a class="cd-signup" href="javascript:">注册</a></li>
			</ul>
		</nav>

		<nav class="name-nav">
			<ul>
				<!-- inser more links here -->
				<li><a class="cd-username" href="javascript:">用户名</a></li>
				<li><a class="cd-logout" href="javascript:">退出</a></li>
			</ul>
		</nav>

		</div>
		
	</header>
	
	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="javascript:">登陆</a></li>
				<li><a href="javascript:">注册</a></li>
			</ul>

			<div id="cd-login"> <!-- log in form -->
				<form class="cd-form" >
					<!-- <p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">邮箱账号</label>
						<input class="full-width has-padding has-border" id="signin-email" type="email" placeholder="邮箱账号">
						<span class="cd-error-message">输入信息有误</span>
					</p> -->
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">用户名</label>
						<input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="用户名">
						<span class="cd-error-message">输入信息有误</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">登录密码</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="登录密码">
						<!-- <a href="#0" class="hide-password">隐藏</a> -->
						<span class="cd-error-message">输入信息有误</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">一周内免登录</label>
					</p>

					<p class="fieldset">
						<input class="full-width" type="submit" value="登陆">
					</p>
				</form>
				
				<p class="cd-form-bottom-message"><a href="javascript:"">忘记密码?</a></p>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
				<form class="cd-form" >
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">用户名</label>
						<input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="用户名">
						<span class="cd-error-message">输入信息有误</span>
					</p>

					<!-- <p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">邮箱账号</label>
						<input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="邮箱账号">
						<span class="cd-error-message">输入信息有误</span>
					</p> -->

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">登陆密码</label>
						<input class="full-width has-padding has-border" id="signup-password" type="password"  placeholder="登陆密码">
						<!-- <a href="#0" class="hide-password">隐藏</a> -->
						<span class="cd-error-message">输入信息有误</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">我接受服务协议表明您已经阅读并同意接受格瓦拉的 <a href="javascript:">服务协议</a></label>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="创建帐号">
					</p>
				</form>

				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-signup -->

			<div id="cd-reset-password"> <!-- reset password form -->
				<p class="cd-form-message">忘记密码？请输入您的注册邮箱帐号，您将会收到更改密码的链接。</p>

				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="邮箱账号">
						<span class="cd-error-message">输入信息有误</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value=" 重置密码 ">
					</p>
				</form>

				<p class="cd-form-bottom-message"><a href="javascript:">返回登陆界面</a></p>
			</div> <!-- cd-reset-password -->
			<a href="javascript:" class="cd-close-form">Close</a>
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->

	<div class="ui main container">
		<div class="ui segment content">
			<input type="text" readonly="readonly" placeholder="请输入城市名" id="inputTest" />
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
			<div class="ui attached segment grid" id="cinemaAndSession">
			    <div class="ui dimmer">
					<div class="content">
						<div class="center">
							<h2 class="ui inverted icon header">
								<i class="frown icon"></i>
								该地区没有这部电影上映
							</h2>
						</div>
					</div>
				</div>
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
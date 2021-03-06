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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.js'></script>
	<script src='resources/js/home.js'></script>
	<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.css'>
	<link rel="stylesheet" href="resources/css/home.css">
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/main.js"></script> <!-- Gem jQuery -->
	<link rel="stylesheet" href="resources/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="resources/css/style.css"> <!-- Gem style -->
	<title>Index</title>
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

	<!-- 大海报 -->
	<div class="poster-banner">
		<div class="ui left button"><i class="Chevron left huge icon"></i></div>
		<div class="poster">
			<div class="ui shape">
				<div class="sides">
				</div>
			</div>
		</div>
		<div class="ui right button"><i class="Chevron right huge icon"></i></div>
	</div>

	<!-- 热映列表 -->
	<div class="hot-list">
		<div class="ui container">
			<h2 class="ui dividing header">正在热映</h2>
			<div class="ui grid">
			</div>
		</div>
	</div>

	<!-- 即将上映列表 -->
	<div class="upcoming-list">
		<div class="ui container">
			<h2 class="ui dividing header">即将上映</h2>
			<div class="ui grid">
			</div>
		</div>
	</div>

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
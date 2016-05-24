<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
	<meta charset="UTF-8">
	<base href=" <%=basePath%>">   
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resources/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="resources/css/style.css"> <!-- Gem style -->
	<!-- Modernizr -->
  	
	<title>Log In &amp; Sign Up Form</title>
</head>
<body>
	<header role="banner">
		<div id="cd-logo"><a href="#0"><img src="resources/img/loginBar/cd-logo.svg" alt="Logo"></a></div>

		<nav class="main-nav">
			<ul>
				<!-- inser more links here -->
				<li><a class="cd-signin" href="#0">登陆</a></li>
				<li><a class="cd-signup">注册</a></li>
			</ul>
		</nav>
	</header>

	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0">登陆</a></li>
				<li><a href="#0">注册</a></li>
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
				
				<p class="cd-form-bottom-message"><a href="#0">忘记密码?</a></p>
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
						<label for="accept-terms">我接受服务协议表明您已经阅读并同意接受格瓦拉的 <a href="#0">服务协议</a></label>
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

				<p class="cd-form-bottom-message"><a href="#0">返回登陆界面</a></p>
			</div> <!-- cd-reset-password -->
			<a href="#0" class="cd-close-form">Close</a>
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="resources/js/main.js"></script> <!-- Gem jQuery -->
</body>
</html>
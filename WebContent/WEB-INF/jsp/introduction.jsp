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
	<script src='resources/js/introduction.js'></script>
	<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.css'>
	<link rel="stylesheet" href="resources/css/introduction.css">
	<script src="resources/js/jquery.cookie.js"></script>
	<script src="resources/js/main.js"></script> <!-- Gem jQuery -->
	<link rel="stylesheet" href="resources/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="resources/css/style.css"> <!-- Gem style -->
	<title>introduction</title>
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

	<!-- 电影简介 -->
	<div class="brief-introduction">
		<div class="ui grey secondary inverted segment">
			<div class="ui container">
				<div class="ui two column stackable grid">
					<div class="four wide column movie-image">
						<!-- <img src="images/1.jpg"> -->
						<img id="movie-img" src="">
					</div>
					<div class="twelve wide column people">
						<div class="name">
							<div class="ui inverted header">片名: </div>
							<div class="ui yellow inverted header" id="movie-name"><!-- 疯狂动物城 --></div>
							<a class="ui red button" id="bookTicket" href="#" style="float:right">选座订票</a>
						</div>

						<div class="ui section divider"></div>

						<div class="director">
							<div class="ui inverted header">导演: </div>
							<div class="ui horizontal divided list" id="director-list">
								<!-- <div class="item">
									<div class="content">里奇·摩尔</div>
								</div>
								<div class="item">
									<div class="content">拜恩·霍华德</div>
								</div>
								<div class="item">
									<div class="content">杰拉德·布什</div>
								</div> -->
							</div>
						</div>

						<div class="ui section divider"></div>

						<div class="actor">
							<div class="ui inverted header">主演: </div>
							<div class="ui horizontal divided list" id="actor-list">
								<!-- <div class="item">
									<div class="content">金妮弗·古德温</div>
								</div>
								<div class="item">
									<div class="content">杰森·贝特曼</div>
								</div>
								<div class="item">
									<div class="content">夏奇拉</div>
								</div>
								<div class="item">
									<div class="content">艾伦·图代克</div>
								</div>
								<div class="item">
									<div class="content">伊德瑞斯·艾尔巴</div>
								</div> -->
							</div>
						</div>

						<div class="ui section divider"></div>

						<div class="type">
							<div class="ui inverted header">类型: </div>
							<div class="ui horizontal list" id="type-list">
								<!-- <div class="ui blue inverted label">
									<div class="content">动画</div>
								</div>
								<div class="ui blue inverted label">
									<div class="content">冒险</div>
								</div>
								<div class="ui blue inverted label">
									<div class="content">动作</div>
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 电影情节 -->
	<div class="introduction">
		<div class="ui segment" style="min-height:150px;">
			<div class="ui container" id="description">
				<!-- <div class="content">
					<h4 class="ui header">剧情简介</h4>
					<p>&nbsp; &nbsp; &nbsp; &nbsp;一个现代化的动物都市，每种动物在这里都有自己的居所，有沙漠气候的撒哈拉广场、常年严寒的冰川镇等等，它就像一座大熔炉，动物们在这里和平共处——无论是大象还是小老鼠，只要努力，都能闯出一番名堂。兔子朱迪从小就梦想能成为动物城市的警察，尽管身边的所有人都觉得兔子不可能当上警察，但她还是通过自己的努力，跻身到了全是大块头动物城警察局，成为了第一个兔子警官。为了证明自己，她决心侦破一桩神秘案件。追寻真相的路上，朱迪迫使在动物城里以坑蒙拐骗为生的狐狸尼克帮助自己，却发现这桩案件背后隐藏着一个意欲颠覆动物城的巨大阴谋，他们不得不联手合作，去尝试揭开隐藏在这巨大阴谋后的真相。</p>
				</div>
				<div class="content">
					<h4 class="ui header">创作背景</h4>
					<p>&nbsp; &nbsp; &nbsp; &nbsp;《疯狂动物城》是迪士尼动画工作室第55部动画长片，该片的灵感来自童话《柳林风声》（The Wind in the Willows）中像人类一样行事的会说话动物。该片的执行制片人约翰·拉赛特从小是看《柳林风声》长大的，他非常想拍一部会说话的动物电影，而导演拜恩·霍华德发现迪士尼任何一部动画都能运用于现代社会，都能折射这个社会的种种。在早期创作版本中狐尼克是主角，观众是跟随尼克的视角了解动物城的，但尼克并不喜欢动物城，如果观众通过他的视角了解动物城，那观众也不会喜欢对动物城。创作方希望观众会在乎动物城，关心它的存亡与否，所以改动成兔朱迪为主角，因为朱迪更加积极乐观，让尼克的负面论调和朱迪形成对比。</p>
				</div>
				<div class="content">
					<h4 class="ui header">故事设定</h4>
					<p>&nbsp; &nbsp; &nbsp; &nbsp;这座城市是由动物设计，包含了雨林、沙漠、冰原等不同区域。城市建筑缺少玻璃、混凝土、钢铁等材质，取而代之的是树木、花草、沙石、冰块等大自然赋予的天然原料。动物城的世界里，人类从未存在过，是一个只有动物存在的现代文明世界，素食和肉食等不同种族的动物们和平相处在同一座城市里。而居住于其中的动物则都具有“人性”——他们用双脚走路，要穿衣服，会使用高科技电子产品。该片导演与编剧认为鱼等海洋生物属于没有信念与信仰的生物，而猴子、猩猩等灵长类动物因为太像人，会让观众觉得他们比其他动物聪明，所以没有包括在动物城内。而猫猫、狗狗则是人类驯化的宠物，没有人类，自然也没有他们。</p>
				</div> -->
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
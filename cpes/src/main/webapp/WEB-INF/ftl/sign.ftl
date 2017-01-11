
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sign up</title>

    <#include "common/css.ftl">
   <!-- <link href="${APP_PATH}/assets/css/rtl.css" rel="stylesheet">  -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <!-- <link href="${APP_PATH}/assets/css/rtl.css" rel="stylesheet"> Uncomment it if needed! -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="wrapper">
  <!-- Header -->
  <#include "common/navigator.ftl">
  </header>
  <!-- Header -->
	<div style="background:url(${APP_PATH}/assets/images/bg-signup.jpg) no-repeat; background-size:100% auto; min-height:157px!important;" class="breadcrumb-sec">
		<div class="absolute-sec">
			<div class="container">
				<div class="cs-table">
					<div class="cs-tablerow">
						<div class="pageinfo page-title-align-center">
							<h1 style="color:#fff !important; text-transform:none; text-align:center;">登录或注册</h1>
							<strong class="title" style="text-align:center; display:block; color:#fff; font-weight:normal;">欢迎您访问我们，我们竭尽所能为您服务</strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
        <!-- Main Start -->
        <div id="main">
            <section class="page-section">
               <div class="container">
                <div class="row">
					<div class="section-fullwidth">
					  <div class="cs-content-holder">
						  <div class="row">
						  <div class="col-lg-12">
							<div class="user-signup">
							  <!-- Nav tabs -->
								  <ul class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active"><a id="loginTabBtn" href="#home" aria-controls="home" role="tab" data-toggle="tab">登录</a></li>
									<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">注册</a></li>
								  </ul>
		
								  <!-- Tab panes -->
								  <div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="home">
									  <div class="sign-form">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6">
											 <form id="loginForm" method="post" class="signup-form">
												<ul class="row">
												  <li class="col-lg-6 col-md-6 col-sm-6">
													<label>登录账号</label>
													<input type="text" id="ffloginacct" name="loginacct" placeholder="">
												  </li>
												  <li class="col-lg-6 col-md-6 col-sm-6">
													<label>登录密码</label>
													<input type="password" id="ffuserpswd" name="userpswd" placeholder="">
												  </li>
												  <li class="col-lg-12">
													<a href="#"><i class="icon-question-circle"></i>忘记密码?</a>
												  </li>
												  <li class="col-lg-12">
													<input class="cs-bgcolor loginbtn" type="submit" value="登录">
												  </li>
												</ul>
											 </form>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6">
											 <div class="social-network">
												<div class="row">
												 <div class="col-lg-12">
												 <h3>第三方登录</h3></div>
												 <ul class="row">
													<li class="col-lg-12">
													<a href="https://www.facebook.com/" data-original-title="facebook">
													<i class="icon-qq"></i>
													  QQ登录
													</a>
													</li>
													<li class="col-lg-12">
													<a href="https://twitter.com" data-original-title="Twitter">
													<i class="icon-wechat"></i>
													微信登录
													</a>
													</li>
												 </ul>
											   </div>
											 </div>
											</div>
										</div>
									  </div>
									</div>
									<div role="tabpanel" class="tab-pane" id="profile">
									  <div class="sign-form">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6">
											 <form id="regForm" class="signup-form" method="post">
												<ul class="row">
												  <li class="col-lg-6 col-md-6 col-sm-6">
													<label>登录账号</label>
													<input type="text" id="floginacct" name="loginacct" placeholder="">
												  </li>
												  <li class="col-lg-6 col-md-6 col-sm-6">
													<label>密码</label>
													<input type="password" id="fuserpswd" name="userpswd" placeholder="">
												  </li>
												  <li class="col-lg-6 col-md-6 col-sm-6">
													<label>名称</label>
													<input type="text" id="fname" name="name" placeholder="">
												  </li>
												  <li class="col-lg-6 col-md-6 col-sm-6">
													<label>电话</label>
													<input type="text" id="ftel" name="tel" placeholder="">
												  </li>
												   <li class="col-lg-12">
													<label>邮箱地址</label>
													<input type="text" id="femail" name="email" placeholder="">
												  </li>
												  <li class="col-lg-12">
													<input class="cs-bgcolor regbtn" type="submit" value="创建账号">
												  </li>
												</ul>
											 </form>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6">
											 <div class="social-network">
												<div class="row">
												 <div class="col-lg-12"><h3>第三方登录</h3></div>
												 <ul class="row">
													<li class="col-lg-12">
													<a href="#" data-original-title="facebook">
													<i class="icon-qq"></i>
													  QQ登录
													</a>
													</li>
													<li class="col-lg-12">
													<a href="#" data-original-title="Twitter">
													<i class="icon-wechat"></i>
													微信登录
													</a>
													</li>
												 </ul>
											   </div>
											 </div>
											</div>
										</div>
									  </div>
									</div>
								  </div>
								</div>
							</div>
						  </div>
					  </div>
					</div>
                  </div>
                </div>
            </section>
        </div>
        <!-- Main End -->
        <!--// Footer Widget //-->
	<!--// Footer Widget //-->
	<footer id="footer-sec">
		<div class="container">
			<div class="row">
				<div class="ads-sec col-lg-12"> <img src="${APP_PATH}/assets/images/ads.jpg" alt="" > </div>
				<div class="col-lg-12">
					<div class="tweet-sec">
						<p><i class="twitter-icon icon-twitter2"></i> Thing anyone did today was get ready for #Scandal <a href="#">http://t.co/UfiNiBLWlZ http://t.co/Fvggnf320f</a> <span class="by">Boxtheme</span> <span class="time">10 hours ago</span></p>
					</div>
				</div>
				<aside class="col-lg-4 col-md-4 col-sm-6 widget widget_categories">
					<div class="widget-section-title"> <strong class="title">Campaigning</strong> </div>
					<ul>
						<li><a href="#">Contributing</a></li>
						<li><a href="#">Publishing</a></li>
						<li><a href="#">Explore Partner Pages</a></li>
						<li><a href="#">Music</a></li>
						<li><a href="#">Daily Inspiration</a></li>
						<li><a href="#">Film and Theatre</a></li>
						<li><a href="#">Sign Up Now</a></li>
						<li><a href="#">Food and Drink</a></li>
						<li><a href="#">Private, secure, spam-free</a></li>
						<li><a href="#">Sports</a></li>
						<li><a href="#">School</a></li>
					</ul>
				</aside>
				<aside class="widget col-lg-4 col-md-4 col-sm-6 widget_categories">
					<div class="widget-section-title"> <strong class="title">Contributing</strong> </div>
					<ul>
						<li><a href="#">Crowdfunder API - Beta</a>
						<li><a href="#">How crowdfunding works</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Creating a project</a></li>
						<li><a href="#">Guides</a></li>
						<li><a href="#">Supporting a project</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Guidelines</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Jobs</a></li>
						<li><a href="#">Partners</a></li>
					</ul>
				</aside>
				<aside class="widget col-lg-4 col-md-4 col-sm-6 widget_newsletter">
					<div class="widget-section-title"> <strong class="title">Weekly Newsletter</strong> </div>
					<form>
						<fieldset>
							<input type="submit" value="Submit" name="submit" class="cs-btn">
							<input class="email" type="email" placeholder="Your Email Address">
						</fieldset>
						<span>Private, secure, spam-free</span>
					</form>
				</aside>
			</div>
		</div>
	</footer>
	<!--// Footer Widget //--> 
	
	<!--// CopyRight //-->
	<div id="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="footer_icon"><a href="#"><img src="${APP_PATH}/assets/images/footer-logo.png" alt=""></a></div>
					<div class="fnav-area">
						<nav class="footer-nav">
							<ul>
								<li><a href="#">Home</a></li>
								<li><a href="#">Categories</a></li>
								<li><a href="#">Showrooms</a></li>
								<li><a href="#">Agents</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Contact us</a></li>
							</ul>
						</nav>
						<p>©2014 Box Theme All rights reserved. Design by <a href="http://www.jqueryfuns.com">Chimp Studio</a></p>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="social-media">
						<ul>
							<li><a href="#"><i class="icon-facebook7"></i></a></li>
							<li><a href="#"><i class="icon-twitter6"></i></a></li>
							<li><a href="#"><i class="icon-googleplus7"></i></a></li>
							<li><a href="#"><i class="icon-instagram4"></i></a></li>
							<li><a href="#"><i class="icon-youtube-play"></i></a></li>
							<li><a href="#"><i class="icon-skype"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--// CopyRight //-->
    </div>
    <#include "common/js.ftl">
	<script type="text/javascript">
	$(".loginbtn").click(function(){
        var loadingIndex = -1;
        $("#loginForm").ajaxSubmit({
            type : "POST",
            url  : "${APP_PATH}/member/login.do",
            beforeSubmit : function() {
                loadingIndex = layer.msg('处理中', {icon: 16});
                return true;
            },
            success : function(r){
                layer.close(loadingIndex);
                if ( r.success ) {
                    layer.msg("会员登录成功", {time:2000, icon:1}, function(){
                        window.location.href = "${APP_PATH}/member/index.htm";
                    });
                } else {
		             layer.msg(r.error, {time:2000, icon:5, shift:6});
                }
            }
        });
        return false;
   });
	
	$(".regbtn").click(function(){
        
        var floginacct = $("#floginacct").val();
        if ( floginacct == "" ) {
          layer.msg("登录账号不能为空，请输入", {time:2000, icon:5, shift:6}, function(){
              $("#floginacct").focus();
          });
          return false;
        }
        
        var fuserpswd = $("#fuserpswd").val();
        if ( fuserpswd == "" ) {
          layer.msg("登录密码不能为空，请输入", {time:2000, icon:5, shift:6}, function(){
              $("#fuserpswd").focus();
          });
	      return false;
        }
        
         var loadingIndex = -1;
         $("#regForm").ajaxSubmit({
             type : "POST",
             url  : "${APP_PATH}/member/regist.do",
             beforeSubmit : function() {
                 loadingIndex = layer.msg('处理中', {icon: 16});
                 return true;
             },
             success : function(r){
                 layer.close(loadingIndex);
                 if ( r.success ) {
                     layer.msg("会员注册成功", {time:2000, icon:1});
                 } else {
		             layer.msg(r.error, {time:2000, icon:5, shift:6});
                 }
             }
         });
         return false;
    });
	</script>
  </body>
</html>
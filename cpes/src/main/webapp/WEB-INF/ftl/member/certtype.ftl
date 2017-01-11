<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Campaigs</title>

<!-- Css (necessary Css) -->
<#include "common/css.ftl">

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
  <!-- Header -->
	<div class="breadcrumb-sec" style="background:url(${APP_PATH}/assets/extra-images/banner.jpg) no-repeat; background-size:100% auto; min-height:157px!important;">
		<div class="absolute-sec">
			<div class="container">
				<div class="cs-table">
					<div class="cs-tablerow">
						<div class="pageinfo page-title-align-left">
							<h1 style="color:#fff !important; text-transform:none;">实名认证</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Main Content -->
	<main id="main-content">
		<div class="main-section">
			<div class="page-section">
				<div class="container">
					<div class="row">
						<div class="section-fullwidth col-lg-12">
							<div class="cs-content-holder">
								<div class="row">
									<div class="col-lg-12">
										<div class="main-heading top-center">
											<h1>请选择适合您业务需要的企业账户类型</h1>
											<strong class="title">通过企业实名认证，就可以使用易付宝企业版的各项服务</strong> 
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-6">
										<div class="acctype cs-services morden top-center">
											<figure style="cursor:pointer;" data-acctype="2">
												<img class="" src="${APP_PATH}/assets/extra-images/services-box1.jpg" alt="#">
												<figcaption>
													<div class="service-number" >
														<span style="background-color:#DDD!important">1</span>
													</div>
												</figcaption>
											</figure>
											<div class="text">
												<h2>个人经营</h2>
												<p>适用于尚未工商注册的个人经营者（无法转账到其他易付宝账户）</p>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-6">
										<div class="acctype cs-services morden top-center has-border">
											<figure style="cursor:pointer;" data-acctype="1">
												<img src="${APP_PATH}/assets/extra-images/services-box2.jpg" alt="#">
												<figcaption>
													<div class="service-number" >
														<span style="background-color:#DDD!important">2</span>
													</div>
												</figcaption>
											</figure>
											<div class="text">
												<h2>个体工商户</h2>
												<p>适用于具有营业执照，注册为个体工商户的企业或公司</p>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-6">
										<div class="acctype cs-services morden top-center has-border">
											<figure style="cursor:pointer;" data-acctype="0">
												<img src="${APP_PATH}/assets/extra-images/services-box3.jpg" alt="#">
												<figcaption>
													<div class="service-number">
														<span style="background-color:#DDD!important">3</span>
													</div>
												</figcaption>
											</figure>
											<div class="text">
												<h2>商业公司</h2>
												<p>适用于具有营业执照，税务登记证和组织机构代码证的企业或公司</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</div>
				</div>
			</div>
			<div class="page-section">
				<div class="container">
					<div class="row">
						<div class="section-fullwidth col-lg-12">
							<div class="cs-content-holder">
								<div class="row">
									<div class="col-lg-12">
										<div class="call-actions align-center">
											<div class="cell btn-area" >
												<a style="border-radius: 10px;cursor:pointer;" class="applyBtn">申请实名认证</a>
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
	</main>
	<!--// Main Content //--> 
	
	<!--// Footer Widget //-->
	<#include "common/footer.ftl">
	<!--// Footer Widget //--> 
	
	<!--// CopyRight //-->
	<#include "common/copyright.ftl">
	<!--// CopyRight //--> 
	
</div>

<!-- jQuery (necessary JavaScript) --> 
<#include "common/js.ftl">
<script type="text/javascript">
	  jQuery(window).load(function(){
        jQuery('.flexslider').flexslider({
          animation: "slide",
          prevText:"<em class='icon-arrow-left9'></em>",
          nextText:"<em class='icon-arrow-right9'></em>",
          start: function(slider){
            jQuery('body').removeClass('loading');
          }
        });
      });
	  
	var acctype = null;
	$("figure").click(function(){
		//alert(acctype);//#d21515!important
		$("figure span").attr("style","background-color: #DDD!important");
 		$("span",this).attr("style","background-color: #d21515!important");
 		acctype = $(this).attr("data-acctype");
	});
	$(".applyBtn").click(function(){
		if(acctype){
			window.location.href = "${APP_PATH}/member/donate-1.htm?acctype="+acctype;
		} else {
			layer.msg("请选择申请账户的类型！",{time:1000,icon:2});
		}
		
	});
</script>
</body>
</html>
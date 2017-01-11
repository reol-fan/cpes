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
	<div class="breadcrumb-sec donate-sec" style="background: url(${APP_PATH}/assets/extra-images/bg-under-page.jpg) no-repeat; background-size:100% auto; min-height:250px;">
		<div class="absolute-sec">
			<div class="container">
				<div class="cs-table">
					<div class="cs-tablerow">
						<div class="pageinfo page-title-align-left">
							<h1 style="color:#fff !important; text-transform:none;">实名认证</h1>
							<strong style="text-align:center; display:block; color:#fff; font-weight:normal;" class="title">通过企业实名认证，就可以使用易付宝企业版各项服务</strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main Content -->
	<main id="main-content">
		<div class="main-section" style="padding:0;">
			<section class="page-section bg-donate">
				<div class="container">
					<div class="row">
						<div class="section-fullwidth">
							<div class="cs-content-holder">
								<div class="row">
									<div class="col-lg-12">
										<div class="donate-area">
											<ul class="nav nav-tabs" role="tablist">
												<li role="presentation"><a>01. 基本信息</a></li>
												<li role="presentation" class="active" ><a >02. 上传证件图片</a></li>
												<li role="presentation"><a >03. 填写邮箱地址</a></li>
												<li role="presentation"><a >04. 提交申请成功</a></li>
											</ul>
											<div class="tab-content">
												<div id="home" class="tab-pane active fade in" role="tabpanel">
												    <form action="${APP_PATH}/member/uploadImg.do?fusm=2" enctype="multipart/form-data" method="post" id="certForm">
													<div class="donate-holder">
														<#list cis as ci>
														<h3>申请证件图片-${ci.name }</h3>
														<div class="form-area">
															<div class="input-area">
																<span><i class="fa fa-file-photo-o"></i></span>
																<input type="file" class="certfile" data-ciid="${ci.id}" name="certfile-${ci.id}" placeholder="">
															</div>
															<img id="certimg${ci.id}" alt="" src="">
														</div>
														</#list>
														<div class="cs-holder">
															<input type="submit" onclick="window.location.href='donate-1.htm';return false;" style="width: 48%;" value="< 基础信息">
															<input type="submit" style="width: 48%;" id="donateBtn2" value="填写邮箱地址 >">
														</div>
													</div>
													</form>
												</div>
												<div id="profile" class="tab-pane fade in" role="tabpanel">
													<div class="pyment-area">
														<div class="donate-holder">
															<div class="amount-area">
																<div class="left-side">
																	<p>
																		<span>$</span>
																		Total Amount
																	</p>
																</div>
																<div class="right-side">
																	<input type="text" value="$0.00">
																</div>
															</div>
															<div class="select-payments">
																<ul class="cs-gateway-wrap">
																	<li>
																		<div class="radio-image-wrapper">
																			<input type="radio" id="cs_paypal_gateway" value="cs_paypal_gateway" name="cs_payment_gateway" checked="checked" class="cs-gateway-calculation">
																			<label for="cs_paypal_gateway">
																				<span><img alt="#" src="${APP_PATH}/assets/extra-images/pyment1.png">
																				</span> 
																			</label>
																		</div>
																		<div class="radio-image-wrapper"><input type="radio" id="cs_authorizedotnet_gateway" value="cs_authorizedotnet_gateway" name="cs_payment_gateway" class="cs-gateway-calculation"><label for="cs_authorizedotnet_gateway"><span><img alt="#" src="${APP_PATH}/assets/extra-images/pyment2.png">
																				</span> </label>
																		</div>
																		<div class="radio-image-wrapper"><input type="radio" id="cs_pre_bank_transfer" value="cs_pre_bank_transfer" name="cs_payment_gateway" class="cs-gateway-calculation"><label for="cs_pre_bank_transfer"><span><img alt="#" src="${APP_PATH}/assets/extra-images/pyment3.png">
																				</span> </label></div>
																		<div class="radio-image-wrapper"><input type="radio" id="cs_skrill_gateway" value="cs_skrill_gateway" name="cs_payment_gateway" class="cs-gateway-calculation"><label for="cs_skrill_gateway"><span><img alt="#" src="${APP_PATH}/assets/extra-images/pyment4.png">
																				</span> </label>
																		</div>
																	</li>
																</ul>
															</div>
															<div class="cs-holder">
																<div class="infotext">
																	<p>Fled less sniffled sorrowful scorpion less hummed lorikeet dear jeepers more patiently shuffled close adjusted far the goodness grunted basically reprehensive the hello ahead more to slow along the unbearably fumblingly yikes sneered and and hence pill wobbled in one.</p>
																</div>
															</div>
															<div class="form-area">
																<form>
																	<input type="checkbox" id="pyment" class="directory-categories-checkbox" name="directory_categories" value="auto-parts">
																	<label for="pyment">Hide my donation from the public</label>
																</form>
															</div>
															<div class="cs-holder">
																<input type="submit" value="Go to Payments">
															</div>
														</div>
													</div>
												</div>
												<div id="messages" class="tab-pane fade in" role="tabpanel">
													<div class="confirmation-area">
														<div class="donate-holder">
															<div class="icon-area">
																<i class="icon-check"></i>
															</div>
															<strong>We recived your Payment</strong>
															<h3>Thank you so much for your Contribution</h3>
															<p>Patiently shuffled close adjusted far the goodness grunted basically<br> reprehensive the hello ahead more to slow along the unbearably fumblingly<br> yikes sneered and and hence pill wobbled in one.</p>
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
<#include "/common/js.ftl">
  <script>
  $(function() {
    $("input:file").change(function(event){
    	var ciid = $(this).attr("data-ciid");
    	var files = event.target.files,file;
    	if(files&&files.length>0){
    		file = files[0];
    	}
    	
    	var URL = window.URL||window.webkitURL;
    	var imgURL = URL.createObjectURL(file);
    	
    	$("#certimg"+ciid).attr("src",imgURL);
    	$("#certimg"+ciid).show();
    });
    
    $("#donateBtn2").click(function(){
    	var errorflg = false;
    	var files = $("input:file");
    	$.each(files,function(i,n){
    		if(n.value==""){
    			layer.msg("验证文件未选择", {time:2000, icon:5, shift:6});
  	         	errorflg = true;
    		}
    	});
    	
    	if(errorflg){return false;}
    	
    	var loadingIndex = -1;
    	$("#certForm").ajaxSubmit({
    		beforeSubmit : function(){
    			loadingIndex = layer.msg('处理中', {icon: 16});
                return true;
    		},
    		success : function(r){
    			layer.close(loadingIndex);
                if ( r.success ) {
                    window.location.href = "${APP_PATH}/member/donate-3.htm";
                } else {
		             layer.msg(r.error, {time:2000, icon:5, shift:6});
		             return false;
                }
   			}
    	});
    	return false;
    });
  });
  </script>
</body>
</html>
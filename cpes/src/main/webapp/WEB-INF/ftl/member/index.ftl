<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Campaigs</title>

<!-- Css (necessary Css) -->
<#include "common/css.ftl">

<!-- jQuery (necessary JavaScript) --> 
<#include "common/js.ftl">
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
	
	<!-- Main Content -->
	<main id="main-content">
		<div class="main-section user-detail2">
			<div class="page-section bg-author">
				<div class="container">
					<div class="row">
						<div class="section-fullwidth col-lg-12">
							<div class="cs-content-holder">
								<div class="row">
									<div class="col-lg-12">
										<div class="author-info">
											<figure>
												<img src="${APP_PATH}/assets/extra-images/author-img3.jpg" alt="#">
											</figure>
											<div class="info-text">
												<time datetime="2008-02-14">Member Since September 3, 2015</time>
												<div class="heading-sec">
													<h2>${memberLogin.name!"未登录账号"}</h2>
													<#if memberLogin.certstatus==1>
													<span style="background-color: #6ee376 !important;"><a href="${APP_PATH }/member/certtype.htm" >已实名认证</a></span>
													<#else>
													<span style="background-color: #d6c3b6 !important;"><a href="${APP_PATH }/member/certtype.htm" >未实名认证</a></span>
													</#if>
												</div>
												<ul class="post-options">
													<li><i class="cscolor icon-map-marker"></i>Newyork, United States</li>
													<li><i class="cscolor icon-phone8"></i>0800 123 456 78910</li>
												</ul>
												<p>Some effusive some misspelled groundhog because well pending much and considering-<br> hello far tremendous the imprecise grew less much jeepers jeepers jeepers.</p>
												<div class="social-media">
													<ul>
														<li><a href="#"><i class="icon-facebook-square"></i></a></li>
														<li><a href="#"><i class="icon-twitter6"></i></a></li>
														<li><a href="#"><i class="icon-instagram4"></i></a></li>
														<li><a href="#"><i class="icon-skype"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="price-box">
												<ul>
													<li>
														<p class="colected-box">
															<span>Donation Colected</span>
															<strong><small>$</small>8,578</strong>
														</p>
													</li>
													<li>
														<p class="projects-box">
															<span>Backed projects</span>
															<strong>423</strong>
														</p>
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
			<div class="page-section" style="padding:0;">
				<div class="container">
					<div class="row">
						<div class="section-fullwidth">
							<div class="cs-content-holder">
								<div class="row">
									<div class="col-lg-12">
										<div class="detail-tabs">
											<ul role="tablist" class="nav nav-tabs">
												<li class="active" role="presentation"><a data-toggle="tab" role="tab" aria-controls="home" href="#home" aria-expanded="false">Backed (13)</a></li>
												<li role="presentation" class=""><a data-toggle="tab" role="tab" aria-controls="profile" href="#profile" aria-expanded="false">Created (6)</a></li>
												<li role="presentation" class=""><a data-toggle="tab" role="tab" href="#comments" aria-expanded="false">comments</a></li>
												<li role="presentation" class=""><a data-toggle="tab" role="tab" aria-controls="settings" href="#settings" aria-expanded="false">Full Bio</a></li>
											  </ul>
											<div class="tab-content">
												<div id="home" class="tab-pane active fade in" role="tabpanel">
													<div class="listing_grid">
														<div class="row">
															<article class="col-lg-3 col-md-3 col-sm-6">
																<div class="directory-section">
																	<div class="cs_thumbsection">
																		<figure><a href="#"><img alt="#" src="${APP_PATH}/assets/extra-images/img.jpg"></a></figure>
																	</div>
																	<div class="content_info">
																		<div class="title">
																			<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																			<span class="addr">214 Greene Avenue</span> </div>
																		<div class="dr_info">
																			<ul>
																				<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																				<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																			</ul>
																			<span class="bar"><span style="width:12%;"></span></span>
																			<div class="detail"> <span class="fund">12% Funded</span><a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a></div>
																		</div>
																	</div>
																</div>
															</article>
															<article class="col-lg-3 col-md-3 col-sm-6">
																<div class="directory-section">
																	<div class="cs_thumbsection">
																		<figure>
																			<a href="#">
																				<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-1.jpg">
																			</a>
																		</figure>
																	</div>
																	<div class="content_info">
																		<div class="title">
																			<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																			<span class="addr">214 Greene Avenue</span> </div>
																		<div class="dr_info">
																			<ul>
																				<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																				<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																			</ul>
																			<span class="bar"><span style="width:84%;"></span></span>
																			<div class="detail"> <span class="fund">84% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																		</div>
																	</div>
																</div>
															</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-2.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-3.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-4.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<div class="spreator"></div>
																		<div class="detail"> 
																		<span class="unsuccess">Funding Unsuccessful</span> 
																		<a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> 
																		</div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-5.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-6.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-7.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:84%;"></span></span>
																		<div class="detail"> <span class="fund">84% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-8.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														</div>
													</div>
												</div>
												<div id="profile" class="tab-pane fade in" role="tabpanel">
													<div class="listing_grid">
														<div class="row">
															<article class="col-lg-3 col-md-3 col-sm-6">
																<div class="directory-section">
																	<div class="cs_thumbsection">
																		<figure><a href="#"><img alt="#" src="${APP_PATH}/assets/extra-images/img.jpg"></a></figure>
																	</div>
																	<div class="content_info">
																		<div class="title">
																			<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																			<span class="addr">214 Greene Avenue</span> </div>
																		<div class="dr_info">
																			<ul>
																				<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																				<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																			</ul>
																			<span class="bar"><span style="width:12%;"></span></span>
																			<div class="detail"> <span class="fund">12% Funded</span><a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a></div>
																		</div>
																	</div>
																</div>
															</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-1.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:84%;"></span></span>
																		<div class="detail"> <span class="fund">84% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-2.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-3.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-4.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<div class="spreator"></div>
																		<div class="detail"> 
																		<span class="unsuccess">Funding Unsuccessful</span> 
																		<a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> 
																		</div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-5.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-6.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-7.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:84%;"></span></span>
																		<div class="detail"> <span class="fund">84% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														<article class="col-lg-3 col-md-3 col-sm-6">
															<div class="directory-section">
																<div class="cs_thumbsection">
																	<figure>
																		<a href="#">
																			<img alt="#" src="${APP_PATH}/assets/extra-images/listing-grid-8.jpg">
																		</a>
																	</figure>
																</div>
																<div class="content_info">
																	<div class="title">
																		<h3><a href="#">We Are Cove Point - Stop Gas Export Plant</a></h3>
																		<span class="addr">214 Greene Avenue</span> </div>
																	<div class="dr_info">
																		<ul>
																			<li> <i class="cscolor icon-target5"></i> $84,000 goal </li>
																			<li> <i class="cscolor icon-clock7"></i> July 27, 2014 </li>
																		</ul>
																		<span class="bar"><span style="width:12%;"></span></span>
																		<div class="detail"> <span class="fund">12% Funded</span> <a data-original-title="Mark as Favorite" data-toggle="tooltip" data-placement="top" class="tolbtn close star"><i class="icon-star"></i></a> </div>
																	</div>
																</div>
															</div>
														</article>
														</div>
													</div>
												</div>
												<div id="comments" class="tab-pane fade in" role="tabpanel">
													<div id="comment">
													  <div class="cs-section-title"><h2>324 Comments</h2></div>
													  <!-- Ul Start -->
													  <ul>
														<li id="li-comment-1">
														  <div class="thumblist" id="comment-1">
															<ul>
															  <li>
																<figure> <a href="#"><img alt="#" src="${APP_PATH}/assets/extra-images/img-coment2.png"></a> </figure>
																<div class="text-box">
																<a href="#" class="comment-reply"><i class="icon-play"></i>Reply</a>
																  <h4>Sunshine Agency</h4>
																  <time datetime="2011-01-12">September 23, 2014, 08:59PM</time>
																  <p>Laughed wow lighted or harmful one beyond more ostrich lost impetuously robin fallaciously hello dolphin a flimsily nightingale quail underneath dear much cut essentially oppressively up and thus meretricious immense bet due egret conclusive that excepting with much through dear well kept.</p>
																</div>
															  </li>
															</ul>
														  </div>
														</li>
														<!-- #comment-## -->
														<li id="li-comment-52">
														  <div class="thumblist" id="comment-52">
															<ul>
															  <li>
																<figure> <a href="#"><img alt="#" src="${APP_PATH}/assets/extra-images/img-coment1.png"></a> </figure>
																<div class="text-box">
																<a href="#" class="comment-reply"><i class="icon-play"></i>Reply</a>
																  <h4>James Warson</h4>
																  <time datetime="2011-01-12">September 23, 2014, 08:59PM</time>
																  <p>Laughed wow lighted or harmful one beyond more ostrich lost impetuously robin fallaciously hello dolphin a flimsily nightingale quail underneath dear much cut essentially oppressively up and thus meretricious immense bet due egret conclusive that excepting with much through dear well kept.</p>
																</div>
															  </li>
															</ul>
														  </div>
														</li>
														<!-- #comment-## -->
													  </ul>
													</div>
													<div id="respond" class="comment-respond">
													  <h2>Leave us a comment</h2>
													  <form id="commentform" class="comment-form contact-form">
														<p class="comment-form-author">
															<label>
															<i class="icon-user2"></i>
															<input type="text" onfocus="if(this.value == 'Enter Your Name') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Enter Your Name'; }" value="Enter Your Name">
														  </label>
														</p>
														<p class="comment-form-email">
														   <label>
															 <i class="icon-envelope-o"></i>
															  <input type="text" class="cs-classic" onfocus="if(this.value == 'Email Address') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Email Address'; }" value="Email Address">
															</label>
														</p> 
														<p class="comment-form-website">
															<label>
															   <i class="icon-globe4"></i>
															  <input type="text" onfocus="if(this.value == 'Website') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Website'; }" value="Website">
															</label>
														</p>
														<p class="comment-form-comment fullwidt">
															<label>
															  <i class="icon-comments-o"></i>
															  <textarea placeholder="Enter Message"></textarea>
															</label>
														</p>
														<p class="form-submit">
															<input type="submit" class="form-style csbg-color" name="submit" value="Submit Message">
														</p>
													  </form>
													</div>
												</div>
												<div id="settings" class="tab-pane fade in" role="tabpanel">
													<div class="post-block summary-sec rich_editor_text">
														<span>Some effusive some misspelled groundhog rose temperate because well<br> pending much and considering hello far tremendous the imprecise grew less much jeepers breathless and hey</span>
														<p>Some effusive some misspelled groundhog rose temperate because well pending much and considering hello far tremendous the imprecise grew less much jeepers breathless and hey far more much belligerent hawk the placed warthog angrily outside goodness poutingly more gerbil much komodo far barring dependently but one hey reluctant salamander overrode this moth while in foresaw much handsomely ineffective muttered covetous a thanks that but moth well wherever less a rode abrasively oh much more steadily rid far immediate grouped vulgar jeez wanly.While far jeepers this much stared during ouch darn however unsociably and well because stole wonderfully goodness reciprocatingly much more overpaid deer.</p>
														<p>Some effusive some misspelled groundhog rose temperate because well pending much and considering hello far tremendous the imprecise grew less much jeepers breathless and hey far more much belligerent hawk the placed warthog angrily outside goodness poutingly more gerbil much komodo far barring dependently but one hey reluctant salamander overrode this moth while in foresaw much handsomely ineffective muttered covetous a thanks that but moth well wherever less a rode abrasively oh much more steadily,</p>
														<p>Some effusive some misspelled groundhog rose temperate because well pending much and considering hello far tremendous the imprecise grew less much jeepers breathless and hey far more much belligerent hawk the placed warthog angrily outside goodness poutingly more gerbil much komodo far barring dependently but one hey reluctant salamander. </p>
														<p>Some effusive some misspelled groundhog rose temperate because well pending much and considering hello far tremendous the imprecise grew less much jeepers breathless and hey far more much belligerent hawk the placed warthog angrily outside goodness poutingly more gerbil much komodo far barring dependently but one hey reluctant salamander overrode this moth while in foresaw much handsomely ineffective muttered covetous a thanks that but moth well wherever less a rode abrasively oh much more steadily,</p>
														<p>Some effusive some misspelled groundhog rose temperate because well pending much and considering hello far tremendous the imprecise grew less much jeepers breathless and hey far more much belligerent hawk the placed warthog angrily outside goodness poutingly more gerbil much komodo far barring dependently but one hey reluctant salamander.</p>
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
	</main>
	<!--// Main Content //--> 
	
	<!--// Footer Widget //-->
	<#include "common/footer.ftl">
	<!--// Footer Widget //--> 
	
	<!--// CopyRight //-->
	<#include "common/copyright.ftl">
	<!--// CopyRight //--> 
	
</div>
</body>
</html>
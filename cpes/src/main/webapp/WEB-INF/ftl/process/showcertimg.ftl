<div class="row">
	<div class="col-xs-12 col-sm-7 col-md-7 col-lg-8">
		<h1 class="page-title txt-color-blueDark"> 查看证件信息</h1>
	</div>
	<div class="col-xs-4 col-sm-7 col-md-7 col-lg-4">
		<button type="button" class="close"
			style="margin-right: 5px; margin-top: 5px;" data-dismiss="modal"
			aria-hidden="true">&times;</button>
	</div>
</div>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-2" data-widget-togglebutton="false" data-widget-editbutton="false" data-widget-deletebutton="false">
				<header>
					<h2>证件图</h2>
				</header>
				<div>
					<div class="widget-body fuelux" style="text-align: center;">
						<#list cis as ci>
						<div class="step-content">
							<h5>${ci.name}</h5>
							<img style="width: 600px;height: 400px;" src="${APP_PATH}/memberimgs/${ci.iconpath}">
						</div>
						</#list>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>
<script type="text/javascript">

	pageSetUp();

</script>

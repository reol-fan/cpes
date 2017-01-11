<style>
<!--
div.ColVis {
    float: left;
}
.text-center {
    text-align: center;
}
.dt-toolbar {
    padding-bottom: 6px;
}
input[type="checkbox"] {
  -webkit-appearance: none;
  -webkit-appearance: none;
  background: #fff url(${APP_PATH}/img/checkbox.png);
  background-repeat:no-repeat;
  background: none\0;
  *background: none;
  height: 22px;
  vertical-align: middle;
  width: 22px;
}

input[type="checkbox"]:focus,
input[type="checkbox"]:hover {
  background-position: -24px 0;
  outline: none;
}

input[type="checkbox"]:checked {
  background-position: -48px 0;
}

input[type="checkbox"][disabled] {
  background-position: -72px 0;
}

input[type="checkbox"][disabled]:checked {
  background-position: -96px 0;
}
table.dataTable thead>tr>th input {
    width:100%;
}
#certTable tbody td {
    line-height: 30px;
    font-size: 14px;
}
.qsi {
  -webkit-appearance: none;
  -webkit-appearance: none;
  background: #fff url(${APP_PATH}/img/spotlight.png) 3px 5px;
  background-repeat:no-repeat;
  background: none\0;
  *background: none;
  vertical-align: middle;
  padding-left: 24px;
}
-->
</style>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
        <h1 class="page-title txt-color-blueDark"> 资质信息一览
        </h1>
    </div>
</div>

<!-- widget grid -->
<section id="widget-grid" class="">

    <!-- row -->
    <div class="row">

        <!-- NEW WIDGET START -->
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-editbutton="false">
                <header>
                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                    <h2>查询列表</h2>
                </header>
                <div>
                    <div class="widget-body no-padding">
                        <table id="certTable" class="table table-striped table-bordered" width="100%">
                            <thead>
                                <tr>
                                    <th >证件名称</th>
                                    <th >商业公司</th>
                                    <th >工商户</th>
                                    <th >个人</th>
                                </tr>   
                            </thead>
                            <tbody>
                            <#list cis as ci>
                                <tr>
                                    <td >${ci.name}</td>
                                    <td ><input id="box-${ci.id}-0" type="checkbox" data-cert-id="${ci.id}" data-acc-type="0" /></td>
                                    <td ><input id="box-${ci.id}-1" type="checkbox" data-cert-id="${ci.id}" data-acc-type="1"/></td>
                                    <td ><input id="box-${ci.id}-2" type="checkbox" data-cert-id="${ci.id}" data-acc-type="2"/></td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<script type="text/javascript">
    pageSetUp();
    <#list acis as aci>
    	$("#box-${aci.ciid}-${aci.acctype}")[0].checked = true;
    </#list>
    
    $("#certTable :checkbox").click(function(){
    	var certid = $(this).attr("data-cert-id");
    	var acctype = $(this).attr("data-acc-type");
    	var flg = this.checked;
    	
	    $.ajax({
	    	url : "${APP_PATH}/system/cert/operation.do",
	    	type : "POST",
	    	data : {
	    		ciid : certid,
	    		acctype : acctype,
	    		flg : flg?"1":"0"
	    	},
	    	success : function(r){
	    		if (r.success) {
	
	    		} else {
	    			layer.msg(r.error, {time: 1500, icon:2, shift: 6});
				}
	    	}
	    });
    });
</script>

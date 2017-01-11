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
#processTable tbody td {
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
        <h1 class="page-title txt-color-blueDark"> 审核信息一览
        </h1>
    </div>
</div>
<div class="modal fade" id="remoteModal" tabindex="-1" data-backdrop="false" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
    <div class="modal-dialog" style="width:930px;height:400px;">  
        <div class="modal-content" style="padding: 5px;">
        </div>
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
                        <table id="processTable" class="table table-striped table-bordered" width="100%">
                            <thead>
                                <tr>
                                    <td style="width:44px">
                                        <input type="checkbox" id="checkall" />
                                    </td>
                                    <th style="width:36px">No</th>
                                    <th >用户姓名</th>
                                    <th >审核类型</th>
                                    <th >流程名称</th>
                                    <th >操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </article>
    </div>
<form id="fprocessFile" hidden="true" enctype="multipart/form-data" method="post">
	<input id="processFile" type="file" name="pdname"/>
</form>
</section>
<script type="text/javascript">
    var otable = null;

    pageSetUp();
    var pagefunction = function() {
    
        var responsiveHelper_datatable_fixed_column = undefined;
        
        var breakpointDefinition = {
            tablet : 1024,
            phone : 480
        };

    	var pageinitcfg = { ilength : 25, istart : 0 };
        if ( window.sessionStorage ) {
        	var json = window.sessionStorage.getItem("process/pagecfg");
        	var cfg = JSON.parse(json);
        	if ( cfg != null ) {
        		pageinitcfg = cfg;
        	}
        }
        
        otable = $('#processTable').DataTable({
            "bFilter": false,
            "bPaginate": true,
            "iDisplayLength":pageinitcfg.ilength,
            "iDisplayStart":pageinitcfg.istart,
            "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6 hidden-xs'l><'col-sm-6 col-xs-12 hidden-xs'T>r>"+
                "t"+
                "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12 'p>>",
            "autoWidth" : true,
            "preDrawCallback" : function(settings) {
                if (!responsiveHelper_datatable_fixed_column) {
                    responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#processTable'), breakpointDefinition);
                }
                
                var qurl = "${APP_PATH}/system/process/taskdatas.do";
                var p = "";
                settings.ajax = qurl + (p);
                return true;
            },
            "rowCallback" : function(nRow) {
                responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
            },
            "drawCallback" : function(oSettings) {
                responsiveHelper_datatable_fixed_column.respond();
                $("#processTable #checkall").click(function(){
                	var flg = this.checked;
                	$.each($("#processTable .data-check"), function(){
                		this.checked = flg;
                	});
                });
                
                $(".sorting_asc").removeClass("sorting_asc");
            },
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "前一页",
                "sNext": "后一页",
                "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据",
                "sProcessing": "数据加载中......"
            },
            "columns":[
                {"data":"id"},
                {"data":"index"},
                {"data":"membername"},
                {"data":"acctype"},
                {"data":"taskname"},
                null
            ],
            "aoColumnDefs":[
	             {
	                 "sClass": "text-center",
	                 "bSortable": false,
	                 "bSearchable": false,
	                 "mRender": function(data, type, full) {
	                	 return '<input type="checkbox" class="data-check" data-deployment-id="'+full.id+'" value="' + data + '" />';
	                 },
	                 "aTargets": [0]
	             },
                 {
                     "sClass": "text-center",
                     "bSortable": false,
                     "bSearchable": false,
                     "mRender": function(data, type, full) {
                         return data;
                     },
                     "aTargets": [1]
                 },
                 {
                     "sClass": "text-center",
                     "bSortable": false,
                     "bSearchable": false,
                     "mRender": function(data, type, full) {
                         return data;
                     },
                     "aTargets": [2]
                 },
                 {
                     "sClass": "text-center",
                     "bSortable": false,
                     "bSearchable": false,
                     "mRender": function(data, type, full) {
                         return data=="0"?"商业公司":data=="1"?"个体工商户":"个人经营";
                     },
                     "aTargets": [3]
                 },
                 {
                     "sClass": "text-center",
                     "bSortable": false,
                     "bSearchable": false,
                     "mRender": function(data, type, full) {
                         return data;
                     },
                     "aTargets": [4]
                 },
                 {
                     "sClass": "text-center",
                     "bSortable": false,
                     "bSearchable": false,
                     "mRender": function(data, type, full) {
                         return "<a class='btn btn-primary' href='${APP_PATH}/system/process/showcertimg.htm?memberid="+full.memberid+"' data-toggle='modal' data-target='#remoteModal' >获取待审核图</a>";
                     },
                     "aTargets": [5]
                 }
            ],
            "serverSide":true,
            "oTableTools": {
                "aButtons": [
                    {
                       "sExtends": "text",
                       "sButtonText": "<i class='fa fa-minus fa-fw'></i>批准",
                       "fnClick": function ( nButton, oConfig, oFlash ) {
                           var processs = $("#processTable .data-check:checked");
                           if ( processs.length == 0 ) {
                               layer.msg("请选择通过的审核信息", {time:1000, icon:5, shift:6});
                           } else {
                                var param = {};
                                $.each(processs, function(i, n){
                                   param["pids["+i+"]"] = $(n).attr("data-deployment-id");
                                   //param=param+"ids="+n.value+"&";
                                });
								layer.confirm('批准选择的审核信息, 是否继续?', {icon: 3, title:'提示'}, function(index){
									$.ajax({
										type : "POST",
										url  : "${APP_PATH}/system/process/certok.do",
										data : param,
										success : function(r) {
											if ( r.success ) {
												layer.msg("审核成功", {time: 1500, icon:1}, function(){
                                                    otable.draw();
                                                    $("#processTable #checkall")[0].checked = false;
												});
											} else {
												layer.msg("审核失败", {time: 1500, icon:2, shift: 6});
											}
										},
										error : function() {
											layer.msg("审核异常", {time: 1500, icon:2, shift: 6});
										}
									});
								});
                           }
                       },
                       "fnComplete": function ( nButton, oConfig, oFlash, sFlash ) {
                       },
                       "fnSelect": function ( nButton, oConfig, nRow ) {
                       }
                    },
                    {
                       "sExtends": "text",
                       "sButtonText": "<i class='fa fa-minus fa-fw'></i>未通过",
                       "fnClick": function ( nButton, oConfig, oFlash ) {
                           var processs = $("#processTable .data-check:checked");
                           if ( processs.length == 0 ) {
                               layer.msg("请选择需要淘汰的审核信息", {time:1000, icon:5, shift:6});
                           } else {
                                var param = {};
                                $.each(processs, function(i, n){
                                   param["pids["+i+"]"] = $(n).attr("data-deployment-id");
                                   //param=param+"ids="+n.value+"&";
                                });
								layer.confirm('淘汰选择的审核信息, 是否继续?', {icon: 3, title:'提示'}, function(index){
									$.ajax({
										type : "POST",
										url  : "${APP_PATH}/system/process/certfial.do",
										data : param,
										success : function(r) {
											if ( r.success ) {
												layer.msg("审核信息淘汰成功", {time: 1500, icon:1}, function(){
                                                    otable.draw();
                                                    $("#processTable #checkall")[0].checked = false;
												});
											} else {
												layer.msg("审核信息淘汰失败", {time: 1500, icon:2, shift: 6});
											}
										},
										error : function() {
											layer.msg("审核异常", {time: 1500, icon:2, shift: 6});
										}
									});
								});
                           }
                       },
                       "fnComplete": function ( nButton, oConfig, oFlash, sFlash ) {
                       },
                       "fnSelect": function ( nButton, oConfig, nRow ) {
                       }
                  }
               ],
               "sSwfPath": "${APP_PATH}/js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
            }
        });
    };
    
    loadScript("${APP_PATH}/js/plugin/datatables/jquery.dataTables.min.js", function(){
        loadScript("${APP_PATH}/js/plugin/datatables/dataTables.colVis.min.js", function(){
            loadScript("${APP_PATH}/js/plugin/datatables/dataTables.tableTools.min.js", function(){
                loadScript("${APP_PATH}/js/plugin/datatables/dataTables.bootstrap.min.js", function(){
                    loadScript("${APP_PATH}/js/plugin/datatable-responsive/datatables.responsive.min.js", pagefunction)
                });
            });
        });
    });
</script>

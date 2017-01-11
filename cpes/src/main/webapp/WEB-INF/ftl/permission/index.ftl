<link rel="stylesheet" type="text/css" media="screen" href="${APP_PATH}/js/plugin/ztree/zTreeStyle.css">
<div class="modal fade" id="remoteModal" tabindex="-1" data-backdrop="false" role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true">  
    <div class="modal-dialog" style="width:930px;height:400px;">  
        <div class="modal-content" style="padding: 5px;">
        </div>
    </div>  
</div>
<div class="row">
    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-8">
        <h1 class="page-title txt-color-blueDark"><!-- PAGE HEADER -->
            许可维护
        </h1>
    </div>
</div>
<!-- widget grid -->
<section id="widget-grid" class="">

    <!-- row -->
    <div class="row">

        <!-- NEW WIDGET START -->
        <article id="treeArt" class="col-sm-12 col-md-12 col-lg-12">
            <div class="jarviswidget jarviswidget-color-darken" data-widget-togglebutton="true" id="wid-id-1" data-widget-deletebutton="false" data-widget-editbutton="false">
                <header>
                    <h2><i class="fa fa-sitemap"></i>查询列表 </h2>
                </header>
                <div>
               	 	<div class="widget-body no-padding">
                   	 	<!-- 
                        <a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="xxxxx.htm?level='+treeNode.level+'&id='+treeNode.id+'" data-toggle="modal" data-target="#remoteModal">
                    	 -->
                    	 <ul id="treeDemo" class="ztree"></ul>
                     </div>
                </div>
            </div>
        </article>
    </div>
</section>
<script>
	pageSetUp();
	
	loadScript("${APP_PATH}/js/plugin/ztree/jquery.ztree.all-3.5.min.js", function(){
		var setting = {};
		
		setting = {
			view: {
				selectedMulti: false,
				addDiyDom: function(treeId, treeNode){
					var icoObj = $("#" + treeNode.tId + "_ico");
					if ( treeNode.icon ) {
						icoObj.removeClass("button ico_docu ico_open").addClass("fa fa-fw " + treeNode.icon).css("background","");
						if ( treeNode.useable == '1' ) {
							var aObj = $("#" + treeNode.tId + "_a");
							aObj.css("color", "#B0B0B0");
						}
					}
				},
				addHoverDom: function(treeId, treeNode){
					var aObj = $("#" + treeNode.tId + "_a");
					if (treeNode.editNameFlag || $("#btnGroup"+treeNode.tId).length>0) return;
					var s = '<span id="btnGroup'+treeNode.tId+'">';
					if ( treeNode.level == 0 ) {
						s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="permission/add.htm?level='+treeNode.level+'&pid='+treeNode.id+'" data-toggle="modal" data-target="#remoteModal">&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
					} else if ( treeNode.level == 1 ) {
						s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="permission/edit.htm?level='+treeNode.level+'&id='+treeNode.id+'" data-toggle="modal" data-target="#remoteModal" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
						if (treeNode.children.length == 0) {
							s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deletePermission(\''+treeNode.name+'\', '+treeNode.id+')">&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
						}
						s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="permission/add.htm?level='+treeNode.level+'&pid='+treeNode.id+'" data-toggle="modal" data-target="#remoteModal">&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
					} else if ( treeNode.level == 2 ) {
						s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" href="permission/edit.htm?level='+treeNode.level+'&id='+treeNode.id+'" data-toggle="modal" data-target="#remoteModal" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
						s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deletePermission(\''+treeNode.name+'\', '+treeNode.id+')">&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
					}
		
					s += '</span>';
					aObj.after(s);
				},
				removeHoverDom: function(treeId, treeNode){
					$("#btnGroup"+treeNode.tId).remove();
				}
			},
			async: {
				enable: true,
				url:"${APP_PATH}/system/permission/tree.do",
				autoParam:["id", "name=n", "level=lv"]
			},
			callback: {
				onClick : function(event, treeId, json) {

				}
			}
		};
		
		$.fn.zTree.init($("#treeDemo"), setting);
	});
	
	function deletePermission(name,id){
		layer.confirm("你确定要删除【"+name+"】吗？",  {icon: 3, title:'确认删除'}, function(cindex){
		    layer.close(cindex);
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/system/permission/delete.do",
				data : {"id" : id},
				success : function(r){
					if(r.success){
						var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
						treeObj.reAsyncChildNodes(null,"refresh");
					} else {
						layer.msg(r.error,{time:2000,icon:5,shift:6});
					}
				}
			});
		}, function(cindex){
		    layer.close(cindex);
		});
		
	}
</script>
<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include  file ="../public.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css" href="${ctx }/app/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/app/css/H-ui.admin.css" />
<title>新建网站角色 - 管理员管理 - H-ui.admin v3.0</title>

</head>
<body>
<article class="cl pd-20">
	<form action="${ctx }/app/user/save" method="post" class="form form-horizontal" id="form-admin-role-add">
	<input type="hidden" value=${role.id } name="id" id="id"/>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${role.name} " placeholder="" id="name" name="name" datatype="*4-16" nullmsg="用户账户不能为空">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${role.desc}" placeholder="" id="desc" name="desc">
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx }/app/js/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx }/app/js/layer.js"></script> 
<script type="text/javascript" src="${ctx }/app/js/H-ui.js"></script> 

<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx }/app/js/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${ctx }/app/js/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${ctx }/app/js/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
	
	$("#form-admin-role-add").validate({
		rules:{
			name:{
				required:true,
			},
			desc:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type:'post',
				dataType:'json',
				url: "${ctx }/app/user/save",
				success:function(data){
					if (data && data.code == '0'){
						layer.msg(data.msg,{icon:1,time:2000});
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);						
					}else {
						layer.msg(data.msg,{icon:1,time:1000});
					}
				},
				error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:1,time:1000});
				}
			});
		}
	});		
});

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
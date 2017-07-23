<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="../public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/app/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/app/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/app/css/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/app/css/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx }/app/css/style.css" />
<title>角色管理 - 管理员管理 - H-ui.admin v3.0</title>
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl">
				<a class="logo navbar-logo f-l mr-10 hidden-xs"
					href="/aboutHui.shtml">H-ui.admin</a> <a
					class="logo navbar-logo-m f-l mr-10 visible-xs"
					href="/aboutHui.shtml">H-ui</a> <span
					class="logo navbar-slogan f-l mr-10 hidden-xs">v3.0</span> <a
					aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
					href="javascript:;">&#xe667;</a>

				<nav id="Hui-userbar"
					class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li>超级管理员</li>
						<li class="dropDown dropDown_hover"><a href="#"
							class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
								<li><a href="#">切换账户</a></li>
								<li><a href="#">退出</a></li>
							</ul></li>
						<li id="Hui-msg"><a href="#" title="消息"><span
								class="badge badge-danger">1</span><i class="Hui-iconfont"
								style="font-size: 18px">&#xe68a;</i></a></li>
						<li id="Hui-skin" class="dropDown right dropDown_hover"><a
							href="javascript:;" class="dropDown_A" title="换肤"><i
								class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="default"
									title="默认（黑色）">默认（黑色）</a></li>
								<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
								<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!--/_header 作为公共模版分离出去-->

	<!--_menu 作为公共模版分离出去-->
	<aside class="Hui-aside">

		<div class="menu_dropdown bk_2">

			<dl id="menu-admin">
				<dt class="selected">
					<i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd style="display: block;">
					<ul>
						<li class="current"><a href="${ctx}/app/user/userlist"
							title="角色管理">角色管理</a></li>

					</ul>
				</dd>
			</dl>

		</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<!--/_menu 作为公共模版分离出去-->

	<section class="Hui-article-box">
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			管理员管理 <span class="c-gray en">&gt;</span> 角色管理 <a
				class="btn btn-success radius r"
				style="line-height: 1.6em; margin-top: 3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">刷新</i></a>
		</nav>
		<div class="Hui-article">
			<article class="cl pd-20">
				<div class="cl pd-5 bg-1 bk-gray">
					<span class="l"> <a href="javascript:;" onclick="datadel()"
						class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
							批量删除</a> <a class="btn btn-primary radius" href="javascript:;"
						onclick="admin_role_add('添加角色','${ctx}/app/user/adduser','350','250')"><i
							class="Hui-iconfont">&#xe600;</i> 添加角色</a>
					</span> <span class="r">共有数据：<strong>${size }</strong> 条
					</span>
				</div>
				<div class="mt-10">
					<table
						class="table table-border table-bordered table-hover table-bg">
						<thead>
							<tr>
								<th scope="col" colspan="6">角色管理</th>
							</tr>
							<tr class="text-c">
								<th width="25"><input type="checkbox" value="" name=""></th>
								<th width="40">ID</th>
								<th width="200">角色名</th>
								<th width="300">描述</th>
								<th width="70">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${roles }" var="role">
								<tr class="text-c">
									<td><input type="checkbox" value="" name=""></td>
									<td>${role.id}</td>
									<td>${role.name}</td>
									<td>${role.desc}</td>
									<td class="f-14"><a title="编辑" href="javascript:;"
										onclick="admin_role_edit('角色编辑','${ctx}/app/user/adduser?id=${role.id}','${role.id}')"style="text-decoration: none"><i
											class="Hui-iconfont">&#xe6df;</i></a> <a title="删除"
										href="javascript:;" onclick="admin_role_del(this,'${role.id}')"
										class="ml-5" style="text-decoration: none"><i
											class="Hui-iconfont">&#xe6e2;</i></a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</article>
		</div>
	</section>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="${ctx }/app/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/app/js/layer.js"></script>
	<script type="text/javascript" src="${ctx }/app/js/H-ui.js"></script>
	<script type="text/javascript" src="${ctx }/app/js/H-ui.admin.page.js"></script>
	<!--/_footer /作为公共模版分离出去-->

	<script type="text/javascript"
		src="${ctx }/app/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${ctx }/app/js/laypage.js"></script>
	<script type="text/javascript">
		/*管理员-角色-添加*/
		function admin_role_add(title, url, w, h) {
			layer.open({
				type: 2,
				area: [w+'px', h +'px'],
				fix: false, //不固定
				maxmin: true,
				shade:0.4,
				title: title,
				content: url,
				end: function(){
					location.reload();
				}
			});
		}
		
		function datadel(){
			var items = $("input[name=delcbx]:checked");
			var result = [];
			$.each(items, function(index, item) {
				result.push(item.value);
			});
			result = result.join(",");
			layer.confirm('确认要删除吗？',function(index){
				$.ajax({
					type: 'POST',
					data: {
		                "id": result
		            },
					url: '${ctx}/app/user/delRole',
					dataType: 'json',
					success: function(data){
						if (data && data.code == '0') {
							$("input[name=delcbx]:checked").parents("tr").remove();
							layer.msg('已删除!',{icon:1,time:1000});
						}else{
							layer.msg(data.msg,{icon: 5,time:1000});
						}
						
					},
					error:function(data) {
						console.log(data.msg);
					},
				});		
			});
		}
		
		/*管理员-角色-编辑*/
		function admin_role_edit(title,url,w,h){
			layer.open({
				type: 2,
				area: [500+'px',500+ 'px'],
				fix:false,
				maxmin:true,
				shade:0.4,
				title:title,
				content:url,
				end:function(){
					location.reload();		
				}
			});
		}
		/*管理员-角色-删除*/
		function admin_role_del(obj,id){
			layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
				$.ajax({
					type: 'POST',
					url: '${ctx }/app/user/delRole?id=' + id,
					dataType: 'json',
					success: function(data){
						if (data && data.code == '0') {
							$(obj).parents("tr").remove();
							layer.msg('已删除!',{icon:1,time:1000});
						}else{
							layer.msg('删除失败!',{icon:1,time:1000});
						}
						
					},
					error:function(data) {
						console.log(data.msg);
					},
				});	
				
			});
		}

		
		
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
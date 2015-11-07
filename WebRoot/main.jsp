<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>DefectTrace</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.4/themes/icon.css">
	<script type="text/javascript" src="jquery-easyui-1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
  	<script type="text/javascript">
	$(function(){
		// 数据
		var treeData=[
		{
			text:"创建缺陷报告",
			attributes:{
				url:""
			}
		},
		{
			text:"缺陷状态",
			children:[{
				text:"待提交",
				attributes:{
					url:""
				}
			},{
				text:"已提交",
				attributes:{
					url:""
				}
			},{
				text:"待确认",
				attributes:{
					url:""
				}
			}]
		}];
		
		// 实例化树菜单
		$("#tree").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:text
				});
			}
		}
	});
	</script>
  </head>
  
  <body class="easyui-layout">
    <div region="north" style="height:80px "><font color="pink" size="30">缺陷跟踪系统</font></div>
  	<div region="center">
  		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" >
				<div align="center" style="padding-top: 150px;"><font color="blue" size="10">欢迎使用</font></div>
			</div>
		</div>
  	</div>
  	<div data-options="region:'west',split:true" title="导航" style="width:200px;">
  		<ul id="tree"></ul>
  	</div>
  	<div region="south" style="height:30px " align="center">版权所有:wqs、fzy、lky</div>
  	
  	
  </body>
</html>

<%@ page import="po.Securitys" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>所有订单</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- page style -->
    <style>

    </style>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/bootstrap/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/font-awesome/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/Ionicons/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/user/css/datatables.net-bs/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/AdminLTE/AdminLTE.min.css">
    <!-- AdminLTE Skin -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/AdminLTE/skin/skin-blue.min.css">
    <!-- Google Font -->

    <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%
    String name = (String) request.getSession().getAttribute("admin_name");
    if (name == null) {
        response.getWriter().write("<script>alert('警告！请登录，点击返回返回登录页面！')</script>");
        response.setHeader("refresh", "0.1;url=" + request.getContextPath() + "/admin/page/login.html");
    }
%>
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a class="logo" href="../admin/page/index.jsp">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>证券</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">证券交易系统</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">导航切换</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <!-- /.messages-menu -->
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="${pageContext.request.contextPath}/user/img/setting.png" class="user-image"
                                 alt="User Image">
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs"><%= name%></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                                <img src="${pageContext.request.contextPath}/user/img/word.jpg" class="img-circle"
                                     alt="User Image">
                                <p>让学习成为一种习惯</p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="../admin/page/password-change.html" class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a class="btn btn-default btn-flat" href="/Security_war_exploded/servlet/ServletDestroyLogin">退出</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar Menu -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">&nbsp;</li>
                <!-- Optionally, you can add icons to the links -->
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>证券管理</span>
                        <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="/Security_war_exploded/servlet/ServletAdminFindAllSecurity">所有证券</a></li>
                        <li><a href="/Security_war_exploded/servlet/ServletAdminAllDeal">交易证券</a></li>
                        <li><a href="security_add.jsp">添加证券</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>用户管理</span>
                        <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="/Security_war_exploded/servlet/ServletAdminAllUser">所有用户</a></li>
                        <li><a href="add_user.jsp">添加用户</a></li>
                    </ul>
                </li>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1><small></small></h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-dashboard">&nbsp;证券查看</i></li>
                <li class="active">所有证券</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid" style="margin-top: 20px;">
            <div class="box box-primary">

                <div class="box-body">
                    <table id="my_order" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>证券代码</th>
                            <th>公司简称</th>
                            <th>上市时间</th>
                            <th>证券单价</th>
                            <th>余量状态</th>
                            <th>其他操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        
                        <%

                            ArrayList<Securitys> list = (ArrayList<Securitys>) request.getAttribute("list");
                            //out.print("<script>alert('"+list.isEmpty()+"')</script>");
                            //add(ele)   get(index)
                            for (int i = 0; i < list.size(); i++) {
                                Securitys securitys = list.get(i);
                                //out.print("<script>alert('"+securitys.getRid()+"')</script>");
                                if (i % 10 == 0) {

                        %>

                        <tr role="row" class="odd"><!--一行的开始  -->
                            <%} %>
                            <td><%= securitys.getSecuritys_id()%></td>
                            <td><%= securitys.getSecuritys_short()%>
                            <td><%= securitys.getSecuritys_appeardata()%>
                            <td>￥<%= securitys.getSecuritys_unitprice()%>
                            <%if (securitys.getSecuritys_residualquantity()<=(securitys.getSecuritys_totalquantity())/4) {%>
                            <td><span class="label bg-red"><%= securitys.getSecuritys_residualquantity()%>/<%= securitys.getSecuritys_totalquantity()%></span></td>
                            <% }%>
                            <%if (securitys.getSecuritys_residualquantity()>(securitys.getSecuritys_totalquantity())/4&&securitys.getSecuritys_residualquantity()<=(securitys.getSecuritys_totalquantity())/2) {%>
                            <td><span class="label bg-yellow"><%= securitys.getSecuritys_residualquantity()%>/<%= securitys.getSecuritys_totalquantity()%></span></td>
                            <% }%>
                            <%if (securitys.getSecuritys_residualquantity()>(securitys.getSecuritys_totalquantity())/2&&securitys.getSecuritys_residualquantity()<=((securitys.getSecuritys_totalquantity())/4)*3) {%>
                            <td><span class="label bg-aqua"><%= securitys.getSecuritys_residualquantity()%>/<%= securitys.getSecuritys_totalquantity()%></span></td>
                            <% }%>
                            <%if (securitys.getSecuritys_residualquantity()>((securitys.getSecuritys_totalquantity())/4)*3) {%>
                            <td><span class="label bg-green"><%= securitys.getSecuritys_residualquantity()%>/<%= securitys.getSecuritys_totalquantity()%></span></td>
                            <% }%>
                            <td><a href="${pageContext.request.contextPath}/servlet/ServletAdminFindOneSecurity?securitys_id=<%= securitys.getSecuritys_id()%>">详情</a></td>

                        </tr>

                        <%
                            if (i % 10 == 9) {
                        %>
                        <!--一行的结束  -->


                        <%
                                }

                            }
                        %>

                        </tbody>
                        <tfoot>
                        <tr>
                            <th>证券代码</th>
                            <th>公司简称</th>
                            <th>上市时间</th>
                            <th>证券单价</th>
                            <th>余量状态</th>
                            <th>其他操作</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            缔造年轻人的中国梦
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2021 <span>gues</span>.</strong> All rights reserved.
    </footer>

    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
    immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/user/js/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/user/js/bootstrap/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/user/js/datatables.net/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/user/js/datatables.net-bs/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/user/js/AdminLTE/adminlte.min.js"></script><!-- moment -->
<!-- <script src="${pageContext.request.contextPath}/user/js/moment/moment.min.js"></script> -->
<!-- page script -->
<script>
    $(function () {
        $('#my_order').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': false,
            'info': true,
            'autoWidth': false,
            'pagingType': 'full_numbers'/*,
     'processing': true,
     'serverSide': true,
     'ajax': '${pageContext.request.contextPath}/user/servlet/all-order',
     'columns': [
    	    { 'data': 'orderId' },// 订单编号219
    	    { 'data': 'sta' , 'render': function (data, type, row, meta) {
    	    	var content = null;
    	    	switch(meta.row%4){
    	    		case 0:content = '<span class="label bg-yellow">'+data+'</span>';break;
    	    		case 1:content = '<span class="label bg-aqua">'+data+'</span>';break;
    	    		case 2:content = '<span class="label bg-green">'+data+'</span>';break;
    	    		case 3:content = '<span class="label bg-red">'+data+'</span>';break;
    	    	}
    	    	return content;
		      }
		    },// 订单状态<span class="label bg-red">已交付</span>
    	    { 'data': 'placed' , 'render': function (data, type, row, meta) {
	    	    	return moment(data).format('YYYY-MM-DD HH:mm');
		    	}
	    	},// 创建时间2014-11-7 11:31
    	    { 'data': 'payment' , 'render': function (data, type, row, meta) {
	    	    	return '￥'+data.toFixed(2);
    	    	}
    	    },// 订单总额￥10.70
    	    { 'data': 'sta' , 'render': function (data, type, row, meta) {
    	    	var content = '<a href="${pageContext.request.contextPath}/user/servlet/order-detail?orderId='+row.orderId+'">查看</a>丨';
    	    	if(data=='已交付'){
    	    		content+='处理';
    	    	}else{
    	    		content+='<a href="${pageContext.request.contextPath}/user/servlet/order-process?orderId='+row.orderId+'">处理</a>';
    	    	}
    	    	return content;
	    	  }
	    	}// 可选操作<a href="#">查看</a>丨处理
    	  ]
	 */
        })
    })
</script>
</body>
</html>

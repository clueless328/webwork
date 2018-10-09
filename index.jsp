<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宿舍信息管理系统</title>
</head>
<body>
<br>
<br>
<br>
<br>
<div style="text-align:center">
<a href="add.jsp">添加宿舍信息</a>
</div>
<br>
<br>
<table align=center width=500 border=1>
	<tr><td>学号</td><td>姓名</td><td>性别</td><td>年龄</td><td>查询</td><td>管理</td></tr>
<jsp:useBean id="db" class="pack.dorm" scope="page"/>
	
	<%
	String s="select * from people";
	ResultSet rs=db.executeQuery(s);
	while(rs.next())
	{
	String name=rs.getString("姓名");
	out.print("<tr><td>"+rs.getString("学号")+"</td><td>"+rs.getString("性别")+"</td><td>"+rs.getString("性别")+"</td><td>"+rs.getString("年龄")+"</td><td><a href='amend.jsp?name="+name+"'>修改</a>&nbsp;<a href='delete.jsp?name="+name+"'>删除</a>"+"</td><td><a href='address.jsp?name="+name+"'>宿舍地址信息</a></td></tr>");
	}
	rs.close();
	db.close();
	%>
	</table>
</body>
</html>
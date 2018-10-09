<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
%>
<br>
<br>
<br>
<br>
<br>
<br>
<table align=center width=500 border=1>
	<tr><td>姓名</td><td>宿舍地址</td><td>宿舍号</td><td>床号</td><td>管理</td></tr>
<jsp:useBean id="db" class="pack.dorm" scope="page"/>
	
	<%
	String s="select * from address where 姓名='"+name+"'";
	ResultSet rs=db.executeQuery(s);
	while(rs.next())
	{
	String address=rs.getString("宿舍地址");
	out.println("<tr><td>"+rs.getString("姓名")+"</td><td>"+rs.getString("宿舍地址")+"</td><td>"+rs.getString("宿舍号")+"</td><td>"+rs.getString("床号")+"</td><td><a href='bed.jsp?address="+address+"'>网关</a></td></tr>");
	}
	rs.close();
	db.close();
	%>
	</table>
	<br>
<br>
<form name="form" id="form" action="index.jsp">
<div style="text-align:center">
 <input name="" type="submit" value="返回主界面"/>
 </div>
</form>
</body>
</html>
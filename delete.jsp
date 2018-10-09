<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="error.jsp" %>
<html>
<head>
<title>删除宿舍信息</title>
</head>
<body>
<jsp:useBean id="db" class="pack.dorm" scope="page"/>
<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
ResultSet rs1=db.executeQuery("select * from address where 姓名='"+name+"'");
rs1.next();
String address=rs1.getString("宿舍地址");
	int i1=db.executeUpdate("delete from people where 姓名='"+name+"'");
	int i2=db.executeUpdate("delete from address where 姓名='"+name+"'");
	int i3=db.executeUpdate("delete from susheinfo where 宿舍地址='"+address+"'");
	if(i1==1&&i2==1&&i3==1)
		{out.println("<script language='javaScript'> alert('删除成功，点击确定后自动跳到主页！');</script>");
		response.setHeader("refresh","1;url=index.jsp");
		}
		
	else{
		out.println("<script language='javaScript'> alert('删除失败，点击确定后自动跳到主页！');</script>");
		response.setHeader("refresh","1;url=index.jsp");
		}
     db.close();
%>
</body>
</html>

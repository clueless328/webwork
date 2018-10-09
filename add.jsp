<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="error.jsp" %>
<html>
<head>
<title>添加宿舍信息</title>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<form action="add.jsp" method="post">
<table width="50%"  border="1" align="center">
<CAPTION>添加宿舍成员信息</CAPTION>
  <tr>
    <th width="30%">姓名：</th>
    <td width="70%"><input name="pname" type="text"></td>
  </tr>
  <tr>
    <th>学号：</th>
    <td><input name="psno" type="text"></td>
  </tr>
  <tr>
    <th>性别：</th>
    <td><input name="psex" type="text"></td>
  </tr>
  <tr>
    <th>年龄：</th>
    <td><input name="pag" type="text"></td>
  </tr>
   <tr>
    <th>宿舍号：</th>
    <td><input name="pnum" type="text"></td>
  </tr>
  <tr>
    <th>宿舍地址：</th>
    <td><input name="padd" type="text"></td>
  </tr>
  <tr>
    <th>床号：</th>
    <td><input name="cno" type="text"></td>
  </tr>
  <tr>
    <th>宿舍人数：</th>
    <td><input name="pall" type="text"></td>
  </tr>
  <tr>
    <th>网关地址：</th>
    <td><input name="wd" type="text"></td>
  </tr>
  <tr>
    <th>网费：</th>
    <td><input name="wf" type="text"></td>
  </tr>
  <tr>
    <th colspan="2">
    <input type="submit" name="submit" value="添加">
    <input type="reset" value="重置">
    </th>
  </tr>
</table>
</form>
<jsp:useBean id="db" class="pack.dorm" scope="page"/>

<%
request.setCharacterEncoding("UTF-8");
String submit=request.getParameter("submit");
if(submit!=null&&!submit.equals(""))
{
	String  psno=request.getParameter("psno");
	String  pname=request.getParameter("pname");
	String  psex=request.getParameter("psex");
	String  pag=request.getParameter("pag");
	String  padd=request.getParameter("padd");
	String  pnum=request.getParameter("pnum");
	String  cno=request.getParameter("cno");
	String  pall=request.getParameter("pall");
	String  wd=request.getParameter("wd");
	String  wf=request.getParameter("wf");
	if(!psno.equals("")&&!pname.equals("")&&!psex.equals("")&&!pag.equals("")&&!padd.equals("")&&!pnum.equals("")&&!cno.equals("")&&!pall.equals("")&&!wd.equals("")&&!wf.equals(""))
	{
	String sql1="insert into people(学号,姓名,性别,年龄) values('"+psno+"','"+pname+"','"+psex+"','"+pag+"')";
	int i1=db.executeUpdate(sql1);
	String sql2="insert into address(姓名,宿舍地址,宿舍号,床号) values('"+pname+"','"+padd+"','"+pnum+"','"+cno+"')";
	int i2=db.executeUpdate(sql2);
	String sql3="insert into susheinfo(网关地址,宿舍号,网费) values('"+wd+"','"+pnum+"','"+wf+"')";
	int i3=db.executeUpdate(sql3);
	if(i1==1&&i2==1&&i3==1)
	{
	out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");
	response.setHeader("refresh","1;url=index.jsp");
	}
	else
	{
	out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");
	response.setHeader("refresh","1;url=add.jsp");
	}
	db.close();
	}
	else
	{
		out.println("<script language='javaScript'> alert('请将内容填充完整！不允许空值');</script>");
		response.setHeader("refresh","1;url=add.jsp");
	}
}
%>
</body>
</html>

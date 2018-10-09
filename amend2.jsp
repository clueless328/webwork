<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" errorPage="error.jsp"%>
<html>
  <head>
    <title>修改完成</title>
 </head>
  <body>
  <br>
<br>
<br>
<br>
<br>
   <jsp:useBean id="db" class="pack.dorm" scope="page"/>
  <%
    request.setCharacterEncoding("UTF-8");
  	String  psno=request.getParameter("psno");
	String  pname=request.getParameter("pname");
	String  psex=request.getParameter("psex");
	String  pag=request.getParameter("pag");
	String  padd=request.getParameter("padd");
	String  pnum=request.getParameter("pnum");
	String  cno=request.getParameter("cno");
	String  wd=request.getParameter("wd");
	String  wf=request.getParameter("wf");

	System.out.println(psno+pname+psex+pag+padd+pnum+cno+wd+wf);
	if(!psno.equals("")&&!pname.equals("")&&!psex.equals("")&&!pag.equals("")&&!padd.equals("")&&!pnum.equals("")&&!cno.equals("")&&!wd.equals("")&&!wf.equals(""))
	{
		//String sql1="insert into people(学号,姓名,性别,年龄) values('"+psno+"','"+pname+"','"+psex+"','"+pag+"')";
		String sql1="update people set 姓名='"+pname+"',性别='"+psex+"',年龄="+pag+" where 学号="+psno+";";
		int i1=db.executeUpdate(sql1);
		//String sql2="insert into address(姓名,宿舍地址,宿舍号,床号) values('"+pname+"','"+padd+"','"+pnum+"','"+cno+"')";
		String sql2="update address set 姓名='"+pname+"',宿舍地址='"+padd+"',床号="+cno+" where 宿舍号="+pnum+";";
		pack.dorm db2=new pack.dorm();
		int i2=db2.executeUpdate(sql2);
		//String sql3="insert into susheinfo(宿舍地址,宿舍号,宿舍人数) values('"+padd+"','"+pnum+"','"+pall+"')";
		String sql3="update susheinfo set 网关地址='"+wd+"',宿舍号="+pnum+",网费="+wf+" where 宿舍号="+pnum+";";
		pack.dorm db3=new pack.dorm();
		int i3=db3.executeUpdate(sql3);
		System.out.println(i1);
		System.out.println(i2);
		System.out.println(i3);
		System.out.println(sql1);
		System.out.println(sql2);
		System.out.println(sql3);
		if(i1==1&&i2==1&&i3==1)
		{
		out.println("<script language='javaScript'> alert('修改成功,点击确定跳转到主页!');</script>");
		response.setHeader("refresh","1;url=index.jsp");
		}
		else
		{
		out.println("<script language='javaScript'> alert('修改失败，点击确定返回添加页面！');</script>");
		response.setHeader("refresh","1;url=index.jsp");
		}
		db.close();
	}
	else
	{
		out.println("<script language='javaScript'> alert('请将内容填充完整！不允许空值');</script>");
		response.setHeader("refresh","1;url=index.jsp");
	}
   %>
  </body>
</html>

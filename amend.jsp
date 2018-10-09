<%@ page import="java.sql.*" pageEncoding="UTF-8" errorPage="error.jsp"%>
<html>
  <head>
    <title>修改宿舍信息</title>
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
  String name=request.getParameter("name");
  ResultSet rs1=db.executeQuery("select * from people where 姓名='"+name+"'");
  rs1.next();
  %>
  <form action="amend2.jsp" method="post">
  <table width="50%" border="1" align="center">
	<CAPTION>修改宿舍成员信息</CAPTION>
	  <tr>
	    <th width="30%">学号：</th>
	    <td><input name="psno" type="text" value="<%=rs1.getString("学号")%>"></td>
	  </tr>
	  <tr>
	    <th >姓名：</th>
	    <td><input name="pname" type="text" value="<%=rs1.getString("姓名")%>"></td>
	  </tr>
	  <tr>
	    <th >性别：</th>
	    <td><input name="psex" type="text" value="<%=rs1.getString("性别")%>"></td>
	  </tr>
	  <tr>
	    <th>年龄：</th>
	    <td><input name="pag" type="text" value="<%=rs1.getString("年龄")%>"></td>
	  </tr>
	 
	  <%  
	  ResultSet rs2=db.executeQuery("select * from address where 姓名='"+name+"'");
	  rs2.next();
	  String address=rs2.getString("宿舍号");
	  %>
	  <tr>
	    <th>宿舍号：</th>
	    <td><input name="pnum" type="text" value="<%=rs2.getString("宿舍号")%>"></td>
	  </tr>
	  <tr>
	    <th>宿舍地址：</th>
	    <td><input name="padd" type="text" value="<%=rs2.getString("宿舍地址")%>"></td>
	  </tr>
	  <tr>
	    <th>床号：</th>
	    <td><input name="cno" type="text" value="<%=rs2.getString("床号")%>"></td>
	  </tr>
	  <%
	  ResultSet rs3=db.executeQuery("select * from susheinfo where 宿舍号='"+address+"'");
	  rs3.next(); 
	  %>
	   <tr>
	    <th>网关地址：</th>
	    <td><input name="wd" type="text" value="<%=rs3.getString("网关地址")%>"></td>
	  </tr>
	  <tr>
	    <th>网费：</th>
	    <td><input name="wf" type="text" value="<%=rs3.getString("网费")%>"></td>
	  </tr>
	  <tr>
	    <th colspan="2">
	    <input type="hidden" name="name" value="<%=name%>">
	    <input type="hidden" name="address" value="<%=address%>">
	    <input type="submit" value="修改">
	    <input type="reset" value="重置">
	    </th>
	  </tr>
	</table>
</form>
<%
  db.close();
 %>
</body>
</html>

<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<%@ page import="cn.ddvudo.stuman.*" %>
<html>

<head>

  <link rel="stylesheet" type="text/css" href="../mystyle.css">

<title>添加学生信息</title>

</head>

<body>

 

<form action="add.jsp" method="post">

<table align="center" width="50%"  border="1" >

<caption style="font-size: 24px">添加学生信息</caption>

  <tr>

    <th width="30%" height="123" style="font-size: 24px">学号：</th>

    <td width="70%"><input name="number" type="text"></td>

  </tr>

  <tr>

    <th height="95" style="font-size: 24px">姓名：</th>

    <td><input name="name" type="text"></td>

  </tr>

   <tr>

    <th height="99" style="font-size: 24px">性别：</th>

    <td><input name="sex" type="text"></td>

  </tr>

   <tr>

    <th height="107" style="font-size: 24px">成绩：</th>

    <td><input name="date" type="text"></td>

  </tr>


  <tr>

    <th colspan="2">

    <input type="submit" name="submit" value="添加">

    <input type="reset"  value="重置">

    </th>

  </tr>

</table>

</form> 
<jsp:useBean id="student" class="cn.ddvudo.stuman.addStu" scope="session"/>
<%

request.setCharacterEncoding("utf-8");

String submit=request.getParameter("submit");

if(submit!=null&&!submit.equals(""))

{

String  oid=request.getParameter("number");

String  oname=request.getParameter("name");

String  osex=request.getParameter("sex");

String  ograde=request.getParameter("date");

student.setId(oid);
student.setName(oname);
student.setSex(osex);
student.setGrade(ograde);
response.setHeader("refresh","1;url=add2.jsp");
}

%>

</body>

</html>

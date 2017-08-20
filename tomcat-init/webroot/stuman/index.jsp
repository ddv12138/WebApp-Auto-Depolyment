<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<html>

  <head>

    <link rel="stylesheet" type="text/css" href="stucss.css">
	<link rel="stylesheet" type="text/css" href="../mystyle.css">

    <title>学生管理系统</title>

 </head>

  <body>

<center><h1>学生成绩管理系统</h1></center>

<table align="center" width="50%"  border="1">

<tr><th height="50" style="font-size: 16px">学号</th><th style="font-size: 16px">姓名</th><th style="font-size: 16px">性别</th><th style="font-size: 16px">成绩</th><th style="font-size: 16px">管理</th>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://123.207.119.24:3306/stuman?useUnicode=true&characterEncoding=utf-8","root","liukang");

Statement stmt=con.createStatement();

String s="select * from student";

ResultSet rs=stmt.executeQuery(s);

while(rs.next())

{

String id=rs.getString(2);

out.println("<tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td><a href='up.jsp?id="+id+"'>修改</a> <a href='del.jsp?id="+id+"'>删除</a></td></tr>");

}

rs.close();

stmt.close();

con.close();

 %>

</table>
<div id="down">
	<center>
	<a style="position:relative;left:0;font-size:20px" href=add.jsp>添加学生信息</a>
	<a style="position:relative;left:0;font-size:20px" href=sort.jsp>学生信息统计</a>
	<a style="position:relative;right:0;font-size:20px" href=..\bkshop\>进入书店</a>
	</center>
</div>

  </body>

</html>

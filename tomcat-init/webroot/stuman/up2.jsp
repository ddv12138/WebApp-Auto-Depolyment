<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../mystyle.css">
</head>
<%
  request.setCharacterEncoding("utf-8");

  Class.forName("com.mysql.jdbc.Driver");

  Connection con=DriverManager.getConnection("jdbc:mysql://123.207.119.24:3306/stuman?useUnicode=true&characterEncoding=utf-8","root","liukang");

  Statement stmt=con.createStatement();

  String id=request.getParameter("id");

  ResultSet rs=stmt.executeQuery("select * from student where id='"+id+"'");

  rs.next();
String submit=request.getParameter("submit");
if(submit!=null&&!submit.equals("")){
String  number=request.getParameter("number");

String  name=request.getParameter("name");
String  sex=request.getParameter("sex");

String  datea=request.getParameter("date");

String sql="UPDATE student SET name='"+name+"' ,sex = '"+sex+"' ,date = '"+datea+"' where id='"+id+"'";
out.println("<center>修改成功，即将返回主页</a></center>");
response.setHeader("refresh","2;URL=index.jsp");
stmt.execute(sql);
}
rs.close();
stmt.close();
con.close();
%>
</html>

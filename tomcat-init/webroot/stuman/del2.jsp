<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<link rel="stylesheet" type="text/css" href="../mystyle.css">
<%
String  number=request.getParameter("number");

String  name=request.getParameter("name");

String  sex=request.getParameter("sex");

String  datea=request.getParameter("date");

String submit=request.getParameter("submit");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://123.207.119.24:3306/stuman?useUnicode=true&characterEncoding=utf-8","root","liukang");

Statement stmt=con.createStatement();
if(submit!=null&&!submit.equals("")){
	stmt.execute("delete from student where id='"+number+"'");
	out.println("<center>删除成功，即将返回主页</a></center>");
	response.setHeader("refresh","2;URL=index.jsp");
}else{
	out.println("<center>删除失败，即将返回主页</a></center>");
	response.setHeader("refresh","2;URL=index.jsp");
}
stmt.close();
con.close();

%>

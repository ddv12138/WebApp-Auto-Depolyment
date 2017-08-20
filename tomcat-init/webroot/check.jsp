<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<%
  request.setCharacterEncoding("utf-8");

  Class.forName("com.mysql.jdbc.Driver");

  Connection con=DriverManager.getConnection("jdbc:mysql://123.207.119.24:3306/login?useUnicode=true&characterEncoding=utf-8","root","liukang");

  Statement stmt=con.createStatement();
String submit=request.getParameter("submit");
if(submit!=null&&!submit.equals("")){
String  user=request.getParameter("user");
String  passwd=request.getParameter("passwd");
String s1 = "select * from passwd where id='"+user+"'";
//out.println(s1);
ResultSet rs=stmt.executeQuery(s1);
if(rs.next()){
	String pass= rs.getString(2);
	//out.println(passwd);
	//out.println(pass);
	if(pass.equals(passwd)){
		out.println("登陆成功，正在转入成绩管理页面");
		response.setHeader("refresh","2;URL=stuman/");
	}else{
		out.println("密码错误");
		response.setHeader("refresh","1;URL=./");
	}
}else{
	out.println("用户名不存在");
	response.setHeader("refresh","1;URL=./");
}
}
%>
</html>

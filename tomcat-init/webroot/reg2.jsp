<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<%
  request.setCharacterEncoding("utf-8");

  Class.forName("com.mysql.jdbc.Driver");

  Connection con=DriverManager.getConnection("jdbc:mysql://mysql-server/login?useUnicode=true&characterEncoding=utf-8","root","liukang");

  Statement stmt=con.createStatement();
String submit=request.getParameter("submit");
if(submit!=null&&!submit.equals("")){
String  user=request.getParameter("user");
String  passwd=request.getParameter("passwd");
String s1 = "INSERT INTO `login`.`passwd` (`id`, `passwd`) VALUES ('"+user+"', '"+passwd+"')";
if(user.equals("")){
	out.println("<center>用户名不能为空，即将返回注册页</a></center>");
	response.setHeader("refresh","2;URL=reg.jsp");
}else if(passwd.equals("")){
	out.println("<center>密码不能为空，即将返回测试页</a></center>");
	response.setHeader("refresh","2;URL=reg.jsp");
}else{
	ResultSet rscheck = stmt.executeQuery("select * from passwd where id='"+user+"'");
	if(!rscheck.next()){
		int rs=stmt.executeUpdate(s1);
		if(rs>0){
			out.println("<center>注册成功，即将返回主页</a></center>");
			response.setHeader("refresh","2;URL=index.jsp");
		}else{
			out.println("<center>注册失败，即将返回主页</a></center>");
			response.setHeader("refresh","2;URL=index.jsp");
		}
	}else{
		out.println("<script type='text/javascript'>alert('用户名已存在');</script>");
		response.setHeader("refresh","0;URL=reg.jsp");
	}
}
//out.println(s1);
}
%>
</html>

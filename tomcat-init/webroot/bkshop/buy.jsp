<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css">
<title>结算页面</title>
</head>
<body>
<form action="index.jsp" method="get">
	<center><h1>结算页面</h1></center>
<table align="center" width="50%" border=1>
<tr><th>编号</th><th>书名</th><th>价格</th><th>是否购买</th></tr>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://mysql-server:3306/book?useUnicode=true&characterEncoding=utf-8","root","liukang");
	Statement stmt=con.createStatement();
	//String s="select * from books";
	//ResultSet rs=stmt.executeQuery(s);
	if(request.getParameterValues("check")!=null){
		String[] values=request.getParameterValues("check");
		int num=0;
		for(int i=0;i<values.length;i++){
			String sql = "select * from books where price='"+values[i]+"'";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				num = num+Integer.valueOf(rs.getString(3));
				out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><th>是否购买: <input type='checkbox' value="+rs.getString(3)+" name=check checked='checked' disabled='disabled' ></th></tr>");
			}
		}
			out.println("<tr><td>总金额：</td><td>"+num+"元</td><td><input type='submit' name='"+num+"' value='确认提交''></td><td><a href='index.jsp'>返回</a></td>");
	}
%>
</table>
</form>
</body>
</html>

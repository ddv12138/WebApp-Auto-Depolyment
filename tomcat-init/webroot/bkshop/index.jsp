<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../mystyle.css">
<title>在线书店</title>
</head>
<body style="height: ">
<center><h1 ><font color="red">欢迎光临在线书店</font></h1></center>
<form action="buy.jsp" method="post">
	<table align="center" width="50%" border="1">
		<tr><th>编号</th><th>书名</th><th>价格</th>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://mysql-server:3306/book?useUnicode=true&characterEncoding=utf-8","root","liukang");
		Statement stmt=con.createStatement();
		String s="select * from books";
		ResultSet rs=stmt.executeQuery(s);
		while(rs.next()){
			String id=rs.getString(1);
			out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");
		}
		rs.close();
		stmt.close();
		con.close();
 %>
		<tr>
			<th colspan="4">
				<a href="add.jsp">添加图书</>
				<input type="submit" name="submit" value="提交">
				<input type="reset"  name="submit"  value="重置">

		</tr>
	</table>

</form>
</body>
</html>

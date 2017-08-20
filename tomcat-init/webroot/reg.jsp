<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>
<form action="reg2.jsp" method="post">
<center>
	<table align="center" width="50%"  border="1">
		<tr>
			<th>用户名：</th><th><input type="text" name="user"></th>
		</tr>
		<tr>
			<th>密码：</th><th><input type="text" name="passwd"></th>
		</tr>
		<tr>
			<th></th>
			<th><input type="submit" name="submit" value="注册"><input type="reset"  value="重置"></th>
		</tr>
	</table>
<center>
</form>
</body>
</html>

<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>

<html>

<head>

  <link rel="stylesheet" type="text/css" href="../mystyle.css">

<title>录入新图书</title>

</head>

<body>



<form action="add.jsp" method="post">

<table align="center" width="50%"  border="1" >

<caption style="font-size: 24px">添加图书</caption>

  <tr>

    <th width="30%" height="123" style="font-size: 24px">书名：</th>

    <td width="70%"><input name="bkname" type="text"></td>

  </tr>

  <tr>

    <th height="95" style="font-size: 24px">价格：</th>

    <td><input name="price" type="text"></td>

  </tr>


  <tr>

    <th colspan="2">

    <input type="submit" name="submit" value="添加">

    <input type="reset"  value="重置">

    </th>

  </tr>

</table>

</form>

<%

request.setCharacterEncoding("utf-8");

String submit=request.getParameter("submit");

if(submit!=null&&!submit.equals(""))

{

String  bkname=request.getParameter("bkname");

String  price=request.getParameter("price");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://123.207.119.24:3306/book?useUnicode=true&characterEncoding=utf-8","root","liukang");

Statement stmt=con.createStatement();

String sql="insert into books(bkname,price) values('"+bkname+"','"+price+"')";
int i=0;
if(bkname!=null&&!bkname.equals("")&&price!=null&&!price.equals("")){
	int intprice = Integer.parseInt(price);
	if(intprice<0){
		out.println("<script language='javaScript'> alert('请确认输入了正确的价格！');</script>");
		response.setHeader("refresh","1;url=add.jsp");
	}else{
		i = stmt.executeUpdate(sql);
	}
}else{
	out.println("不允许有空的项目");
}

if(i==1)

{

out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");

response.setHeader("refresh","1;url=index.jsp");

}

else{

out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");

response.setHeader("refresh","1;url=add.jsp");

}

stmt.close();

con.close();

}

%>

</body>

</html>

<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>

<html>

  <head>

    <link rel="stylesheet" type="text/css" href="../mystyle.css">

    <title>修改学生信息</title>

 </head>

 <body>



  <%

  request.setCharacterEncoding("utf-8");

  Class.forName("com.mysql.jdbc.Driver");

  Connection con=DriverManager.getConnection("jdbc:mysql://123.207.119.24:3306/stuman?useUnicode=true&characterEncoding=utf-8","root","liukang");

  Statement stmt=con.createStatement();

  String id=request.getParameter("id");

  ResultSet rs=stmt.executeQuery("select * from student where id='"+id+"'");

  rs.next();

   %>

   <form action="up2.jsp" method="post">

   <table align="center" width="50%"  border="1">

   <caption style="font-size: 24px">修改学生信息</caption>

  <tr>

    <th width="30%" height="123" style="font-size: 24px">学号：</th>

    <td width="70%"><center><%=rs.getString(2)%></center></td>

  </tr>

  <tr>

    <th height="103" style="font-size: 24px">姓名：</th>

    <td><center><input name="name" type="text" value="<%=rs.getString(3)%>"></center></td>

  </tr>

   <tr>

    <th height="110" style="font-size: 24px">性别：</th>

    <td><center><input name="sex" type="text" value="<%=rs.getString(4)%>"></center></td>

  </tr>

   <tr>

    <th height="116" style="font-size: 24px">成绩：</th>

    <td><center><input name="date" type="text" value="<%=rs.getString(5)%>"></center></td>

  </tr>

  <tr>

    <th colspan="2">

    <input type="hidden" name="id" value="<%=id%>">

    <input type="submit" name="submit" value="修改">


    </th>

  </tr>

</table>

</form>
<%
rs.close();
stmt.close();
con.close();
%>

</body>

</html>

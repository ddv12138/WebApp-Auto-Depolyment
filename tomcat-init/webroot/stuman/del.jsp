<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>

<html>

  <head>

    <link rel="stylesheet" type="text/css" href="../mystyle.css">

    <title>删除学生信息</title>

 </head>

 <body>



  <%

  request.setCharacterEncoding("utf-8");

  Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://mysql-server:3306/stuman?useUnicode=true&characterEncoding=utf-8","root","liukang");

  Statement stmt=con.createStatement();

  String id=request.getParameter("id");

ResultSet rs=stmt.executeQuery("select * from student where id='"+id+"'");

  rs.next();

   %>

   <form action="del2.jsp" method="post">

   <table align="center" width="50%"  border="1">

   <caption style="font-size: 24px">修改学生信息</caption>

  <tr>

    <th width="30%" height="123" style="font-size: 24px">学号：</th>

    <td width="70%"><input name="number" type="text" value="<%=rs.getString(2)%>"></td>

  </tr>

  <tr>

    <th height="103" style="font-size: 24px">姓名：</th>

    <td><input name="name" type="text" value="<%=rs.getString(3)%>"></td>

  </tr>

   <tr>

    <th height="110" style="font-size: 24px">性别：</th>

    <td><input name="sex" type="text" value="<%=rs.getString(4)%>"></td>

  </tr>

   <tr>

    <th height="116" style="font-size: 24px">成绩：</th>

    <td><input name="date" type="text" value="<%=rs.getString(5)%>"></td>

  </tr>

  <tr>

    <th colspan="2">

    <input type="hidden" name="id" value="<%=id%>">

    <input type="submit" name=submit value="确认删除">

    <input type="reset" value="重置">

    </th>

  </tr>

</table>

</form>
<%

//request.setCharacterEncoding("utf-8");
//String submit=request.getParameter("submit");
//if(submit!=null&&!submit.equals("")){
//	stmt.execute("delete from student where id='"+id+"'");
//}
rs.close();
stmt.close();
con.close();
%>

</body>

</html>

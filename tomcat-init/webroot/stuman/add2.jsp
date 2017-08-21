<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<%@ page import="cn.ddvudo.stuman.*"%>
<html>

<head>

  <link rel="stylesheet" type="text/css" href="../mystyle.css">

<title>确认学生信息</title>

</head>
<jsp:useBean id="student" class="cn.ddvudo.stuman.addStu" scope="session"/>
<body>



<form action="add2.jsp" method="post">

<table align="center" width="50%"  border="1" >

<caption style="font-size: 24px">确认学生信息</caption>

  <tr>

    <th width="30%" height="123" style="font-size: 24px">学号：</th>

    <th width="30%" height="123" style="font-size: 24px"><%=student.getId()%></th>

  </tr>

  <tr>

    <th height="95" style="font-size: 24px">姓名：</th>

    <th width="30%" height="123" style="font-size: 24px"><%=student.getName()%></th>

  </tr>

   <tr>

    <th height="99" style="font-size: 24px">性别：</th>

    <th width="30%" height="123" style="font-size: 24px"><%=student.getSex()%></th>

  </tr>

   <tr>

    <th height="107" style="font-size: 24px">成绩：</th>

    <th width="30%" height="123" style="font-size: 24px"><%=student.getGrade()%></th>

  </tr>


  <tr>

    <th colspan="2">

    <input type="submit" name="submit2" value="确认">
	<a href="./add.jsp">返回<a/>

    </th>

  </tr>

</table>

</form>
<%

request.setCharacterEncoding("utf-8");

String submit=request.getParameter("submit2");

if(submit!=null&&!submit.equals(""))

{
String id=student.getId();
String name=student.getName();
String sex=student.getSex();
String grade=student.getGrade();
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://mysql-server:3306/stuman?useUnicode=true&characterEncoding=utf-8","root","liukang");

Statement stmt=con.createStatement();

String sql="insert into student(id,name,sex,date) values('"+id+"','"+name+"','"+sex+"','"+grade+"')";
int i=0;
if(id!=null&&!id.equals("")&&name!=null&&!name.equals("")&&sex!=null&&!sex.equals("")&&grade!=null&&!grade.equals("")){
	int intgra=-1;
	try{
		intgra=Integer.parseInt(grade);
	}catch(Exception e){
		intgra=-1;
	}
if(intgra<0||intgra>100){
	out.println("<script language='javaScript'> alert('请确认输入了正确的成绩！');</script>");
	response.setHeader("refresh","1;url=add.jsp");
}else{
	i = stmt.executeUpdate(sql);
}
}else{
	out.println("<script language='javaScript'> alert('不允许有空的项目');</script>");
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

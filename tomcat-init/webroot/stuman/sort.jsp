<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="" %>
<html>

  <head>

    <link rel="stylesheet" type="text/css" href="stucss.css">
	<link rel="stylesheet" type="text/css" href="../mystyle.css">

    <title>成绩筛选</title>

 </head>

  <body>

<center><h1>成绩筛选结果</h1></center>

<table align="center" width="50%"  border="1">

<tr><th height="50" style="font-size: 16px">60分以下</th><th style="font-size: 16px">60-75分</th><th style="font-size: 16px">75-90分</th><th style="font-size: 16px">90-100分</th>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://mysql-server:3306/stuman?useUnicode=true&characterEncoding=utf-8","root","liukang");

Statement stmt=con.createStatement();

String s="select * from student";

ResultSet rs=stmt.executeQuery(s);

int grade[] = {0,0,0,0};
while(rs.next()){
	int a = Integer.parseInt(rs.getString(5));
	if (a<60){
		grade[0]+=1;
	}else if (a>=60&&a<75){
		grade[1]+=1;
	}else if (a>=75&&a<90){
		grade[2]+=1;
	}else if(a>=90&&a<=100){
		grade[3]+=1;
	}
}
out.println("<tr><td>"+grade[0]+"人</td><td>"+grade[1]+"人</td><td>"+grade[2]+"人</td><td>"+grade[3]+"人</td></tr>");
rs.close();

stmt.close();

con.close();

 %>

</table>
<div id="down">
	<center>
	<a style="position:relative;left:0;font-size:20px" href=./>返回主页</a>
	</center>
</div>

  </body>

</html>

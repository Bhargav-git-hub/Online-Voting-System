<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>voters preview</title>
	<link rel="stylesheet" type="text/css" href="CSS/admvoterslist.css">
</head>
<body>
	<button onclick="location.href='admin.html';">Back</button>
	<div>
	<h2>Voters List:</h2>
	<hr width="700px"/>
	<table>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Gender</th>
			<th>Age</th>
			<th>Mobile</th>
			<th>Constituency</th>
		</tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from voters_list order by voter_id");
while(rs.next()){
%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
		</tr>
<%}
con.close();
%>
	</table>
	<br>
	<br>
	</div>
</body>
</html>
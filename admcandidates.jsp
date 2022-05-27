<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>candidates preview</title>
	<link rel="stylesheet" type="text/css" href="CSS/admcandidates.css">
</head>
<body>
	<button onclick="location.href='admin.html';">Back</button>
	<div>
	<h2>Candidates List:</h2>
	<hr align="left" width="350px"/>
	<table>
		<tr>
			<th>Name</th>
			<th>Gender</th>
			<th>Age</th>
			<th>Party</th>
		</tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from candidates_list");
while(rs.next()){
%>
		<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
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
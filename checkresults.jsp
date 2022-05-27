<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from results order by vote_count desc");
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select sum(vote_count) from results");
rs2.next();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Results</title>
	<link rel="stylesheet" type="text/css" href="CSS/checkresults.css">
</head>
<body>
	<div id="head">
		<h2>Results</h2>
	</div>
	<button onclick="location.href='admin.html';">Back</button>
	<div id="foot">
	<p><big>Total votes : <%=rs2.getString(1)%></big></p>
	<table>
		<tr>
			<th><strong>Party</strong></th>
			<th><strong>Votes</strong></th>
		</tr>
	<%
	while(rs.next()){
	%>
		<tr>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
		</tr>
	<%
	}
	con.close();
	%>
	</table>
	</div>
</body>
</html>
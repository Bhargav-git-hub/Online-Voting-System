<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>candidates preview</title>
	<link rel="stylesheet" type="text/css" href="CSS/candidates.css">
</head>
<body>
	<div class="head">
		<h2 align="center">Government  of  India<small> - eVoting portal</small></h2>
		<p align="right">copyright &#169; 2002 by Election Commission</p>
	</div>
	<div class="side_bar">
		<div class="logo">
			<p><big>Menu<big></p>
		</div>
		<div class="menu">
			<ul>
				<li><a href="voter.jsp">Profile</a></li>
				<li><a href="candidates.jsp">View Candidates</a></li>
				<li><a href="castvote.jsp">Cast Vote</a></li>
				<li><a href="home.html">Log out</a></li>
				<script type="text/javascript">
					function preventBack() {
						window.history.forward();
					}
					setTimeout("preventBack()",0);
					window.onunload = function(){
						null;
					};
				</script>
			</ul>
		</div>
	</div>
	<div class="table">
	<h3>Candidates List:</h3>
	<br>
	<hr align="left" width="350px"/>
	<br>
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
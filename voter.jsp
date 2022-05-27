<%@ page import="java.sql.*" %>
<% String id=(String)session.getAttribute("vn");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from voters_list where voter_id='"+id+"'");
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>voter</title>
	<link rel="stylesheet" type="text/css" href="CSS/voter.css">
</head>
<body>
	<div class="head">
		<h2 align="center">Government  of  India<small> - eVoting portal</small></h2>
		<p align="right">copyright &#169; 2002 by Election Commission</p>
	</div>
	<div class="side_bar">
		<div class="logo">
			<p>Menu</p>
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
	<div id="foot">
		<h3><big>Voter Profile</big></h3>
		<br>
		<hr align="left" width="300px/">
		<br>
		<table>
			<tr>
				<th>Name :</th>
				<td><%=rs.getString(2)%></td>
			</tr>
			<tr>
				<th>Gender :</th>
				<td><%=rs.getString(3)%></td>
			</tr>
			<tr>
				<th>Age :</th>
				<td><%=rs.getString(4)%></td>
			</tr>
			<tr>
				<th>Mobile no :</th>
				<td><%=rs.getString(5)%></td>
			</tr>
			<tr>
				<th>Constituency :</th>
				<td><%=rs.getString(6)%></td>
			</tr>
			<tr>
				<th>Vote status :</th>
				<td><% if(rs.getString(7)!=null){
					out.println("voted");
					} 
					else{
						out.println("Not voted");
					}
				%></td>
		</table>
	</div>
	<% con.close(); %>
</body>
</html>
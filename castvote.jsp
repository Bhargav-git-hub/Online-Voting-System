<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>cast vote</title>
	<link rel="stylesheet" type="text/css" href="CSS/castvote.css">
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
	<div id="head" align="center">
		<h2>Voting Column</h2>
	</div>
	<div id="foot" align="center">
		<form method="POST" action="votevalidate.jsp">
		<table>
<% String id=(String)session.getAttribute("vn");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from Results");
while(rs.next()){
%>
			<tr>
				<td><input type="radio" name="vote" value=<%=rs.getString(2)%>><%=rs.getString(2)%></td>
			</tr>
<%}
con.close();
%>
		</table>
		<input type="submit" value="Submit">
		</form>
	</div>

</body>
</html>
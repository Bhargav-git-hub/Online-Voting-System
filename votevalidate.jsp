<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
	<title>End page</title>
	<link rel="stylesheet" type="text/css" href="CSS/votevalidate.css">
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
			</ul>
		</div>
	</div>
<% 
Connection con;
try{
String id=(String)session.getAttribute("vn");
String s=request.getParameter("vote");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
ResultSet rs = st.executeQuery("select * from voters_list where voter_id='"+id+"'");
rs.next();
Statement st4=con.createStatement();
ResultSet rs2= st4.executeQuery("select cand_id from Results where cand_party='"+s+"'");
rs2.next();
if(rs.getString(7)!=null){%>
	<script>alert("already voted")</script>
	<%	Statement st5=con.createStatement();
		ResultSet rs3=st5.executeQuery("select cand_party from results where cand_id='"+rs.getString(7)+"'");
		rs3.next();
	%>
	<br>
	<div id="table">
		<table>
			<caption>Vote details</caption>
			<tr>
				<th>Voter id : </th>
				<td><%=id%></td>
			</tr>
			<tr>
				<th>Voter Name : </th>
				<td><%=rs.getString(2)%></td>
			</tr>
			<tr>
				<th>Voted to : </th>
				<td><%=rs3.getString(1)%></td>
			</tr>
		</table>
	</div>
<%}
else{
	Statement st2=con.createStatement();
	int up=st2.executeUpdate("update results set vote_count=vote_count+1 where cand_party='"+s+"'");
	if(up==-1){
		out.println("voting failed");%>
		<script>alert("process failed")</script>
	<%}
	else{
		Statement st3=con.createStatement();
		int up2=st3.executeUpdate("update voters_list set cand_id='"+rs2.getString(1)+"' where voter_id='"+id+"'");
		if(up2!=-1){%>
			<div id="table">
				<table>
					<caption>Vote details</caption>
					<tr>
						<th>Voter id : </th>
						<td><%=id%></td>
					</tr>
					<tr>
						<th>Voter Name : </th>
						<td><%=rs.getString(2)%></td>
					</tr>
					<tr>
						<th>Voted to : </th>
						<td><%=s%></td>
					</tr>
				</table>
			</div>
			<script>alert("voted successfully")</script>
		<%}
	}
}
}
catch(Exception e){%>
	<jsp:forward page="castvote.jsp"></jsp:forward>
<%}
con.close();%>
</body>
</html>
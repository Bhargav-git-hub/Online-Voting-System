<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
try{
int vid=Integer.parseInt(request.getParameter("voter_id"));
String vname=request.getParameter("voter_name");
int vage=Integer.parseInt(request.getParameter("voter_age"));
String vgender=request.getParameter("Gender");
String vmobile=request.getParameter("voter_mobile");
String vconst=request.getParameter("voter_constituency");
Statement st=con.createStatement();
int up=st.executeUpdate("insert into voters_list(voter_id,voter_name,gender,age,mobile,constituency) values('"+vid+"','"+vname+"','"+vgender+"','"+vage+"','"+vmobile+"','"+vconst+"')");
}
catch(Exception e){
	e.printStackTrace();
	out.println("Error occured!");
}
finally{
	con.close();%>
	<jsp:forward page="admin.html"></jsp:forward>
<%}
%>
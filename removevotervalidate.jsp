<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
try{
int vid=Integer.parseInt(request.getParameter("voter_id"));
Statement st=con.createStatement();
int up=st.executeUpdate("delete voters_list where voter_id='"+vid+"'");
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
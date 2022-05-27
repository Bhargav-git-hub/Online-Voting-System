<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String s=request.getParameter("admin_un");
String p=request.getParameter("admin_pwd");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from admin_list where admin_id='"+p+"' and admin_name='"+s+"'");
if(rs.next()){
%>
<jsp:forward page="admin.html"></jsp:forward>
<%}
else{
	out.println("login failure");
%>
<jsp:forward page="home.html"></jsp:forward>
<%}
con.close();
%>
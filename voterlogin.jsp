<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String s=request.getParameter("voter_un");
String p=request.getParameter("voter_pwd");
session.setAttribute("vn",p);
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from voters_list where voter_id='"+p+"' and voter_name='"+s+"'");
if(rs.next()){
%>
<jsp:forward page="voter.jsp"></jsp:forward>
<%}
else{
out.println("login failed");
%>
<jsp:forward page="home.html"></jsp:forward>
<%}
con.close();
%>
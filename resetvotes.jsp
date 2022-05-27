<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Bhargav","oraclexe11.2");
Statement st=con.createStatement();
int up=st.executeUpdate("update results set vote_count=0");
Statement st2=con.createStatement();
int up2=st2.executeUpdate("update voters_list set cand_id=null");
con.close();
%>
<jsp:forward page="admin.html"></jsp:forward>
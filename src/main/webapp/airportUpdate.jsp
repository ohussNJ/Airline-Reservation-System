<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airport Update</title>
</head>
<body>
<%
//int ticketNum = Integer.parseInt(request.getParameter("ticketNum"));
String aID=request.getParameter("airportID");
String aName=request.getParameter("airportName");
String option=request.getParameter("whichOption");
//System.out.println("aID:"+aID+" aName:"+aName+" option:"+option);

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");

if(option.equals("add"))
{
	Statement stmt = con.createStatement();
    //String airportname = request.getParameter("airportname");
    //String airportid = request.getParameter("airportid");
    String query = "INSERT into airport(airportid, airportname) VALUES (?, ?)";
    PreparedStatement preparedStmt = con.prepareStatement(query);
    preparedStmt.setString(1, aID);
    preparedStmt.setString(2, aName);
    preparedStmt.executeUpdate();
}

if(option.equals("edit"))
{
	String query = "UPDATE airport set airportname=? WHERE airportid= '" + aID +"'";
	PreparedStatement preparedStmt = con.prepareStatement(query);
	preparedStmt.setString(1, aName);
	preparedStmt.executeUpdate();
}

if(option.equals("delete"))
{
	String query = "DELETE FROM airport WHERE airportid=?";
	PreparedStatement preparedStmt = con.prepareStatement(query);
	preparedStmt.setString(1, aID);
	preparedStmt.executeUpdate();
}

%>
Change made successfully.
</body>
</html>
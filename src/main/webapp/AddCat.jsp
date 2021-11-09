<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Helping Paw - Animals</title>
</head>
<body>
	<h1>Cats</h1>
	<table border="1">
		<tr>
			<td>Animal ID</td>
			<td>Animal Name</td>
			<td>Age</td>
			<td>Breed</td>
			<td>Sex</td>
			<td>Size</td>
			<td>Hypoallergenic</td>
			<td>Available</td>
			<br />
		</tr>
		<form action = "AddCat.jsp" method = "GET">
         Animal Name: <input type = "text" name = "animal_name">
         <br />
         Age: <input type = "text" name = "age" />
         <br/>
         Breed: <input type = "text" name = "breed">
         <br />
         Sex: <input type = "text" name = "sex">
         <br />
         Size: <input type = "text" name = "size">
         <br />
         Hypoallergenic: <input type = "text" name = "allergy">
         <br />
         <input type = "submit" value = "Submit" />
      </form>
      
      <h3>  <%= request.getParameter("animal_name")%> the  <%= request.getParameter("age")%> year old  <%= request.getParameter("breed")%> has now been put up for adoption. </h3>
     <ul>
         <li><p><b>Animal Name</b>
            <%= request.getParameter("animal_name")%>
         </p></li>
         <li><p><b>Age:</b>
            <%= request.getParameter("age")%>
         </p></li>
         <li><p><b>Breed:</b>
            <%= request.getParameter("breed")%>
         </p></li>
         <li><p><b>Sex:</b>
            <%= request.getParameter("sex")%>
         </p></li>
         <li><p><b>Size:</b>
            <%= request.getParameter("size")%>
         </p></li>
         <li><p><b>Hypoallergenic:</b>
            <%= request.getParameter("allergy")%>
         </p></li>
      </ul>

		<%
		String db = "helpingpaw", 
		username = "root", 
		password = "team2", 
		table = "animal";  
				

		try {
			java.sql.Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, username, password);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from " + db + "." + table);

			//This code can be changed to be a nice header instead of just hello
			out.println("Welcome to Helping Paw! Here are the animals in our database.");

			//Statement stmt2 = con.createStatement();
			//ResultSet rs2 = //stmt2.executeQuery(	"INSERT INTO " + db + "." + table + " VALUES()");

		} catch (SQLException e) {
			out.println("SQLException caught: " + e.getMessage());
		}
		%>
	
</body>
</html>
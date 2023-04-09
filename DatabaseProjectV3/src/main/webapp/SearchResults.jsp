<%@ page import="com.example.ehotel.entities.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.ehotel.entities.Address" %><%--
  Created by IntelliJ IDEA.
  User: kkris
  Date: 4/4/2023
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
    ArrayList<Address> addresses = (ArrayList<Address>) request.getAttribute("addresses");

%>


<html>
<head>
    <!-- SET UP -->
    <meta charset="ISO-8859-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="ch-cn">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/search-results.css">
    <script src="js/searchresults.js"></script>

    <!-- TITLE -->
    <title>Search Results</title>

    <!-- ENTIRE SCREEN -->
<body>
<!-- HEADER -->
<h1 style="margin-top: 30px">Here are the results of your search!</h1>
<hr style="background-color: rosybrown; height: 1.5px">

<!-- SEARCH RESULTS -->
<div id="results-table" style="margin-top: 30px">
    <table border="1" >
        <!-- TABLE HEADERS -->

        <thead>
        <tr>
            <th>Hotel</th>
            <th>Category</th>
            <th>Location</th>
            <th>View Type</th>
            <th>Amenities</th>
            <th>Price (CAD)</th>
            <th>Extendable?</th>
            <th>Damages (Reduced on Final Price)</th>
        </tr>
        </thead>

        <!-- FORM -->
        <form action="create-booking-servlet" id="booking-form">
            <tbody>
            <%
                int i = 0;
                for (Room room : rooms) { %>

            <!-- TABLE ROWS -->
            <tr class="options" onclick="confirmBooking()">
                <td><%= room.getHotelName() %></td>
                <td><%=room.getRating()%></td>
                <td><%=addresses.get(i)%></td> <!-- CHANGE THIS TO ADDRESS OF HOTEL -->
                <td><%= room.getViewType() %></td>
                <td><%= room.getAmenities() %></td>
                <td>$ <%= room.getPrice() %></td>
                <td><%= room.isExtendable() %></td>
                <td>-$<%= room.getDamages() %></td>
            </tr>
            <% i++;
                } %>
            </tbody>

        </form>

    </table>
</div>
</body>
</head>
</html>

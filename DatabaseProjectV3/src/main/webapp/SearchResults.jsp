<%@ page import="com.example.ehotel.entities.Room" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: kkris
  Date: 4/4/2023
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");

%>


<html>
<head>
    <!-- SET UP -->
    <meta charset="ISO-8859-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="ch-cn">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/search-results.css">
    <script src="js/search-results.js"></script>

    <!-- TITLE -->
    <title>Search Results</title>
</head>

<script>
    function submitFormForView2() {
        const hotelNumInput = document.getElementById("hotel-num-input").value;
        if (hotelNumInput === "") {
            alert("Please enter a hotel number");
            return;
        }
        document.getElementById("view-2-form").submit();
    }
</script>

<!-- ENTIRE SCREEN -->
<body onload="checkLogin()">
    <!-- HEADER -->
    <h1 style="margin-top: 30px">Here are the results of your search!</h1>
    <hr style="background-color: rosybrown; height: 1.5px">

    <!-- View -->
    <div class="for-view-2-search" style="text-align: center">
    <h2>Want to View the Capacity of All Rooms in a Specific Hotel?</h2>
    <p>Please enter the hotel number which can be found in the table below that you would wish to view</p>

    <form action="show-view2-servlet" id="view-2-form" method="get">
        <input type="number" id="hotel-num-input" name="hotel-id" min="1" placeholder="Enter Hotel Number...">
        <button class="buttons" id="view-2" type="button" name="view-2" onclick="submitFormForView2()" >View</button>
    </form>
    <br>
    </div>


    <!-- SEARCH RESULTS -->
    <div id="results-table" style="margin-top: 30px">
        <table border="1" >

            <!-- TABLE HEADERS -->
            <thead>
            <tr>
                <th>Hotel</th>
                <th>Hotel Number</th>
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
                    for (Room room : rooms) { %>

                <!-- TABLE ROWS -->
                <tr class="options" onclick="confirmBooking(this)">
                    <td>
                       <input type="hidden" name="choice" id="hotel-name" value="<%= room.getHotelName() %>">
                        <%= room.getHotelName() %>
                    </td>
                    <td>
                        <input type="hidden" name="choice" id="hotel-number" value="<%= room.getHotelID() %>">
                        <%= room.getHotelID() %>
                    </td>
                    <td>
                        <input type="hidden" name="choice" id="rating"  value="<%= room.getRating() %>">
                        <%=room.getRating()%>
                    </td>
                    <td>
                        <input type="hidden" name="choice" id="address" value="<%= room.getAddress() %>">
                        <%=room.getAddress()%>
                    </td>
                    <td>
                        <input type="hidden" name="choice" id="view-type"  value="<%= room.getViewType() %>">
                        <%= room.getViewType() %>
                    </td>
                    <td>
                        <input type="hidden" name="choice" id="amenities"  value="<%= room.getAmenities() %>">
                        <%= room.getAmenities() %>
                    </td>
                    <td>
                        <input type="hidden" name="price" id="price" value="<%= room.getPrice() %>">
                        $ <%= room.getPrice() %>
                    </td>
                    <td>
                        <input type="hidden" name="choice" id="extendable"  value="<%= room.isExtendable() %>">
                        <%= room.isExtendable() %>
                    </td>
                    <td>
                        <input type="hidden" name="damages" id="damages" value="<%= room.getDamages() %>">
                        -$<%= room.getDamages() %>
                    </td>
                        <input type="hidden" name="room-id" id="room-id" value="<%= room.getRoomID() %>">
                </tr>
                <%
                    } %>
                </tbody>

            </form>
        </table>
    </div>
</body>
</html>
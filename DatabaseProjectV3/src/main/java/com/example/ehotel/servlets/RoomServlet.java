package com.example.ehotel.servlets;

import com.example.ehotel.connections.BookingServer;
import com.example.ehotel.connections.RoomServer;
import com.example.ehotel.entities.Booking;
import com.example.ehotel.entities.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;

@WebServlet(name = "roomServlet", value = "/room-servlet")
public class RoomServlet extends HttpServlet  {

    private static final Logger LOGGER = Logger.getLogger(SearchResultsServlet.class.getName()); //logger

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method retrieves an arraylist of available rooms (not booked or occupied) and forwards the attribute to
     * the page requested.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession();
        RoomServer con = new RoomServer(); //new connection

        // RETRIEVE ALL ROOMS
        ArrayList<Room> rooms = null;
        try{
            rooms = con.getAvailableRooms(Integer.parseInt(session.getAttribute("hotel_id").toString()));
        }
        catch (ClassCastException e){
            System.out.println(session.getAttribute("hotel_id").toString());
        }


        // SEND THE DATA TO THE JSP
        req.setAttribute("rooms", rooms); //sending bookings arraylist
        req.getRequestDispatcher("ViewBookings.jsp").forward(req, resp); //forwarding response

    }
}
package com.example.ehotel.servlets;

import com.example.ehotel.connections.CustomerServer;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "customerLoginServlet", value = "/customer-login-servlet")
public class CustomerLoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method takes the customer email and password (SIN) from the user input on the
     * login page and retrieves the corresponding fields from the database. It then compares
     * the login information and redirects the user to the appropriate page.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     * @throws ServletException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION: new session
        HttpSession session = req.getSession();

        // VARIABLE DECLARATION: email and password from user input
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // VARIABLE DECLARATION: new connection
        CustomerServer con = new CustomerServer();

        // VARIABLE DECLARATION: new SIN var. to hold SIN retrieved from db
        String sinFromDB;

        // PROCESS: retrieving customer SIN from given username (email)
        // INITIALIZATION
        sinFromDB = con.getCSINByEmail(email);

        // PROCESS: checking if given password matches SIN from db
        if (password.equals(sinFromDB)) { //success
            session.setAttribute("uid", email); //updating session's user id to customer email

            setSessionAttributes(session, con, email); //setting session attributes

            resp.sendRedirect("ViewRooms.jsp"); //redirecting to rooms page
        }
        else { //failure
            resp.setStatus(401); //setting error status
            req.setAttribute("status", "CLOG-DB-401"); //setting error status attribute
            req.setAttribute("heading", "LOGIN ERROR"); //setting heading attribute
            req.setAttribute("error_msg", "Your login information is incorrect. Please return to the previous page, and try again."); //setting error msg attribute
            req.getRequestDispatcher("ErrorPage.jsp").forward(req, resp); //forwarding response attributes to error page
            resp.sendRedirect("ErrorPage.jsp"); //redirecting to error page
        }

    }

    /**
     * This helper method sets all the session attributes once the user logs in.
     * @param session the current session
     * @param con the current database connection
     * @param uid the current user ID
     */
    private void setSessionAttributes(HttpSession session, CustomerServer con, String uid) {

        // VARIABLE DECLARATION: form vars. to hold values from db
        String fName;
        String lName;
        String email;
        String street;
        String city;
        String province;
        String country;
        Object sin;
        long phoneNum, ccNum;

        // PROCESS: retrieving form values from db using uid
        // INITIALIZATION
        fName = (String) con.getFieldByID("first_name", uid);
        lName = (String) con.getFieldByID("last_name", uid);
        email = (String) con.getFieldByID("customer_email", uid);
        street = (String) con.getFieldByID("street", uid);
        city = (String) con.getFieldByID("city", uid);
        province = (String) con.getFieldByID("province", uid);
        country = (String) con.getFieldByID("country", uid);
        phoneNum = Long.parseLong((String) con.getFieldByID("customer_phone_number", uid));
        sin = con.getFieldByID("sin", uid);
        ccNum = Long.parseLong((String) con.getFieldByID("credit_card_num", uid));

        // PROCESS: setting form values to the ones retrieved
        session.setAttribute("fname", fName);
        session.setAttribute("lname", lName);
        session.setAttribute("email", email);
        session.setAttribute("phone_num", phoneNum);
        session.setAttribute("street_address", street);
        session.setAttribute("city", city);
        session.setAttribute("province_state", province);
        session.setAttribute("country", country);
        session.setAttribute("sin", sin);
        session.setAttribute("cc_num", ccNum);

    }

}

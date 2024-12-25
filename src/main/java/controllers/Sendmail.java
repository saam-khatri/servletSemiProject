package controllers;

import config.SendEmail;
import helpers.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/sendmail")
public class Sendmail extends HttpServlet {
    Helper helper = new Helper();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        helper.forward_to_destination("/views/sendmail.jsp", req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        SendEmail<String> se = new SendEmail<>("password");
        se.sendEmail("from@gmail.com", "to@gmail.com", "Subject", "Body-message");


    }


}

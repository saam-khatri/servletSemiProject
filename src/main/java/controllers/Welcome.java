package controllers;


import databse.Database;
import helpers.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.Properties;

@WebServlet("/welcome")
public class Welcome extends HttpServlet {
    Helper helper = new Helper();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Database db = new Database(response);
        //        ===============================home data ===================
        JSONArray jsonArray = db.selectAll("home", response);
        request.setAttribute("homeData", jsonArray.toString());

        //        =========================About Data ===================
        JSONObject obj = db.selectOne("about", "id", "1");
        request.setAttribute("aboutData", obj.toString());


        //        =========================skill Data ===================
        //        =========================education Data ===================
        //        =========================experience Data ===================
        //        =========================blog Data ===================
        request.getRequestDispatcher("/views/index.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

//        making properties

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.example.com");        // Update with your SMTP server
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");


    }

}

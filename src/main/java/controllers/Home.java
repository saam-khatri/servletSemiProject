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

@WebServlet("/home")
public class Home extends HttpServlet {
    Helper helper = new Helper();


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//
        //        select data
        Database db = new Database(response);

//        =========================About data =======================
        JSONObject obj = db.selectOne("home", "id", "1");
        request.setAttribute("aboutData", obj.toString());


//        =============================Home data ============================
        JSONArray jsonArray = db.selectAll("home", response);
        request.setAttribute("homeData", jsonArray.toString());
        helper.forward_to_destination("/views/home.jsp", request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");


        String [] data = {name, detail};
        Database db = new Database(response);

//        inser data
        String [] tablecol = {"name", "detail"};
        db.insertData("home", tablecol, data, response);







    }

}

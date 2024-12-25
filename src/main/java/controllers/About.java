package controllers;

import databse.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.*;


@WebServlet("/about")
@MultipartConfig
public class About extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Database db = new Database(response);
        JSONObject obj = db.selectOne("about", "id", "1");
        request.setAttribute("jsonData", obj.toString());
        request.getRequestDispatcher("/views/about.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
        String detail = req.getParameter("detail");
        String skill_one = req.getParameter("skill_one");
        String skill_two = req.getParameter("skill_two");
        String skill_three = req.getParameter("skill_three");
        String skill_last = req.getParameter("skill_last");



        String [] data = {detail, skill_one, skill_two, skill_three, skill_last};
        Database db = new Database(resp);

//        inser data
        String [] tablecol = {"details",	"skill_one",	"skill_two",	"skill_three",	"skill_last" };
        db.insertData("about", tablecol, data, resp);
    }
}
//public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    FileUpload<String> fileUpload = new FileUpload<>("myfile");
//    FileUpload.GetFilePath  innerClass =  fileUpload.new GetFilePath("C:/Users/saamk/IdeaProjects/web/src/main/webapp/upload/");
//    String y =  innerClass.getPart(request);
//    response.getWriter().println(y);
//}
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
//     Part part = request.getPart("myfile");
//     String fileName = part.getSubmittedFileName();
//
//     String path = "C:/Users/saamk/IdeaProjects/web/src/main/webapp/upload/" + File.separator+fileName;
////     String path = request.getSession().getServletContext().getRealPath("/"+"files"+File.separator+fileName);
//
//     InputStream inputStream = part.getInputStream();
//        uploadFile(inputStream, path);
//
//
//
//
//    }
//    public boolean uploadFile(InputStream inputStream, String path) {
//        boolean result = false;
//        try {
//            byte[] buffer = new byte[inputStream.available()];
//            inputStream.read(buffer);
//
//            FileOutputStream fileOutputStream = new FileOutputStream(new File(path));
//            fileOutputStream.write(buffer);
//            fileOutputStream.close();
//            result = true;
//
//
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//        return result;
//
//    }


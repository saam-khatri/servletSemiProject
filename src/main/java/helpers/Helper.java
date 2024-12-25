package helpers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Helper  extends HttpServlet {

    public void forward_to_destination(String servlet_or_jsp, HttpServletRequest req, HttpServletResponse resp)  throws ServletException, IOException {
//        getServletContext().getRequestDispatcher(servlet_or_jsp).forward(req, resp);
        req.getRequestDispatcher(servlet_or_jsp).forward(req, resp);
    }

    public void redirect_to_url( String url, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(url);

    }

    public void get_parameter(String queryString, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getParameter(queryString);
    }

    public  void hadle_error(String attribute, String errorMassage, HttpServletRequest request)
    {
        StringBuilder errors = new StringBuilder();
        if(attribute == null || attribute.isEmpty())
        {
            errors.append(errorMassage);
        }
        if (errors.length() > 0)
        {
            request.setAttribute("error", errors.toString());
        }
    }

    public void get_user_login_data(String username, String password, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String user_login = req.getParameter("username");
        String pass_login = req.getParameter("password");
        if (user_login == null || pass_login == null)
        {
            req.setAttribute("error", "Empty username or password");
        }

    }






}

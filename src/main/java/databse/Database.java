package databse;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.*;


public class Database extends HttpServlet {

    private static final String Jdbc_Url = "jdbc:mysql://localhost:3306/";
    private static final String Db_Name= "portfolio";
    private static final String Db_User = "root";
    private static final String Db_pass = "";

    public Database(HttpServletResponse response) throws ServletException, IOException {
        super();
//        create database
        Db(Db_Name, response);

//        create home table
        String [] hometableColumns = {"name", "detail"};
        creaTable("home", hometableColumns, "images", response);

//        create about table
        String [] aboutTableColumns = {"details", "skill_one", "skill_two", "skill_three"};
        creaTable("about", aboutTableColumns, "skill_last", response);

//        create skill table
        String [] skillTableColumns = {"details", "skill_one", "skill_two", "skill_three", "skill_four", "skill_five", "skill_six", "skill_seven", "skill_eight"};
        creaTable("skill", skillTableColumns, "skill_last", response);


//       create education table
        String [] eduTableColumns = {"degree"};
        creaTable("education", eduTableColumns, "detail", response);

//       create experience table
        String [] experienceTableColumns = {"field", "date"};
        creaTable("experience", experienceTableColumns, "detail", response);

        //       create experience table
        String [] blogTableColumns = {"images", "date", "field", "head"};
        creaTable("blog", blogTableColumns, "detail", response);


    }


    // ------------------------Connection -------------------
    public Connection connection(HttpServletResponse response) throws IOException {

        Connection connection = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(Jdbc_Url, Db_User, Db_pass);
            Statement statement = connection.createStatement();
            response.getWriter().println("<p>Connection Successful</p>");

        }catch (Exception e){
            e.printStackTrace();
            response.getWriter().println("<p>Error !! Not connection established</p>");
        }
        return connection;
    }
    //-----------------------------------------------------------------------------------

    public String Db(String db_Name, HttpServletResponse response) throws IOException
    {
        try{
            Connection connection = connection(response);
            Statement statement = connection.createStatement();
            String query = "CREATE DATABASE IF NOT EXISTS "+db_Name;
            statement.executeUpdate(query);
            response.getWriter().println("<p>Database Create Successful</p>");

        }catch (Exception e){
            e.printStackTrace();
        }
        return db_Name;
    }
    //    ------------------------------------------databse create end----------------------

    public String creaTable(String tableName, String []columns, String lastColumn, HttpServletResponse response) throws ServletException, IOException
    {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Jdbc_Url+Db_Name, Db_User, Db_pass);
            Statement statement = connection.createStatement();
            StringBuilder query = new StringBuilder("CREATE TABLE IF NOT EXISTS " + tableName + " (" + "id INT AUTO_INCREMENT PRIMARY KEY, "); for (String x : columns) { query.append(x).append(" VARCHAR(300), "); } query.append(lastColumn).append(" VARCHAR(200))");
            statement.executeUpdate(query.toString());
            response.getWriter().println("<p>Table Create Successful</p>");
        }catch (Exception e){
            e.printStackTrace();
            response.getWriter().println("<p>Table can not create -- something wrong</p>");}
        return  tableName;
    }

//    ---------------------------insert data -----------------------

    public void insertData(String tableName, String[] columns, String[]datas, HttpServletResponse response) throws IOException, ServletException {


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Jdbc_Url + Db_Name, Db_User, Db_pass);

            StringBuilder query = new StringBuilder("INSERT INTO " + tableName + " (");

            for (int i = 0; i < columns.length; i++) { query.append(columns[i]); if (i < columns.length - 1) { query.append(", "); } }
            query.append(") VALUES (");

            for (int i = 0; i < datas.length; i++) { query.append("?"); if (i < datas.length - 1) { query.append(", "); } }
            query.append(")");

            PreparedStatement ps = connection.prepareStatement(query.toString());

            for (int i = 0; i < datas.length; i++) { ps.setString(i + 1, datas[i]); }
            ps.executeUpdate();

        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    //--------------------------------------Delete  -----------------------------
    public void  deleted(String tableName, String idColumn, String id, HttpServletResponse response) throws IOException, ServletException {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Jdbc_Url + Db_Name, Db_User, Db_pass);

            String query = "DELETE FROM " + tableName + " WHERE " + idColumn + " = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            int x = ps.executeUpdate();
            switch (x)
            {
                case 0:
                    response.getWriter().println("<p style='color:red'>Data Not Deleted </p>");
                    break;
                case 1:
                    response.getWriter().println("<p style='color:lime'>Data Delete Successful</p>");
                    break;
                default:
                    response.getWriter().println("<p>Something wrong</p>");
                    break;
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }
    //--------------------------UPDate ----------------------
    public void update(String tableName, String[] columns, String[] values, String idColumn, String id, HttpServletResponse response) throws IOException, ServletException {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Jdbc_Url + Db_Name, Db_User, Db_pass);
            StringBuilder query = new StringBuilder("UPDATE " + tableName + " SET ");
            for (int i = 0; i < columns.length; i++) {
                query.append(columns[i]).append(" = ?");
                if (i < columns.length - 1) {
                    query.append(", ");
                }
            }
            query.append(" WHERE ").append(idColumn).append(" = ?");
            PreparedStatement ps = connection.prepareStatement(query.toString());

            for (int i = 0; i < values.length; i++) {
                ps.setString(i + 1, values[i]);
            }
            ps.setString(columns.length + 1, id);
            int x = ps.executeUpdate();
            switch (x)
            {
                case 0:
                    response.getWriter().println("<p style='color:red'>Data Not Updated </p>");
                    break;
                case 1:
                    response.getWriter().println("<p style='color:lime'>Data Updated Successful</p>");
                    break;
                default:
                    response.getWriter().println("<p style='color:orange'>Something wrong</p>");
                    break;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //-----------------------select one --------------------------------
    public JSONObject selectOne(String tableName, String colName, String id) throws IOException, ServletException {
        JSONObject jsonObject = new JSONObject();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Jdbc_Url + Db_Name, Db_User, Db_pass);

            String query = "SELECT * FROM " + tableName + " WHERE " + colName + " = ?";

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);

            ps.setString(1, id);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                java.sql.ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();
                for (int i = 1; i <= columnCount; i++) {

                    String columnName = metaData.getColumnName(i);
                    jsonObject.put(columnName, resultSet.getObject(columnName));
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return jsonObject;
    }
    //----------------------------------select all-----------------
    public JSONArray selectAll(String tableName, HttpServletResponse response) throws IOException, ServletException {
        JSONArray jsonArray = new JSONArray();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(Jdbc_Url + Db_Name, Db_User, Db_pass);
            String query = "SELECT * FROM " + tableName;
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet resultSet = ps.executeQuery();
            response.getWriter().println(resultSet);
            // Get metadata to retrieve column names
            java.sql.ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            // Process each row in the ResultSet
            while (resultSet.next()) {
                JSONObject jsonObject = new JSONObject();
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnName(i);
                    jsonObject.put(columnName, resultSet.getObject(columnName));
                }
                jsonArray.put(jsonObject);
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return jsonArray;
    }







    public void testing()
    {
        //        String [] EmployeeCol = {"name","email","password", "username", "salary"};
//        String [] datas = {"liza khatr", "liza@mail.com", "passwordliza","liza", "25.76"};
//        writer.print(  );
//        String[] columns = {"name", "email", "salary", "address"};
//        String[] data = {"John khatr", "john@example.com", "password", "john",  "2300.4" };

//        insertData("employee", EmployeeCol, datas ,response );
//        deleted("employee", "e_id", "3", response);
//        update("employee",  EmployeeCol, data, "e_id", "1", response);

        /*JSONArray jsonArray =  selectAll("employee", response);;
        response.setContentType("application/json");
        response.getWriter().print(jsonArray.toString());*/

//        JSONObject jsonObject = selectOne("employee", "e_id", "1");
//        response.setContentType("application/json");
//        response.getWriter().print(jsonObject.toString());

//        String [] col = {"name", "email", "address", "contact"};
//        creaTable("customer", col, "join_dat", response);


//        Db("testing" , response);
    }













}

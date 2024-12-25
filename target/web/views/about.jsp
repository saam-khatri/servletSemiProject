<%--
  Created by IntelliJ IDEA.
  User: saamk
  Date: 12/21/2024
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>
  <style>
    *{
      padding: 0;
      margin: 0;
      font-family: WF Visual Sans Text, Arial, sans-serif;
    }
    body{
      padding: 50px;
    }
    .register{
      padding: 20px;
      width: 90%;
      background: #f1f1f1;
      margin: auto;
    }
    .form-group{
      padding: 20px;
      margin-bottom: 10px;
    }
    .form-group>label{
      display: inline-block;
      margin-right: 6px;
      width: 75px;
      float: left;
      padding: 10px;
    }
    .form-group>input, textarea{
      padding: 6px 12px;
      font-size: 14px;
      width: 80%;
      outline: none;
      border-radius: 4px;
      border: 1px solid gray;
      height: 26px;

    }
    textarea{
      height: 100px;
    }
    .home-button{
      width: 150px;
      height: 50px;
      font-size: 16px;
      border: 1px solid #00cc99;
      border-radius: 4px;
      background: #00cc99;
      color: white;
      font-weight: bold;
      cursor: pointer;
    }
    .table-bordered{
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }
    .table-bordered td, .table-bordered th {
      border: 1px solid #ddd;
      padding: 8px;
    }

    tr:nth-child(even){background-color: #f2f2f2;}

    tr:hover {background-color: #ddd;}

    th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #04AA6D;
      color: white;
    }
  </style>
</head>
<body>
<section class="register">
  <div class="container">
    <div class="form">
      <form action="" method="POST">
        <div class="form-group">
          <label for="detail">Detail</label>
          <textarea class="form-control" rows="4" id="detail" name="detail" placeholder="Enter Detail"></textarea>
        </div>
        <div class="form-group">
          <label for="skill">Skill One</label>
          <input type="text" class="form-control" id="skill" name="skill_one" placeholder="Web Developer">
        </div>
        <div class="form-group">
          <label for="skill1">Skill two</label>
          <input type="text" class="form-control" id="skill1" name="skill_two" placeholder="Web Designer">
        </div>
        <div class="form-group">
          <label for="skill2">Skill Three</label>
          <input type="text" class="form-control" id="skill2" name="skill_three" placeholder="App Developer">
        </div>
        <div class="form-group">
          <label for="skilln">Skill Four</label>
          <input type="text" class="form-control" id="skilln" name="skill_last" placeholder="Software Engineer">
        </div>

        <button type="submit" class="home-button">Send data</button>
      </form>
    </div>
  </div>
</section>
<section class="table">

  <%
     String jsonData = (String) request.getAttribute("jsonData");
//     out.print(jsonData);
    JSONObject jsonObject = new JSONObject(jsonData);
    out.print("<br>"+jsonObject);

    String detail = jsonObject.getString("details");
    String one = jsonObject.getString("skill_one");
    String two = jsonObject.getString("skill_two");
    String three = jsonObject.getString("skill_three");
    String last = jsonObject.getString("skill_last");
    out.print(detail + one+ two+ three+ last);



  %>
</section>
</body>
</html>
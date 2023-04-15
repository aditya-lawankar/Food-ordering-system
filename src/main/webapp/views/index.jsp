<%@page import="java.sql.*"%> <%@page import="java.util.*"%> <%@page
import="java.text.*"%>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
          <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <title>Bamboo Bistro</title>
    
</head>
<body>

<section class="wrapper">
        <div class="container-fostrap">
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-white" >
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img th:src="@{/images/logo.png}"  src="../static/images/logo.png" width="auto" height="40" class="d-inline-block align-top" alt=""/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
		
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <h4>Bamboo Bistro</h4>
         
            <ul class="navbar-nav mr-auto"></ul>
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" sec:authorize="isAuthenticated()" href="Cart">Cart</a>
                </li>
                 <li class="nav-item active">
                    <a class="nav-link" href="profileDisplay" >Profile</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" sec:authorize="isAuthenticated()" href="logout">Logout</a>
                </li>
               
            </ul>

        </div>
    </div>
</nav>
<div class="row mr-0 mb-5">
  <img src="../img/banner.jpg" alt="banner" width="100%">
</div>


<style>
:root{
  --cr1:#F36E45;
  --cr2:#fff;
  --cr3:#000000da;
  --cr4:#000000a1;
  --cr5:#BEB4B1;
  --fs1:34px;
  --fs2:24px;
  --fs3:20px;
  --fs4:16px;
  --fs5:14px;
}
body {
  background: #ffffff;
}
/* the same attribute */
.cr1{
  color: var(--cr1);
}
.c2{
  color:  var(--cr2);
}
.cr3{
  color:  var(--cr3);
}
.cr4{
  color:  var(--cr4);
}
.cr5{
  color:  var(--cr5);
}
.fs1{
  font-size: 34px;
}
.fs2{
  font-size: 24px;
}
.fs3{
  font-size: 20px;
}
.fs4{
  font-size: 16px;
}
.fs5{
  font-size: 14px;
}
/* end the same attribute */
@font-face {
  src: url(ProductSansRegular_0.ttf);
  font-family: product;
}
*{padding: 0px;margin: 0px;box-sizing: border-box;font-family: segoe ui}
body,html{width:100%;height:100%;}
[class*="container"]{
  max-width: 1170px !important;
}

.bg {
  height: 570px;
  overflow: hidden;
}

</style>
<div class="container-fluid">
  <form action="/index" method="get">
    <div class="form-row">
      <div class="form-group col-md-4">
        <input type="text" class="form-control" name="search" placeholder="Search by dish name" value="${param.search}" />
      </div>
      <div class="form-group col-md-3">
        <select class="form-control" name="course">
          <option value="">--Filter by course--</option>
          <option value="starters" ${param.course == 'starters' ? 'selected' : ''}>Starters</option>
          <option value="mains" ${param.course == 'mains' ? 'selected' : ''}>Mains</option>
          <option value="desserts" ${param.course == 'desserts' ? 'selected' : ''}>Desserts</option>
        </select>
      </div>
      <div class="form-group col-md-3">
        <select class="form-control" name="diet">
          <option value="">--Filter by dietary restriction--</option>
          <option value="veg" ${param.diet == 'veg' ? 'selected' : ''}>Veg</option>
          <option value="non-veg" ${param.diet == 'non-veg' ? 'selected' : ''}>Non-Veg</option>
        </select>
      </div>
      <div class="form-group col-md-2">
        <button type="submit" class="btn btn-primary">Search</button>
      </div>
    </div>
  </form>

  <table class="table" style="border-top: 2px solid #dee2e6;">
    <tr>
      <th scope="col">Dish</th>
      <th scope="col">Cuisine</th>
      <th scope="col">Course</th>
      <th scope="col">Preview</th>
      <th scope="col">Diet</th>
      <th scope="col">Description</th>
      <th scope="col">Calories</th>
      <th scope="col">Price</th>
      <th scope="col">Buy</th>
    </tr>
    <tbody>
      <%
      try {
        String url = "jdbc:mysql://localhost:3306/springproject";
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, "root", "");
        Statement stmt = con.createStatement();
        Statement stmt2 = con.createStatement();
        String search = request.getParameter("search");
        String course = request.getParameter("course");
        String diet = request.getParameter("diet");
        String query = "SELECT * FROM products";
        
        if (search != null && !search.isEmpty()) {
          query += " WHERE name LIKE '%" + search + "%'";
        }
        
        if (course != null && !course.isEmpty()) {
          if (search != null && !search.isEmpty()) {
            query += " AND course = '" + course + "'";
          } else {
            query += " WHERE course = '" + course + "'";
          }
        }
        
        if (diet != null && !diet.isEmpty()) {
          if (search != null && !search.isEmpty() || course != null && !course.isEmpty()) {
            query += " AND diet = '" + diet + "'";
          } else {
            query += " WHERE diet = '" + diet + "'";
          }
        }
        
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {        
      %>
      <tr>
        <td><%= rs.getString(2) %></td> <!--COL: name (dish)-->
        <td>
          <% int categoryId = rs.getInt(4); 
          ResultSet rs2 = stmt2.executeQuery("SELECT * FROM categories WHERE categoryid = " + categoryId);
          if(rs2.next()) { 
            out.print(rs2.getString(2)); 
          } %>
        </td>
        <td><%= rs.getString(9) %></td> <!--COL: Course (Category)-->
        <td><!--COL: image (Preview)-->
          <img src="../img/dishes/<%= rs.getString(3) %>" height="150px" width="150px" />
        </td>
        <td><%= rs.getString(10) %></td> <!--COL: Diet-->
        <td style="text-align: left"><%= rs.getString(8) %></td> <!--COL: Description-->
        <td><%= rs.getInt(7) %></td> <!--COL: Weight (Calories)-->
        <td><%= rs.getInt(6) %></td> <!--COL: Price -->
        <td>
        <form action="cartentry" method="post">
          <input type="hidden" name="id" id="id" value="<%=rs.getInt(1)%>" />
          <input type="hidden" name="dish" id="dish" value="<%=rs.getString(2)%>" />
          <input type="hidden" name="price" id="price" value="<%= rs.getInt(6) %>"/>
          <input type="number" name="quantity" id="quantity" value="1" min="1" max="10" />
          <input type="submit" value="Add to Cart" class="btn btn-info btn" />
        </form>
      </td>
    </tr>
    <% } %>
  </tbody>
</table>
<% } catch (Exception ex) { out.println("Exception Occurred:: " +
ex.getMessage()); } %>
</div>
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Titillium+Web:wght@200;300&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Arimo&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=M+PLUS+Rounded+1c:wght@300&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Signika:wght@300&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Titillium Web', sans-serif;
        }

        html,
        body {
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            height: 100%;
            width: 100%;

            font-family: 'Roboto', sans-serif;
            font-weight: 400;
        }
        
         ::selection {
            color:white;
            background: black;
            font-weight: 700;
        }

        .wrapper {
            display: table;
            height: 100%;
            width: 100%;
        }

        .container-fostrap {
            display: table-cell;
            /* background-color: #b4e2ad;
            background-image: linear-gradient(315deg, #b6e2ad 0%, #81f87d 74%); */
            /* padding: 1em; */
            text-align: center;
            vertical-align: middle;
        }

        h1.heading {
            color: #fff;
            font-size: 1.15em;
            font-weight: 900;
            margin: 0 0 0.5em;
            color: #505050;
            text-shadow: 0px 4px 3px rgba(0, 0, 0, 0.4),
                0px 8px 13px rgba(0, 0, 0, 0.1),
                0px 18px 23px rgba(0, 0, 0, 0.1);
        }

        @media (min-width: 450px) {
            h1.heading {
                font-size: 3.55em;
            }
        }

        @media (min-width: 760px) {
            h1.heading {
                font-size: 3.05em;
            }
        }

        @media (min-width: 900px) {
            h1.heading {
                font-size: 3.25em;
                margin: 0 0 0.3em;
            }


        }

        .navbar {
            background-color: black;
            /* opacity: 0.9; */
            z-index: 999;
            width: 100%;
        }

        .navbar::before {
            content: "";
            position: absolute;
            top: 0%;
            bottom: 0%;
            left: 0;
            right: 0;
            z-index: -1;
        }

        .nav-item a {
            color: white;
            font-weight: 500;
            font-size: 17px;
            transition: 0.5s ease;
        }

        .nav-item a:hover {
             color: rgb(0, 195, 255);
            font-weight: bold;
            transition: 0.5s ease-in-out;
            
        }

        .navbar-brand {
            color: white;
            font-weight: 600;
            font-size: 20px;
        }

        .nav-item {
            margin-right: 20px;
        }	

        .btn{
            background-color: #469cd8;
            color: white;
            border: none;
            border-radius: 5px;
            /* transition: 0.5s ease; */
        }

        .btn:hover{
            background-color: #469cd8;
            color: white;
            border: none;
            border-radius: 5px;
            /* transition: 0.5s ease;
            transform: scale(1.1); */
        }
        </style>
</div>	
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
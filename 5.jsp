<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      response.setHeader("Pragma","no-cache");
      response.setHeader("Expires","0");
      %>
<!doctype html>
  <html lang="en">
  <head>
    <!-- Required meta tags -->
    <style>
      body {
    background-image:url("https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg");
    background-repeat: no-repeat;
    background-size: 100% 100%;
}
html {
    height: 100%
}
  </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>SELLER PAGE</title>
    <style >
       .opt{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    padding-top: 40px;
    padding-bottom: 20px;
    }
    .content {
    position: fixed;
    margin-left: 500px;
    margin-top: 200px;
    text-align: center;
  }
    </style>
  </head>
  <%@ page import="java.sql.*" %>
  <%@ page import="java.util.*" %>
  <% 
       if(session.getAttribute("userid")==null)
      {
        response.sendRedirect("2.jsp");
    }
    session.removeAttribute("areagb");
%>
  
  <body>
     <div class="opt" style="background: black">
     <table>
      <tr>
         <td>
           <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 60px;" onclick="location.href='1.jsp'">
            <i class="fa fa-home"></i>
          <span>Home</span>
          </button>
         </td>
      <td>
           <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 1200px;">
            <a href="2.jsp" style="text-decoration-line: none">
            <i class="fa fa-sign-out"></i>
          <span>Logout
          </span>
          </a>
          </button>
         </td>
      </tr>
     </table>
  </div>
<div class="content" style="width: 75%;">
    <a href="12.jsp" style="width:50%;display: flex;justify-content: center; background-color: #2d912d;text-decoration:none">
    <h1 style="color: #ffffff" >
       <i class="fa fa-home"></i>
          <span>Apartment details</span>
    </h1>
</a>
<br>
 <a href="6.jsp" style="width:50%;display: flex;justify-content: center; background-color: #2d912d;text-decoration:none">
    <h1 style="color: #ffffff" >
         <i class="fa fa-refresh"></i>
          <span>Register New Apartment</span>
    </h1>
</a>
<br>
<a href="7.jsp" style="width:50%;display: flex;justify-content: center; background-color: #2d912d;text-decoration:none">
    <h1 style="color: #ffffff" >
       <i class="fa fa-user-secret"></i>
          <span>Contact Agent</span>
    </h1>
</a>
</div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
  </body>
</html>
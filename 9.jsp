<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      response.setHeader("Pragma","no-cache");
      response.setHeader("Expires","0");
      %>
<html>
<head>
<style>

body{
  color: red;
  background : rgb(70 0 255 / 30%);
}
.opt{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    padding-top: 40px;
    padding-bottom: 20px;
    }

.center {
    position: fixed;
    margin-left: 550px;
    margin-top: 250px;
    text-align: center;
  }
  .cont2 {
    position: fixed;
    margin-left: 600px;
    margin-top: 350px;
    text-align: center;
  }
  .cont3{
    position: fixed;
    margin-left: 570px;
    margin-top: 450px;
    text-align: center;
  }


</style>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@ page import="java.sql.*" %>
  <%@ page import="java.util.*" %>
   <%
    if(session.getAttribute("userid")==null)
      {
        response.sendRedirect("2.jsp");
    }
    %>
<div class="opt" style="background: black">
     <table>
      <tr>
         <td>
           <button type="submit" style=" display:block; font-size: 16px; cursor: pointer; margin-left: 60px;" onclick="location.href='1.jsp'" >
            <a href="1.jsp" style="text-decoration-line: none">
            <i class="fa fa-home"></i>
          <span>Home</span>
          </a>
          </button>
         </td>
      <td>
           <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 1200px;">
            <a href="2.jsp" style="text-decoration-line: none">
            <i class="fa fa-sign-out"></i>
          <span>Logout</span>
          </a>
          </button>
         </td>
      </tr>
     </table>
  </div>
<div class = "center">
  <button type="submit" style=" font-size: 28px; cursor: pointer; background: #ffcccc;" onclick="location.href='10.jsp'" >
          <span>Update Apartement Stats</span>
          <i class="fa fa-home"></i>
          </button>
</div>
<div class="cont2">
   <button type="submit" style=" font-size: 28px; cursor: pointer; background: #ffcccc;" onclick="location.href='11.jsp'" >
    <i class="fa fa-money"></i>
          <span>Add New Deal</span>
          </button>
</div>
<div class="cont3">
   <button type="submit" style=" font-size: 28px; cursor: pointer; background: #ffcccc;" onclick="location.href='14.jsp'" >
    <i class="fa fa-user-secret"></i>
          <span>See Your Sale Report</span>
          </button>
</div>
</body>
</html>
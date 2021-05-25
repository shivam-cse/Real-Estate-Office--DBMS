<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      response.setHeader("Pragma","no-cache");
      response.setHeader("Expires","0");
      %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
      .content {
        position: fixed;
        margin-left: 550px;
        margin-top: 150px;
        border: purple;
         padding-left: 40px ;
            padding-right: 40px;
            padding-top: 20px;
            padding-bottom: 20px;
        border-width: 5px;
        border-style: solid;
        font-family: verdana;
        background-color: powderblue;
      }
                .opt{
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        padding-top: 20px;
        padding-bottom: 20px;
        }

    </style>
    <style>
       h4 {
            font-size: 20px;
        }
      body {
       background: #7eb26d;
      }
    </style>
    <!-- 
<style>
h3 {font-size:40px;}
</style>
 -->
    <meta charset="ISO-8859-1" />
    <title>Page11</title>
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
                  <button type="submit" style=" display:block; font-size: 16px; cursor: pointer; margin-left: 40px;" onclick="location.href='1.jsp'" >
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
    
    <div class="content">
    <h4>Please fill sale details </h4>
      <form action="page11_helper.jsp" method="post">
        Agent_id<br />
        <input type="text" name="agentId" required /> <br />
        Buyer_id<br />
        <input type="text" name="buyerId" required /> <br />
        Seller_id<br />
        <input type="text" name="sellerId" required /> <br />
        Apartment_id<br />
        <input type="text" name="aptId" required /> <br />
        Price_of_deal<br />
        <input type="text" name="pod" required /> <br />
        Date_of_deal(YYYY-MM-DD)<br />
        <input type="text" name="date" required /> <br /><br/>
        <button type="submit" style=" display:block; font-size: 20px; cursor: pointer; margin-left: 60px; background: skyblue" >
                    <span>Continue </span>
      </form>
    </div>
  </body>
</html>

<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");
            %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Page_6</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <div class="content3">
    </div>
    <style>
        .content {
            position: fixed;
            margin-left: 550px;
            margin-top: 30px;
            font-family: verdana;
            padding-left: 20px ;
            padding-right: 20px;
            padding-top: 10px;
            padding-bottom: 10px;
            border: orange;
            border-width: 5px;
            border-style: solid;
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
        .content4 {
            position: fixed;
            margin-left: 400px;
            margin-top: 530px;
            border: orange;
            border-width: 5px;
            border-style: solid;
        }

    </style>
    <style>
        body {
             background: #7eb26d;
        }
    </style>
    <style>
        h4 {
            font-size: 15px;
        }
    </style>
    <style>
        h1 {
            font-size: 30px;
            font-family: verdana;
        }
    </style>
    
    <body>
        <%@page import="java.sql.*" %>
            <%@page import="javax.sql.*" %>
                <%@ page import="java.util.*" %>
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
                <%  
                       if(session.getAttribute("userid")!=null)
                       {
                  %>
                 <button type="submit" style=" font-size: 16px; cursor: pointer; margin-left: 1200px;">
                    <a href="2.jsp" style="text-decoration-line: none">
                    <i class="fa fa-sign-out"></i>
                    <span>Logout</span>
                    </a>
                </button>
               </td>
               <%
                    }
                %>
            </tr>
         </table>
    </div>
                <h1>Seller Registration :</h1>
                <div class="content">
                    <h3>Please fill details of your apartment </h3>
                    <h4>
                        <form action="page6_helper.jsp" method="post">
                            Name<br>
                            <input type="text" name="sellerName" required><br>
                            Password<br>
                            <input type="password" name="password" required><br>
                            Address<br>
                            <input type="text" name="address"  required> <br />
                            Apartment Type<br>
                            <input type="text" name="apt_type" required> <br />
                            Apartment Size<br>
                            <input type="text" name="apt_size" required> <br />
                            No. of rooms<br>
                            <input type="text" name="nor" required> <br />
                            Area<br>
                            <input type="text" name="area" required> <br />
                            Expected Price<br>
                            <input type="text" name="priceExpected" required><br><br>
                            <button type="submit" style=" display:block; font-size: 20px; cursor: pointer; margin-left: 60px; background: skyblue" >
                    <span>Continue </span>
                        </form>
                </div>
    </body>

    </html>
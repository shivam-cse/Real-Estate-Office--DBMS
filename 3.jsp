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
        <title>MyPage_3</title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        .content {
            position: fixed;
            margin-left: 550px;
            margin-top: 200px;
            text-align: center;
            padding-left: 20px ;
            padding-right: 20px;
            padding-top: 30px;
            padding-bottom: 30px;
            font-family: Verdana;
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
        padding-top: 25px;
        padding-bottom: 15px;

        }
    body{
        background: #7eb26d;
    }
    </style>
    <body>
    	<%@ page import="java.sql.*" %>
  <%@ page import="java.util.*" %>
        <nav class="opt" style="background: black">
         <table>
            <tr>
                <button type="submit" style=" display:block; font-size: 16px; cursor: pointer; margin-left: 40px;" onclick="location.href='1.jsp'" >
                    <a href="1.jsp" style="text-decoration-line: none">
                    <i class="fa fa-home"></i>
                    <span>Home</span>
                    </a>
                </button>
            </tr>
         </table>
    </nav>
            <%@page import="javax.sql.*" %>
                <%@page import="java.lang.*" %>
                    <div class="content">
                        <h1>Registration !</h1>
                        <hr>
                        <h3>Seller</h3>
                        <form action="6.jsp" method="post">
                           <button type="submit" style=" display:block; font-size: 20px; cursor: pointer; margin-left: 40px; background: skyblue" >
                    <span>Continue As Seller</span>
                </button>
                        </form>
                        <h3>Buyer</h3>
                        <form action="4.jsp" method="post">
                           <button type="submit" style=" display:block; font-size: 20px; cursor: pointer; margin-left: 40px; background: skyblue" >
                    <span>Continue As Buyer</span>
                        </form>
                    </div>
                    </div>
    </body>

    </html>
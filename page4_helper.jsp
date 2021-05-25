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
max-width:500px;
margin: auto;
font-family: verdana;
border:blue; border-width:25px; border-style:solid;
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
</style>
<style>
body  {background-color: MediumSpringGreen;
       }
</style>
<style>
h4 {font-size:30px;}
</style>
<meta charset="ISO-8859-1">
<title>Buyer_helper</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
    <%@page import = "java.sql.*"%> 
    <%@page import = "javax.sql.*"%> 
     <%@ page import = "java.io.*,java.util.*" %>
         <div class="opt" style="background: black">
     <table>
      <tr>
         <td>
            <button type="submit" style=" display:block; font-size: 16px; cursor: pointer; margin-left: 50px;" onclick="location.href='1.jsp'" >
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

<h2 style="margin-left: 200px; margin-top: 100px;"> ThankYou for letting us help you find your dream home.</h2>
<h4>
<div class = "content">
<%
int flag=0;
       if(session.getAttribute("userid")==null)
      {
         flag=1;
    }

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","ankit1431@"); 
Statement stmt=con.createStatement();  
ResultSet rs2=stmt.executeQuery("select * from buyer");
int count = 1;
while(rs2.next())
  	{
        count++;
    }
    //  out.println("Count(No_of_buyer_id)  is : "+count+ ".<BR>");
      if(flag==0)
      {
        String ne=(String)session.getAttribute("userid");
        count=Integer.parseInt(ne);
      }
     out.println("Your Buyer_id is : "+count+ "<BR>");
     String bName = request.getParameter("buyerName");
     String are = request.getParameter("area");
     String type = request.getParameter("apt_type");
     String size = request.getParameter("apt_size");
     String rooms = request.getParameter("nor");
     String budg= request.getParameter("budget");
     String myPassword = request.getParameter("password");
     int nRooms = Integer.parseInt(rooms);
     int aSize = Integer.parseInt(size);
     int budget = Integer.parseInt(budg);
    //out.println("BuyerName: "+bName+" Area is "+Area+" Apt_type is "+type+" Size "+aSize+"nRoom"+nRooms+"Bget "+budget);
    
    if(flag==0)
      {
           String ins = "delete from buyer where id = ?";
          PreparedStatement st3 = con.prepareStatement(ins);
          st3.setInt(1,count);
          st3.executeUpdate();
      }
     String insert = "insert into buyer values(?,?,?,?,?,?,?,?)";
     PreparedStatement st2 = con.prepareStatement(insert);
     st2.setInt(1,count);
     st2.setString(2,bName);
     st2.setString(3,are);
     st2.setString(4,type);
     st2.setInt(5,aSize);
     st2.setInt(6,nRooms);
     st2.setInt(7,budget); 
     st2.setString(8,myPassword);
     st2.executeUpdate();
     
  //   out.println(" Checker is : "+count6+".<BR>");    
  String x="";  
     ResultSet abcd=stmt.executeQuery("select id from buyer order by id"); 
    while(abcd.next())
           {    
             x=abcd.getString("id");
           } 
   
%>
</div>
<%
if(flag==1)
{
  session.setAttribute("userid",x);
  %><h2>*Kindly remember your buyer_id(given above) for future_login.</h2>
  <% } %>
</h4>
<br>
<button type="submit" style=" display:block; font-size: 25px; cursor: pointer; margin-left: 620px; margin-top: 30px; background: skyblue" onclick="location.href='8.jsp'" >
                    <span>Press to Continue</span>
</body>
</html>
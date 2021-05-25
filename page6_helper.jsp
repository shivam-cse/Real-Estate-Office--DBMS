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
            margin-left: 400px;
            margin-top: 30px;
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

</style>
<style>
body  {background-color: MediumSpringGreen;}
</style>
<style>
h3 {font-size:30px;}
</style> 
<meta charset="ISO-8859-1">
<title>Seller_Helper !</title>
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
    <h2 style="margin-left: 200px; margin-top: 100px;">Thank you Seller for believing in us !</h2> 
<div class = "content" >  
<h3>     
<%
int flag=0;
       if(session.getAttribute("userid")==null)
      {
         flag=1;
    }
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","ankit1431@"); 
Statement stmt=con.createStatement();  
ResultSet rs2=stmt.executeQuery("select apartment_id from apartment order by apartment_id ");
int count = 1;
while(rs2.next())
 {
     count++;
 }

     String sName = request.getParameter("sellerName");// Seller name for seller table entry
     String mypassword = request.getParameter("password"); // used for seller table
     String address = request.getParameter("address");    
     String aptType = request.getParameter("apt_type");
     String siz = request.getParameter("apt_size");
     String nor = request.getParameter("nor");
     String avail= "Avaliable";
     String area = request.getParameter("area");
     String priceE = request.getParameter("priceExpected");
     int size = Integer.parseInt(siz);
     int nRooms = Integer.parseInt(nor);
     int pExp= Integer.parseInt(priceE);                         // for seller table
     
     out.println("Your Apartment_Id is : "+count+ "<BR>");

     String insert = "insert into apartment values(?,?,?,?,?,?,?)";
     PreparedStatement st = con.prepareStatement(insert);
     st.setInt(1,count);
     st.setString(2,area);
     st.setString(3,aptType);
     st.setString(4,address);
     st.setInt(5,size);
     st.setInt(6,nRooms);
     st.setString(7,avail);
     
     st.executeUpdate();
      

     int count5 = 0,xyz=0;
     String x="";

     ResultSet rs4=stmt.executeQuery("select id from seller order by id");      
           while(rs4.next())
           {   
         	   xyz = rs4.getInt("id");  
         	   x=rs4.getString("id");
           } 
           
           count5=xyz+1;
        if(flag==0)
      {
        String ne=(String)session.getAttribute("userid");
        count5=Integer.parseInt(ne);
      }
      
     PreparedStatement st2 = con.prepareStatement("insert into seller values(?,?,?,?,?)");
     st2.setInt(1,count5);
     st2.setString(2,sName);
     st2.setInt(3,count);
     st2.setInt(4,pExp);
     st2.setString(5,mypassword);
     st2.executeUpdate();
 
    out.println("Your seller id is : "+count5+"<BR>");
    ResultSet rs5=stmt.executeQuery("select id from seller order by id"); 
    while(rs5.next())
           {    
         	   x=rs5.getString("id");
           } 
%>
<% if(flag==1)
{ 
	session.setAttribute("userid",x);
	%>
Please note your seller_id for future login
<%  } %> 
</h3>  
</div> 
<br>
<button type="submit" style=" display:block; font-size: 25px; cursor: pointer; margin-left: 620px; margin-top: 230px; background: skyblue" onclick="location.href='5.jsp'" >
                    <span>Press to Continue</span>                
</body>
</html>
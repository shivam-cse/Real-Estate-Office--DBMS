  
  <%@ page import="java.sql.*" %>
  <%@ page import="java.util.*" %>
  <%
      String url = "jdbc:mysql://localhost:3306/lab10project";
    String user = "root";
    String pass = "16104653";
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 

    try
    {
          Connection conn = DriverManager.getConnection(url,user,pass);
        Statement stmt = conn.createStatement();
        String s=request.getParameter("Login");
        String p=request.getParameter("id");
        String q=request.getParameter("pass");
        int t=0,f=0;
        String j,i,x,y;
        x=null;
        if(s.equals("Agent"))
          t=1;
        if(s.equals("Seller"))
          t=2;
        if(s.equals("Buyer"))
          t=3;
        ResultSet r = null;
          r= stmt.executeQuery("select * from "+s);
               while(r.next())
               {
                    x=r.getString("id");
                    y=r.getString("pass");
                    if(x.equals(p) && y.equals(q))
                        {
                          f=1;
                          break;
                        }
              }
               if(f==0)
               {
                 session.setAttribute("error","0");
                 response.sendRedirect("2.jsp");
               }
               else
               {
                  session.setAttribute("userid",x);
                  if(t==1)
                  response.sendRedirect("9.jsp");
                  if(t==2)
                  response.sendRedirect("5.jsp");
                  if(t==3)
                  response.sendRedirect("13.jsp");
               }
      }
    catch(Exception e){
                 out.println("Exception : "+e.getMessage());
       }
        
       %>
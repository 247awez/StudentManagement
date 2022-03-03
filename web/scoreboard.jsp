<%-- 
    Document   : scoreboard
    Created on : 04-Feb-2022, 3:35:29 pm
    Author     : awezp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <%@include file="links.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="jakarta.servlet.*"%>
<%@page import="java.sql.Connection"%>

        <title>Scoreboard</title>
    </head>
    <body>
   <div class="fluid-container  sticky" style="background-color: #b3d8e7">
         <div class="row">
    <div class="col-4">     <%@include file="navbar.jsp"%>
</div>


  <% 
      String Enroll_no =null;
      Cookie[] cookies=  request.getCookies();
      if(cookies!=null){
      for(Cookie cookie : cookies){
      if(cookie.getName().equals("Enroll_no"))Enroll_no = cookie.getValue();
      
      }}
      if(Enroll_no == null){
      response.sendRedirect("index.jsp");}
      %>
        
           <div class="col-8">
  <table class="table">
           <thead>
    <tr>
      <th scope="col">SR NO</th>
      <th scope="col">Subject</th>
      <th scope="col">Grade</th>

    </tr>
  </thead>             
          <%try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement", "awez", "alwaysawez");
            PreparedStatement pst = conn.prepareStatement("Select * from grades where Enroll_no =?");
pst.setString(1,Enroll_no);
            ResultSet rs = pst.executeQuery();
          int i =1;
            while(rs.next()){
                
           %> 
  <tbody>
    <tr>
      <th scope="row"><%=i%></th>
      <td><% out.println(rs.getString("subject"));%></td>
      <td><% out.println(rs.getString("grade"));%></td>
    </tr>
    
        <%
            ++i;
     }
    }catch(Exception e){
        out.println(e);
    }

        %>    

    
     </tbody>
</table>     
           </div></div></div>
        <%@include file="footer.jsp" %>
    </body>
</html>

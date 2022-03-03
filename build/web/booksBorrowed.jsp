<%-- 
    Document   : booksBorrowed
    Created on : 04-Feb-2022, 3:28:25 pm
    Author     : awezp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="jakarta.servlet.*"%>
<%@page import="java.sql.Connection"%>

     


<html>
    <head>
        <%@include file="links.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Books Borrowed</title>
    </head>
    <body>
         <div class="fluid-container sticky" style="background-color: #b3d8e7" >
         <div class="row">
    <div class="col-4">     <%@include file="navbar.jsp"%>
</div>
    <div class="col-8"> 
  
        
        
          <%
        String Enroll_no = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("Enroll_no")) Enroll_no = cookie.getValue();
}
}
if(Enroll_no == null) response.sendRedirect("index.jsp");

        %>
        
        
        
        
           <%try{
           Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement", "awez", "alwaysawez");
            PreparedStatement pst = conn.prepareStatement("Select * from books_borrowed where Enroll_no =?");
pst.setString(1,Enroll_no);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
           %>
        <fieldset disabled>
    <div class="col-md-4 mb-3">
      <label for="disabledTextInput" class="form-label"></label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<% out.println(rs.getString("book1"));%>">
    </div>        

        <div class="col-md-4 mb-3">
      <label for="disabledTextInput" class="form-label"></label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<% out.println(rs.getString("book2"));%>">
    </div>        

        <div class="col-md-4 mb-3">
      <label for="disabledTextInput" class="form-label"></label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<% out.println(rs.getString("book3"));%>">
    </div>        

        <div class="col-md-4 mb-3">
      <label for="disabledTextInput" class="form-label"></label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<% out.println(rs.getString("book4"));%>">
    </div>        

        <div class="col-md-4 mb-3">
      <label for="disabledTextInput" class="form-label"></label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<% out.println(rs.getString("book5"));%>">
    </div>        
        </fieldset>
        <%
     }
    }catch(Exception e){
        out.println(e);
    }

        %>    
    
        
        
 
</div>
         </div>
         </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>

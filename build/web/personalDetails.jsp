<%-- 
    Document   : personalDetails
    Created on : 04-Feb-2022, 12:32:16 pm
    Author     : awezp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <title>Personal Details</title>
        <%@include file="links.jsp" %>

    </head>
    <body>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="jakarta.servlet.*"%>
<%@page import="java.sql.Connection"%>

     


    <div class="fluid-container  sticky" style="background-color: #b3d8e7">
         <div class="row">
    <div class="col-4">     <%@include file="navbar.jsp"%>
</div>
<div class="col-8" > 
<fieldset disabled>
     
      
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
            PreparedStatement pst = conn.prepareStatement("Select * from personal_details where Enroll_no =?");
pst.setString(1,Enroll_no);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
           %>
        
        
        
        
    <div class="mb-3 col-md-4">
      <label for="disabledTextInput" class="form-label">Enrollment number</label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<%  out.println(rs.getString("Enroll_no"));%>">
        </div>   
        
        
        
    <div class="mb-3 col-md-4">
      <label for="disabledTextInput" class="form-label">Name</label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<%  out.println(rs.getString("full_name"));%>">
    </div>
    <div class="mb-3 col-md-4">
      <label for="disabledTextInput" class="form-label">Class</label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<%  out.println(rs.getString("class"));%>">
    </div>   
   
       <div class="mb-3 col-md-4">
      <label for="disabledTextInput" class="form-label">Date of birth</label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<%  out.println(rs.getString("dob"));%>">
    </div>
       <div class="mb-3 col-md-4">
      <label for="disabledTextInput" class="form-label">Date of admission</label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<%  out.println(rs.getString("d_of_admission"));%>">
    </div>
       <div class="mb-3 col-md-4">
      <label for="disabledTextInput" class="form-label">Mother's name</label>
      <input type="text" id="disabledTextInput" class="form-control" placeholder="<%  out.println(rs.getString("mother_name"));%>">
    </div></fieldset>
</div>
    
    
    
    
    
      <%
     }
    }catch(Exception e){
        out.println(e);
    }

        %>    
    
    
    
    
    
         </div></div>
    <%@include file="footer.jsp"%>
    </body>
</html>

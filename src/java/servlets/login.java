package servlets;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import jakarta.servlet.http.Cookie;

/**
 *
 * @author awezp
 */
public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String n = request.getParameter("username");
        String p = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement", "awez", "alwaysawez");
            PreparedStatement pst = conn.prepareStatement("Select f_name,pass,Enroll_no from login where f_name=? and pass=?");
            pst.setString(1, n);
            pst.setString(2, p);
            ResultSet rs = pst.executeQuery();
      if (rs.next()) {
                PreparedStatement pst1 = conn.prepareStatement("Select Enroll_no from login where f_name=? and pass=?");
                pst1.setString(1, n);
                pst1.setString(2, p);
                ResultSet rs1 = pst1.executeQuery();
                rs1.next();     
              
//                request.setAttribute("Enroll_no", rs1.getString("Enroll_no"));
              String Enroll_no= rs1.getString("Enroll_no");  
                
                	Cookie loginCookie = new Cookie("Enroll_no",Enroll_no);
			//setting cookie to expiry in 30 mins
			loginCookie.setMaxAge(30*60);
			response.addCookie(loginCookie);
			response.sendRedirect("personalDetails.jsp");
                
               // RequestDispatcher rd = request.getRequestDispatcher("personalDetails.jsp");
             //   rd.forward(request, response);
            } else {
                
          
          
          
           out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet s</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<script>alert('Please enter correct credentials');</script");
         
       out.println("</body>");
            out.println("</html>");
          
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);

            }

        } catch (Exception e) {
            out.println(e);

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
}

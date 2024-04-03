package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    } 
  
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String uname = request.getParameter("fullname");
        String uemail = request.getParameter("email");
        String upass = request.getParameter("password");
        Connection con = null;
     try{
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register?useSSL=false","root","tienanh05");
         PreparedStatement pst = con.prepareStatement("insert into users(uname,upass,uemail)values (?,?,?)");
         pst.setString(1, uname);
         pst.setString(2, upass);
         pst.setString(3, uemail);
         RequestDispatcher dispatcher = null;
         int rowCount = pst.executeUpdate();
         dispatcher =request.getRequestDispatcher("Login.jsp");
        
         dispatcher.forward(request, response);
     }catch(Exception e){
         e.printStackTrace();
     } finally{
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
     }
    }

    @Override
    public String getServletInfo() {
        return "Register Servlet";
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author tienanh
 */
@WebServlet(name="Login", urlPatterns={"/login"})
public class Login1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    } 
  
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String uname = request.getParameter("user");
        String upass = request.getParameter("pass");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register?useSSL=false","root","tienanh05");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users where uname = ? and upass = ? ");
            pst.setString(1, uname);
            pst.setString(2, upass);
            ResultSet rs  =pst.executeQuery();
            if(rs.next()){
                session.setAttribute("name", rs.getString("uname"));
                dispatcher = request.getRequestDispatcher("welcome.jsp");
            }else{
                String ms = "Tài khoản không tồn tại ";
                request.setAttribute("error", ms);
                dispatcher = request.getRequestDispatcher("Login.jsp");
            }
            dispatcher.forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

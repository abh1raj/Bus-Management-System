/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.user;
import Model.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
            
          boolean flag = false;
          response.setContentType("text/html;charset=UTF-8");
          try (PrintWriter out = response.getWriter()) 
          {
              
          String uname = request.getParameter("uname");
          String pass = request.getParameter("pass");
          String type = request.getParameter("selects");
          UserDAO ud = new UserDAO();
          if(type.equals("Admin")){
            
              flag = ud.checkAdmin(uname, pass);
              if(flag){
                  response.sendRedirect("Admin.jsp");
              }
              else
                  response.sendRedirect("Login.html");
              
          }else{
              
            flag = ud.checkStu(uname,pass);
            if(flag){
                switch (type) {
                    case "Student":
                        response.sendRedirect("Student.jsp");
                        break;
                    case "Staff":
                        response.sendRedirect("Staff.html");
                        break;
                    default:
                        break;
                }
            }else{
                response.sendRedirect("Login.html");
            }
              
          }
          
          }catch(Exception ee){
              ee.printStackTrace();
          }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.Controller.common;

import com.menstore.DAO.IUserDAO;
import com.menstore.DAOimpl.AccessManager;
import com.menstore.DAOimpl.UserDAO;
import com.menstore.model.User;
import com.menstore.model.UserSession;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "AccessController", urlPatterns = {"/access"})
public class AccessController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            doDisplay(request, response);
        } else if (action.equals("login")) {
            doLogin(request, response);
        } else if (action.equals("register")) {
            doRegister(request, response);
        } else if (action.equals("logout")) {
            doLogout(request, response);
        }

    }

    protected void doDisplay(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("views/common/login.jsp");
        rd.forward(request, response);
    }

    protected void doLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AccessManager accessManager = new AccessManager();
        UserSession us = accessManager.login(username, password);

        HttpSession ss = request.getSession(true);

        if (us.getUser() != null) {
            ss.setAttribute("usersession", us);
            if (us.getUser().getRole().equals("admin")) {
                response.sendRedirect(request.getContextPath() + "/admin");
            } else {
//                Cart cart = new Cart();
//                ss.setAttribute("cart", cart);
                response.sendRedirect(request.getContextPath() + "/home");
            }
        } else {
            request.setAttribute("login_mess", "Tên đăng nhập hoặc mật khẩu không đúng");
            RequestDispatcher rd = request.getRequestDispatcher("views/common/login.jsp");
            rd.forward(request, response);
        }
    }

    protected void doRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        IUserDAO userDAO = new UserDAO();

        String userId = "US" + (userDAO.getNoOfRecords() + 1);
        String name = request.getParameter("register_name");
        String password = request.getParameter("register_password");
        String username = request.getParameter("register_username");
        String retypePassword = request.getParameter("register_retypePassword");
        String phone = request.getParameter("register_phoneNumber");
        String address = request.getParameter("register_address");

        RequestDispatcher rd = request.getRequestDispatcher("views/common/login.jsp");

        if (!password.equals(retypePassword)) {

            request.setAttribute("register_mess", "Mật khẩu không khớp");
            rd.forward(request, response);
            return;
        }

        if (userDAO.checkExist(username)) {
            request.setAttribute("register_mess", "Username đã tồn tại!");
            rd.forward(request, response);
            return;
        }

        User user = new User(userId, name, phone, address, username, password, "user", 0);
        if (userDAO.save(user)) {
            request.setAttribute("register_mess", "Đăng ký thành công");
            rd.forward(request, response);
        } else {
            request.setAttribute("register_mess", "Đăng ký không thành công");
            rd.forward(request, response);
        }
    }

    protected void doLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("access");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.Controller.common;

import com.menstore.DAO.IUserDAO;
import com.menstore.DAOimpl.UserDAO;
import com.menstore.model.User;
import com.menstore.model.UserSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "InformationServlet", urlPatterns = {"/information"})
public class InformationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession ss = request.getSession();
        UserSession us = (UserSession) ss.getAttribute("usersession");

        if (us == null) {
            response.sendRedirect(request.getContextPath() + "/access");
        } else {

            String action = request.getParameter("action");
            System.out.println("action:    " + action);
            if (action == null) {
                doGet_DisplayInfor(request, response);
            } else {
                if (action.equalsIgnoreCase("updatePassword")) {
                    doPost_UpdatePassword(request, response, us);
                } else if (action.equalsIgnoreCase("updateInfor")) {
                    doPost_UpdateInfor(request, response, us);
                }
            }
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

    private void doGet_DisplayInfor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("views/common/AccountInformation.jsp");
        rd.forward(request, response);
    }

    private void doPost_UpdatePassword(HttpServletRequest request, HttpServletResponse response, UserSession us) throws ServletException, IOException {

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String rePassword = request.getParameter("rePassword");

        IUserDAO manager = new UserDAO();
        String msg;

        RequestDispatcher rd = request.getRequestDispatcher("views/common/AccountInformation.jsp");

        if (!newPassword.equals(rePassword)) {
            msg = "Mật khẩu xác nhận không khớp";
        } else {
            int changeResult = manager.changePassword(us.getUser(), oldPassword, newPassword);

            if (changeResult > 0) {
//                msg = "Mật khẩu đã thay đổi thành công";
                HttpSession ss = request.getSession(true);
                ss.setAttribute("changed", "Mật khẩu đã thay đổi thành công");
                String role = us.getUser().getRole();
                if(role.equalsIgnoreCase("admin")) {
                                response.sendRedirect(request.getContextPath() + "/admin");
                }else{
                response.sendRedirect(request.getContextPath() + "/home");
                        }
                return;
            } else if (changeResult == -1) {
                msg = "Mật khẩu không đúng, vui lòng nhập lại";
            } else {
                msg = "Thay đổi mật khẩu thất bại";
            }
        }
        request.setAttribute("msg", msg);
        rd.forward(request, response);
    }

    private void doPost_UpdateInfor(HttpServletRequest request, HttpServletResponse response, UserSession us) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        User user = us.getUser();
        user.setName(name);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);

        String updateMsg = "";
        boolean isFailed = true;
        IUserDAO manager = new UserDAO();
        if (manager.updateInformation(user)) {
            updateMsg = "Cập nhật thông tin cá nhân thành công";
            isFailed = false;
        } else {
            updateMsg = "Cập nhật thông tin thất bại";
        }
        if (!isFailed) {
            request.setAttribute("ismsg", updateMsg);         //information success msg
        } else {
            request.setAttribute("ifmsg", updateMsg);         //infotmarion fail msg
        }
        RequestDispatcher rd = request.getRequestDispatcher("views/common/AccountInformation.jsp");
        rd.forward(request, response);
    }
}

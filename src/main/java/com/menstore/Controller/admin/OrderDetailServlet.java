package com.menstore.Controller.admin;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.menstore.DAO.IOrderDetailDAO;
import com.menstore.DAO.IUserDAO;
import com.menstore.DAOimpl.OrderDetailDAO;
import com.menstore.DAOimpl.UserDAO;
import com.menstore.model.OrderDetail;
import com.menstore.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MyPC
 */
@WebServlet(urlPatterns = {"/orderDetail"})
public class OrderDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        
        if (action == null) {
            doGet_Display(request,response);
        } else if(action.equals("search")){
            doGet_Search(request,response);
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

    protected void doGet_Display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        IOrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        List<OrderDetail> list = new ArrayList<>();

        int noOfRecords = orderDetailDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        list = orderDetailDAO.list((page - 1) * recordsPerPage, recordsPerPage);
//            list = orderDAO.list();
        request.setAttribute("list", list);

        RequestDispatcher rd = request.getRequestDispatcher("views/admin/OrderDetail.jsp");
        rd.forward(request, response);
    }

    private void doGet_Search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String userId = request.getParameter("userId");
        
        IOrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        List<OrderDetail> list = new ArrayList<>();
        
        IUserDAO userDAO = new UserDAO();
        
        User user = ((UserDAO)userDAO).find(userId);   
        list = orderDetailDAO.list(orderId);
        
        request.setAttribute("list", list);
        request.setAttribute("user", user);

        RequestDispatcher rd = request.getRequestDispatcher("views/admin/OrderDetail.jsp");
        rd.forward(request, response);
    }

}

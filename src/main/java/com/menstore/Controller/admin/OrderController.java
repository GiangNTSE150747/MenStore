/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.Controller.admin;

import com.menstore.DAO.IOrderDAO;
import com.menstore.DAOimpl.OrderDAO;
import com.menstore.model.Order;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/admin")
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        System.out.println("admin action:" + action);

        if (action == null) {
            doGet_Display(request, response);
        } else if (action.equals("sort")) {
            doGet_Sort(request, response);
        } else if (action.equals("edit")) {
            doGet_Update(request, response);
        } else if (action.equals("delete")) {
            doPost_delete(request, response);
        } else if (action.equals("search")) {
            doPost_search(request, response);
        } else {
            response.sendRedirect("/admin");
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
        IOrderDAO orderDAO = new OrderDAO();
        List<Order> list = new ArrayList<>();

        int noOfRecords = orderDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        list = orderDAO.list((page - 1) * recordsPerPage, recordsPerPage);
//            list = orderDAO.list();
        request.setAttribute("list", list);

        RequestDispatcher rd = request.getRequestDispatcher("views/admin/Order.jsp");
        rd.forward(request, response);
    }

    protected void doGet_Sort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        IOrderDAO orderDAO = new OrderDAO();
        List<Order> list = new ArrayList<>();

        int noOfRecords = orderDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        String direction = request.getParameter("direction");
        String by = request.getParameter("by");

        list = orderDAO.list((page - 1) * recordsPerPage, recordsPerPage, direction, by);
        request.setAttribute("list", list);

        RequestDispatcher rd = request.getRequestDispatcher("views/admin/Order.jsp");
        rd.forward(request, response);
    }

    private void doGet_Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("id");
        String status = request.getParameter("status");

        IOrderDAO orderDAO = new OrderDAO();
        if (orderDAO.updateStatus(orderId, status)) {
            request.setAttribute("message", "Cập nhật thành công");
        } else {
            request.setAttribute("message", "Cập nhật thất bại");
        }

        doGet_Display(request, response);
    }

    protected void doPost_delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        IOrderDAO orderDAO = new OrderDAO();

        if (request.getParameterValues("options") != null) {
            for (String id : request.getParameterValues("options")) {
                orderDAO.delete(id);
            }
        }

        doGet_Display(request, response);
    }

    protected void doPost_search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        IOrderDAO orderDAO = new OrderDAO();
        List<Order> list = new ArrayList<>();

        int noOfRecords = orderDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        

        list = orderDAO.search(request.getParameter("orderId"));
        
        for(int i = 0; i <list.size(); i++){
            System.out.println(list.get(i));
        }               
//            list = orderDAO.list();
        request.setAttribute("list", list);

        RequestDispatcher rd = request.getRequestDispatcher("views/admin/Order.jsp");
        rd.forward(request, response);
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.Controller.admin;

import com.menstore.DAO.IVoucherDAO;
import com.menstore.DAOimpl.VoucherDAO;
import com.menstore.model.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "VoucherController", urlPatterns = {"/voucher"})
public class VoucherController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            doGet_display(request, response);
        } else if (action.equals("sort")) {
            doGet_sortList(request, response);
        } else if (action.equals("search")) {
            doGet_search(request, response);
        } else if (action.equals("delete")) {
            doGet_delete(request, response);
        } else if (action.equals("add")) {
            doGet_add(request, response);
        } else if (action.equals("edit")) {
            doGet_edit(request, response);
        }
    }
    
     private void doGet_display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        IVoucherDAO voucherDAO = new VoucherDAO();
        List<Voucher> list = new ArrayList<>();

        int noOfRecords = voucherDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        list = voucherDAO.list((page - 1) * recordsPerPage, recordsPerPage);
        request.setAttribute("list", list);

        RequestDispatcher rd = request.getRequestDispatcher("views/admin/Voucher.jsp");
        rd.forward(request, response);
    }

    private void doGet_sortList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        IVoucherDAO voucherDAO = new VoucherDAO();
        List<Voucher> list = new ArrayList<>();

        int noOfRecords = voucherDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        String direction = request.getParameter("direction");
        String by = request.getParameter("by");

        list = voucherDAO.list((page - 1) * recordsPerPage, recordsPerPage, direction, by);
        request.setAttribute("list", list);

        RequestDispatcher rd = request.getRequestDispatcher("views/admin/Voucher.jsp");
        rd.forward(request, response);
    }

    private void doGet_search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        IVoucherDAO voucherDAO = new VoucherDAO();
        List<Voucher> list = new ArrayList<>();

        int noOfRecords = voucherDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        String keyword = request.getParameter("voucherId");

        list.add(voucherDAO.find(keyword));
        request.setAttribute("list", list);

        RequestDispatcher rd = request.getRequestDispatcher("views/admin/Voucher.jsp");
        rd.forward(request, response);
    }

    private void doGet_delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        IVoucherDAO voucherDAO = new VoucherDAO();

        if (request.getParameterValues("options") != null) {
            for (String id : request.getParameterValues("options")) {
                voucherDAO.delete(id);
            }
        }
        
        doGet_display(request, response);
    }

    private void doGet_add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        IVoucherDAO voucherDAO = new VoucherDAO();

        String id = request.getParameter("voucherId");
        int discount = Integer.parseInt(request.getParameter("discount"));
        Date date = Date.valueOf(request.getParameter("dueDate"));
        double maxDiscount = Double.parseDouble(request.getParameter("maxDiscount"));
        double required = Double.parseDouble(request.getParameter("minimumApplied"));
        String description = request.getParameter("description");

        Voucher voucher = new Voucher(id, discount, date, maxDiscount, required, description);

        voucherDAO.add(voucher);

        doGet_display(request, response);
    }

    private void doGet_edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IVoucherDAO voucherDAO = new VoucherDAO();
        
        String id = request.getParameter("edit_id");
        int discount = Integer.parseInt(request.getParameter("edit_discount"));
        Date date = Date.valueOf(request.getParameter("edit_dueDate"));
        double maxDiscount = Double.parseDouble(request.getParameter("edit_maxDiscount"));
        double required = Double.parseDouble(request.getParameter("edit_minimumApplied"));
        String description = request.getParameter("edit_description");

        Voucher voucher = new Voucher(id, discount, date, maxDiscount, required, description);

        voucherDAO.edit(voucher);
        
        doGet_display(request, response);
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

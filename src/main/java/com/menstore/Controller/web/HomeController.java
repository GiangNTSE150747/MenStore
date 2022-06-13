/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.Controller.web;

import com.menstore.DAO.IProductDAO;
import com.menstore.DAOimpl.WebProductDAO;
import com.menstore.model.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "WebHomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        IProductDAO webProductDAO = new WebProductDAO();
        List<Product> list = new ArrayList<>();
        List<Product> top7list = new ArrayList<>();
        List<Product> top7Randomlist = new ArrayList<>();
        List<Product> top3Cheapestlist = new ArrayList<>();

        list = ((WebProductDAO) webProductDAO).top3_list();
        top7list = ((WebProductDAO) webProductDAO).top7_list();
        top7Randomlist = ((WebProductDAO) webProductDAO).top7_random_list();
        top3Cheapestlist = ((WebProductDAO) webProductDAO).top3_cheapest_list();

        request.setAttribute("list", list);
        request.setAttribute("top7list", top7list);
        request.setAttribute("top7Randomlist", top7Randomlist);
        request.setAttribute("top3Cheapestlist", top3Cheapestlist);

        RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

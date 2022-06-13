/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.menstore.Controller.web;

import com.menstore.DAO.IOrderDAO;
import com.menstore.DAO.IUserDAO;
import com.menstore.DAO.IVoucherDAO;
import com.menstore.DAOimpl.OrderDAO;
import com.menstore.DAOimpl.UserDAO;
import com.menstore.DAOimpl.VoucherDAO;
import com.menstore.model.Cart;
import com.menstore.model.CartItem;
import com.menstore.model.UserSession;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.menstore.DAO.IOrderDetailDAO;
import com.menstore.DAO.IProductDAO;
import com.menstore.DAOimpl.OrderDetailDAO;
import com.menstore.DAOimpl.WebProductDAO;
import com.menstore.model.Order;
import com.menstore.model.OrderDetail;
import com.menstore.model.Product;
import com.menstore.model.User;
import com.menstore.model.Voucher;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author MyPC
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            doGet_DisplayCart(request, response);
        } else {
            if (action.equalsIgnoreCase("buy")) {
                doGet_Buy(request, response);
            } else if (action.equalsIgnoreCase("remove")) {
                doGet_Remove(request, response);
            } else if (action.equalsIgnoreCase("update")) {
                doGet_Update(request, response);
            } else if (action.equalsIgnoreCase("checkVoucher")) {
                doGet_CheckVoucher(request, response);
            } else if (action.equalsIgnoreCase("checkout")) {
                doGet_Checkout(request, response);
            }
        }
    }

    protected void doGet_DisplayCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ss = request.getSession(true);
        if (ss.getAttribute("cart") == null) {
            ss.setAttribute("cart", new Cart());
        }
        request.getRequestDispatcher("views/web/cart.jsp").forward(request, response);
    }

    protected void doGet_Checkout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        UserSession userSession = (UserSession) session.getAttribute("usersession");

        if (cart == null || cart.getItemCount() == 0) {
            request.setAttribute("message", "Giỏ hàng trống");
            request.setAttribute("colorMessage", "#d84d66");  //red
            request.getRequestDispatcher("views/web/cart.jsp").forward(request, response);
        } else {
            IOrderDAO orderDAO = new OrderDAO();
            IUserDAO userDAO = new UserDAO();
            IOrderDetailDAO orderDetailDAO = new OrderDetailDAO();

            String invoiceId = "HD" + (orderDAO.getNoOfRecords() + 1);
            double discountedPrice = cart.getDiscounted();
            Date orderDate = new Date(System.currentTimeMillis());
            double subTotal = cart.getSubTotal();
            String note = request.getParameter("note");
            String status = "Đang xử lý";
            String userId;

            if (userSession != null) {
                userId = userSession.getUser().getUserId();
            } else {
                userId = "US" + (userDAO.getNoOfRecords() + 1);
                userDAO.saveWalkInGuest(userId, request.getParameter("name"), request.getParameter("phone"), request.getParameter("address"));
            }
            System.out.println("đang check nè");
            String voucher = cart.getVoucherId();
            System.out.println("check ra voucher :" + cart.getVoucherId());

//            System.out.println("subtotal: "+subTotal);
//            System.out.println("dis: "+discountedPrice);
            if (userSession != null) {
                User user = userSession.getUser();
                String checkPoint = request.getParameter("point");
                if (checkPoint.equals("yes")) {
                    System.out.println("Yes");
                    discountedPrice += user.getPoint() * 1000;
                    subTotal -= user.getPoint() * 1000;
                    if (subTotal < 0) {
                        subTotal = 0;
                        discountedPrice = cart.getTotal();
                        userDAO.updatePoint(userId, (int) (user.getPoint() - cart.getTotal()/1000));
                        user.setPoint((int) (user.getPoint() - cart.getTotal()/1000));
                    } else{                       
                    userDAO.resetPoint(userId);
                    user.setPoint(0);
                    }
                } else if (checkPoint.equals("no")) {
                    int point = user.getPoint();
                    point += subTotal / 10000;
                    user.setPoint(point);
                    userDAO.updatePoint(user.getUserId(), point);
                    if (subTotal > 0) {
                        request.setAttribute("pointMsg", "Xin chúc mừng! Bạn nhận được " + (int) (subTotal / 10000) + " điểm thưởng");
                    }
                }
                userSession.setUser(user);
            }

            Order order = new Order(invoiceId, discountedPrice, orderDate, subTotal, note, status, userId, voucher);
            if (orderDAO.save(order) == true) {
                for (CartItem item : cart.getList()) {
                    OrderDetail orderDetail = new OrderDetail(invoiceId, item.getProduct().getProductId(), item.getSoldPrice(), item.getQuantity());
                    orderDetailDAO.save(orderDetail);
                }
            }

            session.setAttribute("checkedSs", null);
            session.setAttribute("usersession", userSession);
            session.setAttribute("cart", new Cart());
            RequestDispatcher rd = request.getRequestDispatcher("views/web/cart.jsp");
            request.setAttribute("message", "Đặt hàng thành công");
            request.setAttribute("colorMessage", "#13d493"); //green
            rd.forward(request, response);
        }

    }

    protected void doGet_Update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        int index = isExisting(request.getParameter("id"), cart);
        String direction = request.getParameter("direc");
        int updatedQuantity = ((CartItem) cart.getList().get(index)).getQuantity() + (direction.equals("up") ? 1 : -1);
        if (updatedQuantity > 0) {
            ((CartItem) cart.getList().get(index)).setQuantity(updatedQuantity);
            cart.updateCartMoney();
            session.setAttribute("cart", cart);
            RequestDispatcher rd = request.getRequestDispatcher("views/web/cart.jsp");
            response.sendRedirect("cart");
        } else {
            doGet_Remove(request, response);
        }

    }

    protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        int index = isExisting(request.getParameter("id"), cart);
        cart.getList().remove(index);
        cart.updateCartMoney();
        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }

    protected void doGet_Buy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        IProductDAO webProductDAO = new WebProductDAO();
        HttpSession session = request.getSession();
        System.out.println(request.getParameter("name") + " va " + request.getParameter("size"));
        if (session.getAttribute("cart") == null) {
            Cart cart = new Cart();
            cart.addCart(new CartItem(((WebProductDAO) webProductDAO).find(request.getParameter("name"), request.getParameter("size")), Double.parseDouble(request.getParameter("price")),
                    1, Double.parseDouble(request.getParameter("price"))));
            session.setAttribute("cart", cart);
        } else {
            Product product = ((WebProductDAO) webProductDAO).find(request.getParameter("name"), request.getParameter("size"));
            Cart cart = (Cart) session.getAttribute("cart");
            int index = isExisting(product.getProductId(), cart);
            if (index == -1) {
                cart.addCart(new CartItem(product, Double.parseDouble(request.getParameter("price")),
                        1, Double.parseDouble(request.getParameter("price"))));
            } else {
                int quantity = ((CartItem) cart.getList().get(index)).getQuantity() + 1;
                ((CartItem) cart.getList().get(index)).setQuantity(quantity);
                cart.updateCartMoney();
            }
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("cart");
    }

    protected void doGet_CheckVoucher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String voucherId = request.getParameter("voucherId");
        IVoucherDAO voucherDAO = new VoucherDAO();
        String checkDuedate = "";
        int voucher_DiscountPercent = voucherDAO.loadDiscountedPercent(voucherId);
        if (voucher_DiscountPercent > 0) {
            Voucher voucher = voucherDAO.find(voucherId);
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            checkDuedate = "Voucher đã hết hạn";
            if (voucher != null && voucher.getDueDate().after(date)) {
                request.setAttribute("voucher_discountPercent", voucher_DiscountPercent);
                session.setAttribute("voucher", voucherDAO.find(voucherId));
                double discountedMoney = (voucher_DiscountPercent / 100.0) * cart.getTotal();
//              
//            cart.setDiscounted(discountedMoney);
                cart.setVoucherId(voucherId);
                session.setAttribute("cart", cart);
                checkDuedate = "Voucher còn hạng";
                session.setAttribute("voucherMsgSs", "Giảm giá từ Voucher: -");

            } else {
                session.setAttribute("voucher", null);
                session.setAttribute("voucherMsgSs", null);
                request.setAttribute("voucher_message", checkDuedate);
            }
        } else {
//            cart.setDiscounted(0);
            session.setAttribute("voucher", null);
            session.setAttribute("voucherMsgSs", null);
            request.setAttribute("voucher_message", "Voucher không tồn tại");

        }

        request.getRequestDispatcher("views/web/cart.jsp").forward(request, response);
    }

    private int isExisting(String id, Cart cart) {
        if (cart == null) {
            return -1;
        }
        for (int i = 0; i < cart.getItemCount(); i++) {
            if (((CartItem) (cart.getList().get(i))).getProduct().getProductId().equalsIgnoreCase(id)) {
                return i;
            }
        }
        return -1;

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

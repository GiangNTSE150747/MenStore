<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidebar" data-image="${pageContext.request.contextPath}/views/admin/img/sidebar-5.jpg">
    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="home" class="simple-text" style="font-size: 16px; display: inline">
                Home
            </a>
            <a href="information" class="simple-text" style="font-size: 16px; display: inline; color: #fbfb0e">
                | Tài khoản
            </a>
        </div>
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                    <i class="fa fa-circle"></i> 
                    <p>Danh sách đơn hàng</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="${pageContext.request.contextPath}/product">
                    <i class="fa fa-circle"></i> 
                    <p>Danh sách sản phẩm</p>
                </a>
            </li>
<!--            <li>
                <a class="nav-link" href="${pageContext.request.contextPath}/running-out-stock">
                    <i class="fa fa-circle"></i> 
                    <p>Running out stock</p>
                </a>
            </li>-->
            <li>
                <a class="nav-link" href="${pageContext.request.contextPath}/voucher">
                    <i class="fa fa-circle"></i> 
                    <p>Danh sách voucher</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="${pageContext.request.contextPath}/access?action=logout">
                    <i class="fa fa-circle"></i> 
                    <p>Đăng xuất</p>
                </a>
            </li>
        </ul>
    </div>
</div>

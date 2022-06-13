<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
    <head>
        <c:url var="linkSource" value="${request.contextPath}/views/web" />

        <title>Chi tiết sản phẩm</title>
        <link rel="icon" type="image/png"  href="${pageContext.request.contextPath}/views/web/images/mens-store-logo.png">

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Maven+Pro:400,900,700,500' rel='stylesheet' type='text/css'>
        <link href="${linkSource}/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script src="${linkSource}/js/jquery.min.js" type="text/javascript"></script>
        <!-- start details -->
        <link rel="stylesheet" type="text/css" href="${linkSource}/css/productviewgallery.css" media="all" />
        <script type="text/javascript" src="${linkSource}/js/cloud-zoom.1.0.3.min.js"></script>
        <script type="text/javascript" src="${linkSource}/js/jquery.fancybox.pack.js"></script>
        <script type="text/javascript" src="${linkSource}/js/productviewgallery.js"></script>
        <!--- start-mmmenu-script---->
        <script src="${linkSource}/js/jquery.min.js" type="text/javascript"></script>
        <link type="text/css" rel="stylesheet" href="${linkSource}/css/jquery.mmenu.all.css" />
        <script type="text/javascript" src="${linkSource}/js/jquery.mmenu.js"></script>

        <script type="text/javascript">
            //	The menu on the left
            $(function () {
                $('nav#menu-left').mmenu();
            });
        </script>
        <!-- start top_js_button -->
        <script type="text/javascript" src="${linkSource}/js/easing.js"></script>
        <script type="text/javascript" src="${linkSource}/js/move-top.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>
    </head>
    <body>
        <!-- start header -->
        <jsp:include page="header.jsp"/>

        <!-- start top_bg -->
        <div class="top_bg" style="margin-top: 120px">
            <div class="wrap">
                <div class="main_top">
                    <h4 class="style">CHI TIẾT SẢN PHẨM</h4>
                </div>
            </div>
        </div>
        <!-- start main -->
        <div class="main_bg" style="position: relative; z-index: 0">
            <div class="wrap">
                <div class="main">
                    <!-- start content -->
                    <div class="single">
                        <!-- start span1_of_1 -->
                        <div>
                            <div class="span1_of_1">
                                <!-- start product_slider -->
                                <div class="product-view">
                                    <div class="product-essential">
                                        <div class="product-img-box">

                                            <div class="product-image"> 
                                                <a class="cs-fancybox-thumbs cloud-zoom" rel="adjustX:30,adjustY:0,position:'right',tint:'#202020',tintOpacity:0.5,smoothMove:2,showTitle:true,titleOpacity:0.5" data-fancybox-group="thumb" href="${requestScope.product.linkImage}" title="Women Shorts" alt="Women Shorts">
                                                    <img style="z-index: 0 !important; object-fit: cover" src="${requestScope.product.linkImage}" width="450" height="450" alt="Women Shorts" title="" />
                                                </a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- end product_slider -->
                            </div>
                            <!-- start span1_of_1 -->
                            <div class="span1_of_1_des">
                                <div class="desc1">
                                    <h3>${requestScope.product.productName}</h3>
                                    <h5>${requestScope.product.price - requestScope.product.price*(requestScope.product.discount)/100} 
                                        <c:if test="${requestScope.product.discount > 0}"><span>${requestScope.product.price}</span> </c:if> VNĐ
                                        </h5>
                                        <div class="available">
                                            <div class="btn_form">
                                                <form action="cart?action=buy" method="post">
                                                    <input type="hidden" name="name" value="${requestScope.product.productName}">
                                                <input type="hidden" name="price" value="${requestScope.product.price - requestScope.product.price*(requestScope.product.discount/100)}">

                                                <c:if test="${not empty sizes}">
                                                    <select name="size" style="height: 42px; border-radius: 5px;" class="form-control">
                                                        <c:forEach var="size" items="${sizes}">
                                                            <option value="${size}">${size}</option>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                                <c:if test="${empty sizes}">
                                                    <select name="size" style="height: 42px; border-radius: 5px;" class="form-control">
                                                        <option value="S">A</option>
                                                        <option value="M">B</option>
                                                        <option value="L">C</option>
                                                    </select>
                                                </c:if>

                                                <input type="submit" value="Add to Cart" />
                                            </form>

                                        </div>
                                        <p>Size:
                                            <c:if test="${not empty sizes}">
                                                <c:forEach var="size" items="${sizes}">
                                                    ${size}.&nbsp;
                                                </c:forEach>
                                            </c:if>
                                                <c:if test="${empty sizes}">${0}</c:if>
                                                <br>
                                            Với phong cách thanh lịch, gọn gàng. Sản phẩm luôn được chọn là món đồ phải có trong mọi tủ đồ của nam giới!</p>
                                        <hr>
                                        <c:if test="${requestScope.product.discount > 0}"><p style="color: #00BCD4; font-weight: bold; font-size: 1.1em">Sản phẩm được giảm giá lên đến ${requestScope.product.discount}%</p></c:if>
                                        </div>

                                    </div>
                                </div>
                                <div class="clear"></div>
                                <!-- start left content_bottom -->

                                <!-- end left content_bottom -->
                            </div>
                            <!-- start left_sidebar -->
                        </div>	
                        <!-- end content -->
                    </div>
                </div>
            </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
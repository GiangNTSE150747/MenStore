<%-- 
    Document   : home
    Created on : Mar 2, 2022, 9:47:53 PM
    Author     : MyPC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/" %>

<!-- ĐÃ SỬA -->

<!DOCTYPE HTML>
<html lang="">
    <head>
        <title>Menstore</title>
       
        <link rel="icon" type="image/png"  href="${pageContext.request.contextPath}/views/web/images/mens-store-logo.png">
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Maven+Pro:400,900,700,500' rel='stylesheet' type='text/css'>
        <link href="${pageContext.request.contextPath}/views/web/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--- start-mmmenu-script---->
        <script src="${pageContext.request.contextPath}/views/web/js/jquery.min.js" type="text/javascript"></script>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/views/web/css/jquery.mmenu.all.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/views/web/js/jquery.mmenu.js"></script>
        <script type="text/javascript">
            //	The menu on the left
            $(function () {
                $('nav#menu-left').mmenu();
            });
        </script>
        <!-- start slider -->
        <link href="${pageContext.request.contextPath}/views/web/css/slider.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/views/web/js/jquery.eislideshow.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/views/web/js/easing.js"></script>
        <script type="text/javascript">
            $(function () {
                $('#ei-slider').eislideshow({
                    animation: 'center',
                    autoplay: true,
                    slideshow_interval: 3000,
                    titlesFactor: 0
                });
            });
        </script>
        <!-- start top_js_button -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/views/web/js/move-top.js"></script>
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
        <c:set var="changedMsg" value="${changed}"/>                   <!-- changed password success message-->
        <c:if test="${not empty changedMsg}">

            <script>
                confirm("${changedMsg}");
            </script>   
            <c:remove var="changed" scope="session"/>
        </c:if>
            
        <!-- Start header -->
        <jsp:include page="header.jsp"/>
        <!-- End Header -->

        <!-- start slider -->
        <div class="slider" style="margin-top: 120px; position: relative; z-index: 0;">
            <!---start-image-slider---->
            <div class="image-slider">
                <div class="wrapper">
                    <div id="ei-slider" class="ei-slider">
                        <c:set var="productList" value="${requestScope.top7Randomlist}" />
                        <ul  class="ei-slider-large">
                            <c:forEach var="product" items="${productList}">
                                <c:url var="productDetail" value="${request.contextPath}/detail" scope="request">
                                    <c:param name="productName" value="${product.productName}"></c:param>
                                </c:url>
                                <li>
                                    <img src="${pageContext.request.contextPath}/views/web/images/slider-image2.jpg" alt="image04"/>
                                    <div class="ei-title">
                                        <c:set var="actuaPrice" value="${(product.price - product.price*product.discount/100)/1000}k"/>
                                        <h3 class="btn"><a href="${productDetail}" style=" color: #FFFFFF">${actuaPrice} VNĐ</a></h3>
                                        <h2>${product.productName}</h2>

                                        <h3>
                                            <img src="${product.linkImage}" alt="${product.productName}" width="250px" height="250px" style="object-fit: cover">
                                        </h3>
                                    </div>
                                </li>
                            </c:forEach>

                        </ul>
                        <!-- ei-slider-large -->
                        <ul class="ei-slider-thumbs">                            
                            <c:set var="productList" value="${requestScope.top7Randomlist}" />                          
                            <c:forEach var="product" items="${productList}">
                                <c:url var="productDetail" value="${request.contextPath}/detail" scope="request">
                                    <c:param name="productName" value="${product.productName}"></c:param>
                                </c:url>
                                <li><a href=""><span style="font-size:0.35cm">${product.productName}</span> <p></p></a><img src="${product.linkImage}" alt="thumb07" /></li>
                            </c:forEach>

                        </ul><!-- ei-slider-thumbs -->

                    </div><!-- ei-slider -->
                </div><!-- wrapper -->
            </div>
            <!---End-image-slider---->	
        </div>
        <!-- start image1_of_3 -->
        <!--        <div class="top_bg">
                    <div class="wrap">
                        <div class="main1">
                            <div class="image1_of_3">
                                <img src="https://cdn.shopify.com/s/files/1/0246/3668/6402/products/black_front_ab4cc71d-5e23-462d-8938-f7f6278f4c71_2048x2048.jpg?v=1577127966" alt=""/>
                                <a href="products?show=onsale"><span class="tag">on sale</span></a>
                            </div>
                            <div class="image1_of_3">
                                <img src="https://www.hobbycorner.co.nz/user/images/6340_300_300.jpg?t=1507071001" alt=""/>
                                <a href="products?list=are"><span class="tag">special offers</span></a>
                            </div>
                            <div class="image1_of_3">
                                <img src="https://znews-photo.zadn.vn/w660/Uploaded/rohunwa/2020_04_13/skinny_jeans.jpg" alt=""/>
                                <a href="details.html"><span class="tag">must have</span></a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>-->

        <!-- start main -->
        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <div class="top_main" >
                        <h2>Những sản phẩm bán chạy nhất tại MenStore</h2>

                        <div class="clear"></div>
                    </div>

                    <c:set var="productList" value="${requestScope.list}" />
                    <div class="grids_of_3">
                        <c:forEach var="product" items="${productList}">
                            <tag:show3Product name="${product.productName}" image="${product.linkImage}" price="${product.price}" discount="${product.discount}"/>                           
                        </c:forEach>
                    </div>
                    <div class="clear"></div>   
                    <!-- start grids_of_3 -->



                    <div class="top_main">
                        <h2>Những sản phẩm gợi ý cho bạn</h2>
                        <div class="clear"></div>
                    </div>

                    <c:set var="productList" value="${requestScope.top3Cheapestlist}" />
                    <div class="grids_of_3">
                        <c:forEach var="product" items="${productList}">
                            <tag:show3Product name="${product.productName}" image="${product.linkImage}" price="${product.price}" discount="${product.discount}"/>                                   
                        </c:forEach>
                    </div>
                    <div class="clear"></div>  


                    <!-- start grids_of_2 -->

                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
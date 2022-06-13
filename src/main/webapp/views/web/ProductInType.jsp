<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/" %>
<!--Da sua
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Sản phẩm</title>
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
        <!-- start top_js_button -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/views/web/js/easing.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/views/web/js/move-top.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>

        <style>
            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
            }

            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }

            .pagination a:hover:not(.active) {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <!-- start header -->
        <jsp:include page="header.jsp"/>

        <!-- start top_bg -->
        <div class="top_bg" style="margin-top: 120px">
            <div class="wrap">
                <div class="main_top">
                    <h4 class="style">SẢN PHẨM</h4>
                </div>
            </div>
        </div>
        <!-- start main -->
        <c:set var="listType" value="${requestScope.listType}" />

        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <div class="top_main">
                        <a style="position: absolute;" href="products">Trở lại</a>
                        <c:if test="${(param.listType=='Ao' || param.listType=='Quan' || param.listType=='Giay')}">
                            <a style="position: right;" href="products?listType=${param.listType}&sort=UP">Sắp xếp Tăng Dần</a>


                            <a style="position: right;" href="products?listType=${param.listType}&sort=DOWN">Sắp xếp Giảm Dần</a>
                        </c:if>
                        <br>
                        <div class="clear"></div>
                    </div>

                    <!-- start grids_of_3 -->
                    <c:set var="list" value="${requestScope.list}" />
                    <c:set var="count" value="${1}"/>

                    <c:forEach var="product" items="${requestScope.list}">
                        <tag:showProductByType name="${product.productName}" image="${product.linkImage}" price="${product.price}" discount="${product.discount}" count="${count}"/>
                        
                        <c:set var="count" value="${count + 1}"/>
                    </c:forEach>

                    <div class="clear"></div>   <br>       
                    
                    <c:if test="${(param.listType=='Ao' || param.listType=='Quan' || param.listType=='Giay')}">
                        <c:if test="${(param.sort==null)}">
                            <div style="text-align: center; margin-top: 20px;">
                                <div class="pagination">
                                    <c:if test="${currentPage != 1}">
                                        <a href="products?listType=${requestScope.listType}&page=${currentPage - 1}">PREVIOUS</a>
                                    </c:if>
                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                        <c:choose>
                                            <c:when test="${currentPage eq i}">
                                                <a class="page-link active">${i}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="products?listType=${requestScope.listType}&page=${i}" class="page-link">${i}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <c:if test="${currentPage lt noOfPages}">
                                        <a href="products?listType=${requestScope.listType}&page=${currentPage + 1}">NEXT</a>
                                    </c:if>   
                                </div>
                            </div>
                        </c:if>


                        <c:if test="${(param.sort!=null)}">
                            <div style="text-align: center; margin-top: 20px;">
                                <div class="pagination">
                                    <c:if test="${currentPage != 1}">
                                        <a href="products?listType=${requestScope.listType}&sort=${requestScope.sort}&page=${currentPage - 1}">PREVIOUS</a>
                                    </c:if>
                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                        <c:choose>
                                            <c:when test="${currentPage eq i}">
                                                <a class="page-link active">${i}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="products?listType=${requestScope.listType}&sort=${requestScope.sort}&page=${i}" class="page-link">${i}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <c:if test="${currentPage lt noOfPages}">
                                        <a href="products?listType=${requestScope.listType}&sort=${requestScope.sort}&page=${currentPage + 1}">NEXT</a>
                                    </c:if>   
                                </div>
                            </div>
                        </c:if>
                    </c:if>



                </div>
            </div>
        </div>
        <!-- start footer -->
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
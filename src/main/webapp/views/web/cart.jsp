<%@page import="java.text.DecimalFormat" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Da sua
-->
<!DOCTYPE HTML>
<html>
    <c:url var="linkSource" value="${request.contextPath}/views/web" />

    <head>
        <title>Giỏ hàng</title>
        <link rel="icon" type="image/png"  href="${pageContext.request.contextPath}/views/web/images/mens-store-logo.png">

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Mavsen+Pro:400,900,700,500' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="${linkSource}/css/cart.css">
        <link rel="stylesheet" href="${linkSource}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${linkSource}/font/fontawesome-free-6.0.0-web/css/all.css">
        <link href="${linkSource}/css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--- start-mmmenu-script---->
        <script src="${linkSource}/js/jquery.min.js" type="text/javascript"></script>
        <link type="text/css" rel="stylesheet" href="${linkSource}/css/jquery.mmenu.all.css" />
        <script type="text/javascript" src="${linkSource}/js/jquery.mmenu.js"></script>

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />

        <script type="text/javascript">
            //	The menu on the left
            $(function () {
                $('nav#menu-left').mmenu();
            });
        </script>
        <!-- start slider -->
        <link href="${linkSource}/css/slider.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="${linkSource}/js/jquery.eislideshow.js"></script>
        <script type="text/javascript" src="${linkSource}/js/easing.js"></script>
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
        <c:if test="${not empty pointMsg}">
            <script>
                alert("${pointMsg}");
            </script>
            <c:remove var="pointMsg"/>
        </c:if>

        <!-- start header -->
        <jsp:include page="header.jsp"/>
        <!-- start top_bg -->
        <div class="top_bg" style="margin-top: 120px">
            <div class="wrap">
                <div class="main_top">
                    <h4 class="style">Giỏ Hàng</h4>
                </div>
            </div>
        </div>
        <!-- start slider -->
        <div class="gray_bg">
            <div class="container p-3 rounded cart gray_bg">
                <div class="row no-gutters">
                    <div class="col-md-8 same-height">

                        <div class="product-details mr-2">
                            <hr>
                            <div class="d-flex justify-content-between">
                                <c:if test="${sessionScope.cart.itemCount>0}">
                                    <span>Bạn đang có ${sessionScope.cart.itemCount} món hàng trong giỏ</span>
                                </c:if>
                                <!--                                     <div class="d-flex flex-row align-items-center"><span class="text-black-50">Sort
                                                                                    by:</span>
                                                                            <div class="price-cart ml-2"><span class="mr-2">Price</span><i
                                                                                            class="fa fa-angle-down"></i>
                                                                            </div>
                                                                    </div> -->
                            </div>
                            <c:set var="msg" value="${message}"/>
                            <c:if test="${empty msg}">
                                <c:if test="${sessionScope.cart.itemCount == 0}">
                                    <hr>
                                    <h1>Giỏ hàng của bạn đang trống!!</h1>
                                </c:if>
                            </c:if>
                            <c:if test="${not empty msg}">
                                <hr>
                                <h1 style="color: ${colorMessage}; font-size: 20px; text-transform: capitalize">${msg}</h1>
                            </c:if>
                            <c:forEach var="item" items="${sessionScope.cart.list}">

                                <div class="d-flex justify-content-between align-items-center mt-3 p-4 items rounded white_bg">
                                    <div class="d-flex flex-row"><img class="rounded"
                                                                      src="${item.product.linkImage}"
                                                                      height="120">
                                        <div class="ml-5 a-space"><span class="font-weight-bold d-block">${item.product.productName}</span>
                                            <span class="spec">Size: ${item.product.size}</span></div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center">
                                        <i class="fa-solid fa-angle-left mr-1"></i>
                                        <a href="${pageContext.request.contextPath}/cart?action=update&id=${item.product.productId}&direc=down"><i class="material-icons">arrow_downward</i></a>
                                        <span class="d-block"> ${item.quantity} </span>
                                        <a href="${pageContext.request.contextPath}/cart?action=update&id=${item.product.productId}&direc=up"><i class="material-icons">arrow_upward</i></a>
                                        <i class="fa-solid fa-angle-right ml-1"></i>
                                        <span class="d-block ml-5 font-weight-bold">${item.soldPrice} VNĐ</span>
                                        <a href="${pageContext.request.contextPath}/cart?action=remove&id=${item.product.productId}"><i class="material-icons">close</i></a>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>

                    </div>


                    <div  class="col-md-4 stick-board">
                        <div class="payment-info">

                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="checkout"/>
                                <div class="d-flex justify-content-between align-items-center"><span>Thông tin khách</span><img
                                        class="rounded"
                                        src="https://img.hoidap247.com/picture/question/20200508/large_1588936738888.jpg"
                                        width="42">
                                </div>

                                <div>
                                    <label class="credit-card-label">Tên</label><input value="${sessionScope.usersession.user.name}"  
                                                                                       name="name" type="text"
                                                                                       class="form-control credit" id="nameW" placeholder="Tên" required="true">
                                </div>

                                <div>
                                    <label class="credit-card-label">Số điện thoại</label><input value="${sessionScope.usersession.user.phoneNumber}" 
                                                                                                 name="phone" type="text"
                                                                                                 class="form-control credit" id="phoneW" placeholder="Số điện thoại" required="true">
                                </div>

                                <div>
                                    <label class="credit-card-label">Địa chỉ</label><input value="${sessionScope.usersession.user.address}" 
                                                                                           name="address" type="text"
                                                                                           class="form-control credit " id="addressW" placeholder="Địa chỉ" required="true">
                                </div>


                                <div>
                                    <label class="credit-card-label">Điểm</label>
                                    <input type="text"
                                           class="form-control credit" disabled="" 
                                           <c:if test="${not empty usersession}">
                                               value="Điểm hiện có: ${sessionScope.usersession.user.point==null?0:sessionScope.usersession.user.point}  -  Giảm ${sessionScope.usersession.user.point==null?0:sessionScope.usersession.user.point}k khi sử dụng"
                                           </c:if>
                                           <c:if test="${empty usersession}">
                                               value="Đăng nhập ngay để sử dụng điểm thưởng!" style="color: #82bca7"
                                           </c:if>   
                                           >
                                </div>
                                <c:if test="${not empty usersession}">
                                    <div class="row" style="margin-top: 7px; margin-bottom: 10px;">

                                        <c:if test="${param.checked=='yes'}">
                                            <c:set var="pointSs" value="yes" scope="session"/>
                                            <c:set var="checkedSs" value="yes" scope="session"/>
                                        </c:if>

                                        <c:if test="${param.checked=='no'}">
                                            <c:set var="pointSs" value="no" scope="session"/>
                                            <c:set var="checkedSs" value="no" scope="session"/>
                                        </c:if>


                                        <c:if test="${empty param.checked && empty checkedSs}">
                                            <c:if test="${param.checked=='no'}">
                                                <c:set var="pointSs" value="no" scope="session"/>
                                                <c:set var="checkedSs" value="no" scope="session"/>
                                            </c:if>
                                        </c:if>

                                        <c:set var="userPoint" value="${usersession}"/>

                                        <div class="col-md-6">
                                            <input type="radio" name="point" value="yes"

                                                   <c:if test="${checkedSs=='yes' && userPoint.user.point>0}">checked="checked"</c:if>
                                                   <c:if test="${empty userPoint.user.point||userPoint.user.point<=0}">
                                                       <c:set var="checkedSs" value="no"/>
                                                   </c:if>/>
                                            <span>Sử dụng</span> 
                                        </div>
                                        <div class="col-md-6">
                                            <input type="radio" name="point" value="no" 
                                                   <c:if test="${empty checkedSs || checkedSs=='no'}">checked="checked"</c:if> />
                                                   <span>Không Sử dụng</span> 
                                            </div>
                                        </div>

                                        <script>
                                            $(function () {
                                                $("input[name$='point']").click(function () {
                                                    var value = $(this).val();
                                                    if (value == 'yes') {
                                                        window.location.assign("cart?checked=yes");
                                                    } else if (value == 'no') {
                                                        window.location.assign("cart?checked=no");
                                                    }
                                                });
                                            });
                                        </script> 
                                </c:if>

                                <div>
                                    <label class="credit-card-label">Note: </label>
                                    <textarea name="note" type="text" class="form-control credit" id="noteW" placeholder="Note"> 
                                    </textarea>
                                </div>


                                <c:set var="total" value="${sessionScope.cart.total}"/> 
                                <c:set var="dis" value="${sessionScope.voucher.discountedPercent/100}"/>  

                                <c:set var="checkRequ" value="${sessionScope.voucher.required}"/>
                                <c:if test="${total < checkRequ}">
                                    <c:set var="dis" value="${0}"/>
                                    <c:set var="requMsg" value="Chưa đạt đủ điều kiện để áp dụng Voucher"/>
                                </c:if>

                                <c:set var="checkDis" value="${total*dis}"/>
                                <c:if test="${checkDis > sessionScope.voucher.maximumDiscount}">
                                    <c:set var="checkDis" value="${sessionScope.voucher.maximumDiscount}"/>
                                </c:if>


                                <jsp:setProperty name="cart" property="discounted" value="${checkDis}"/>                    
                                <jsp:setProperty name="cart" property="subTotal" value="${total-  checkDis}"/>

                                <%! String num; %>
                                <%! DecimalFormat priceFormatter = new DecimalFormat("$#0.0");%>
                                <button class="btn btn-primary btn-block d-flex justify-content-between mt-3 pb-4   "
                                        type="submit"><span>
                                        <c:set var="userPoint" value="${usersession}"/>
                                        <c:set var="uPoint" value="${userPoint.user.point}" scope="request"/>
                                        <c:if test="${not empty checkedSs && checkedSs=='yes'}">
                                            <c:if test="${not empty userPoint}">
                                                <c:if test="${userPoint.user.point>0}">
                                                    <c:set var="tmpTotal" value="${sessionScope.cart.subTotal/1000}" scope="request"/>  
                                                    <c:set var="checkMinus" value="${tmpTotal-uPoint}"/>

                                                    <c:if test="${checkMinus<0}">
                                                        $ 0.0k (VNĐ)
                                                    </c:if>

                                                    <c:if test="${checkMinus>=0}">
                                                        <%
                                                            num = priceFormatter.format((double) request.getAttribute("tmpTotal") - (int) request.getAttribute("uPoint"));
                                                            out.print(num);
                                                        %> 
                                                        k (VNĐ)
                                                    </c:if>

                                                </c:if>
                                            </c:if> 
                                        </c:if>

                                        <c:if test="${empty checkedSs || checkedSs=='no'}">
                                            <c:set var="tmpTotal" value="${sessionScope.cart.subTotal/1000}" scope="request"/>  
                                            <%
                                                num = priceFormatter.format((double) request.getAttribute("tmpTotal"));
                                                if ((double) request.getAttribute("tmpTotal") < (double) 0) {
                                                    num = "0";
                                                }
                                                out.print(num);
                                            %>  
                                            k (VNĐ)   
                                        </c:if>

                                    </span><span>Thanh toán<i
                                            class="fa fa-long-arrow-right"></i></span></button>


                            </form>   



                            <hr class="line">

                            <c:set var="voucher" value="${voucher}"/>
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="checkVoucher"/>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <input name="voucherId" type="text"
                                               <c:if test="${not empty voucher}" > value="${voucher.voucherID}" </c:if>
                                               <c:if test="${empty voucher}" > placeholder="Voucher" </c:if>
                                                   class="form-control credit" >
                                        </div>
                                        <div class="col-sm-4">
                                            <input style="display: block;height: 100%; border-radius: 10%; border: none; color: white; background-color: gray" type="submit" value="Áp dụng"/>
                                        </div>

                                        <div style="text-align: center; padding: 2px; margin-left: 15px; margin-top: 15px; color: #007bff">
                                        <c:if test="${not empty sessionScope.voucherMsgSs && empty requMsg}">
                                            ${sessionScope.voucherMsgSs}${cart.discounted/1000}k
                                        </c:if>
                                        ${voucher_message}${requMsg}</div>

                                    <c:set var="userPoint" value="${usersession}"/>
                                    <c:if test="${not empty checkedSs && checkedSs=='yes'}">
                                        <c:if test="${not empty userPoint}">
                                            <c:if test="${userPoint.user.point>0}">
                                                <div style="text-align: center; padding: 2px; margin-left: 15px; margin-top: 15px; color: #007bff">
                                                    Giảm giá từ Điểm thưởng: -${userPoint.user.point*1000>cart.total?((cart.total)/1000):(userPoint.user.point)}k
                                                </div>
                                            </c:if>
                                        </c:if> 
                                    </c:if>
                                </div>
                            </form>

                            <hr class="line">
                            <div  class="d-flex justify-content-between information"><span style="font-size: 18px">Tổng tiền</span>
                                <span style="font-size: 18px">
                                    <c:set var="tmpTotal" value="${sessionScope.cart.total/1000}" scope="request"/>  
                                    <%
                                        num = priceFormatter.format((double) request.getAttribute("tmpTotal"));
                                        out.print(num);
                                    %>  
                                    k (VNĐ)
                                </span></div>

                            <!-- up ~176-->               
                            <c:if test="${sessionScope.cart.discounted>0}">
                                <c:set var="colorDiscount" value="#3496ff"/>
                            </c:if>
                            <div class="d-flex justify-content-between information">
                                <span style="color:${colorDiscount}; font-size: 18px">Đã giảm: </span>


                                <c:if test="${not empty checkedSs && checkedSs=='yes'}">
                                    <c:if test="${not empty userPoint}">
                                        <c:if test="${userPoint.user.point>0}">
                                            <c:set var="tmpDis" value="${userPoint.user.point*1000>cart.total?((cart.total)/1000):(userPoint.user.point)}"/>
                                            <span style="color:${colorDiscount}; font-size: 18px">-${tmpDis}k (VNĐ)</span>

                                        </c:if>
                                    </c:if> 
                                </c:if>

                                <c:if test="${empty checkedSs || checkedSs=='no'}">
                                    <span style="color:${colorDiscount}; font-size: 18px">-${sessionScope.cart.discounted/1000}k (VNĐ)</span>
                                </c:if>
                            </div>
                            <!--
                                                        <div class="d-flex justify-content-between information">
                                                            <span>Thành tiền:</span><span>${sessionScope.cart.subTotal/1000}k (VNĐ)</span>
                                                        </div>-->


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- start image1_of_3 -->

        <!-- start footer -->
        <jsp:include page="Footer.jsp"/>
        <script src="${linkSource}/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
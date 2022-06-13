
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Da Sua
-->

<!DOCTYPE HTML>
<html>
    <head>
        <title>Tài khoản</title>
        <link rel="icon" type="image/png"  href="${pageContext.request.contextPath}/views/common/images/edit.png">

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
            #mess{
                color: #FF0000;
                font-size: 20px;
            }


        </style>



    </head>
    <body>
        <c:set var="user" value="${usersession}"/>

        <c:if test="${empty user}">
            <c:redirect url="/login.jsp"/>
        </c:if>
        <!-- start header -->
        <jsp:include page="../web/header.jsp"/>

        <!-- start top_bg -->
        <div class="top_bg">
            <div class="wrap">
                <div class="main_top">
                    <h4 class="style">Thông tin cá nhân</h4>
                </div>
            </div>
        </div>
        <!-- start main -->
        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <div class="login_left">
                        <h3>Đổi mật khẩu</h3>

                        <c:set var="e_mess" value="${msg}" />


                        <c:if test="${empty e_mess}">
                            <p>Recommend: Hãy đặt mật khẩu dễ nhớ</p>
                        </c:if>

                        <c:if test="${not empty e_mess}"> <p  id="mess">${e_mess}</p></c:if>

                            <!-- start registration -->
                            <div class="registration">
                                <!-- [if IE] 
                                    < link rel='stylesheet' type='text/css' href='ie.css'/>  
                                 [endif] -->  

                                <!-- [if lt IE 7]>  
                                    < link rel='stylesheet' type='text/css' href='ie6.css'/>  
                                <! [endif] -->  
                                <script>
                                    (function () {

                                        // Create input element for testing
                                        var inputs = document.createElement('input');

                                        // Create the supports object
                                        var supports = {};

                                        supports.autofocus = 'autofocus' in inputs;
                                        supports.required = 'required' in inputs;
                                        supports.placeholder = 'placeholder' in inputs;

                                        // Fallback for autofocus attribute
                                        if (!supports.autofocus) {

                                        }

                                        // Fallback for required attribute
                                        if (!supports.required) {

                                        }

                                        // Fallback for placeholder attribute
                                        if (!supports.placeholder) {

                                        }

                                        // Change text inside send button on submit
                                        var send = document.getElementById('register-submit');
                                        if (send) {
                                            send.onclick = function () {
                                                this.innerHTML = '...Sending';
                                            }
                                        }

                                    })();
                                </script>
                                <div class="registration_left">
                                    <div class="registration_form">
                                        <!-- Form -->
                                        <form id="registration_form" action="information" method="post">
                                            <input type="hidden" name="action" value="updatePassword"/>
                                            <div>
                                                <label>
                                                    <span>Mật khẩu cũ</span><input name="oldPassword" placeholder="" type="password" tabindex="5" required="">
                                                </label>
                                            </div>

                                            <div>
                                                <label>	
                                                    <span>Mật khẩu mới</span> <input name="newPassword" placeholder="" type="password" tabindex="6" required="">
                                                </label>
                                            </div>

                                            <div>
                                                <label>	
                                                    <span>Xác nhận mật khẩu</span> <input name="rePassword" placeholder="" type="password" tabindex="7" required="">
                                                </label>
                                            </div>
                                            <div>
                                                <input type="submit" value="Xác nhận" id="register-submit">
                                            </div>

                                        </form>
                                        <!-- /Form -->
                                    </div>
                                </div>
                            </div>
                            <!-- end registration -->
                        </div>
                        <div class="login_left">
                            <h3>Thông tin tài khoản</h3>
                        <c:set var="ism" value="${ismsg}"/>
                        <c:if test="${not empty ism}">
                            <p style=" color: #4CBB17; font-size: 20px;">${ism}</p>
                        </c:if>

                        <c:set var="ifm" value="${ifmsg}"/>
                        <c:if test="${not empty ifm}">
                            <p class="mess">${ifm}</p>
                        </c:if>
                        <div class="registration_left">
                            <div class="registration_form">
                                <!-- Form -->
                                <form id="registration_form" action="information" method="post">
                                    <input type="hidden" name="action" value="updateInfor"/>
                                    <div>
                                        <label>
                                            <span>Tên người dùng</span><input name="name" value="${sessionScope.usersession.user.name}" type="text" tabindex="1" required="" autofocus="">
                                        </label>
                                    </div>

                                    <div>
                                        <label>
                                            <span>Số điện thoại</span><input name="phoneNumber" value="${sessionScope.usersession.user.phoneNumber}" type="text" tabindex="2" required="">
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                            <span>Địa chỉ</span><input name="address" value="${sessionScope.usersession.user.address}" type="text" tabindex="3" required="">
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                            <span>Điểm tích lũy</span><input disabled="" value="${sessionScope.usersession.user.point}" type="text" tabindex="4">
                                        </label>
                                    </div>
                                    <div>
                                        <input type="submit" value="Cập nhật tài khoản" id="register-submit">
                                    </div>

                                </form>
                                <!-- /Form -->
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- start footer -->
        <jsp:include page="../web/Footer.jsp"/>
    </body>
</html>
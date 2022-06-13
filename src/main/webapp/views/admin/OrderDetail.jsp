<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/views/admin/img/apple-icon.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/views/admin/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Customer order</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- CSS Files -->
        <link href="${pageContext.request.contextPath}/views/admin/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/views/admin/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/views/admin/css/qldata.css" rel="stylesheet"/>
    </head>

    <body>


        <div class="wrapper">

            <jsp:include page="Menu.jsp"/>  


            <div class="main-panel">
                <!-- Navbar -->

                <!-- End Navbar -->
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="container-fluid"> 
                                <div class="card-body ">
                                    <div class="table-responsive">
                                        <div class="table-wrapper">

                                            <div class="table-title">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <h2>CHI TIẾT HÓA ĐƠN</h2>
                                                    </div>

                                                </div>
                                            </div>
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Mã</th>

                                                        <th>Mã sản phẩm</th>
                                                        <th>Giá bán ra</th>
                                                        <th>Số lượng</th>
                                                        <th>Thành tiền</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <div class="table table-striped table-hover">
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h5>Khách hàng: <span style="font-size: larger;">${requestScope.user.name}</span></h5>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <h5>SĐT: <span style="font-size: larger;">${requestScope.user.phoneNumber}</span></h5>
                                                        </div>

                                                        <div class="col-sm-6">
                                                            <h5>Địa chỉ giao hàng: <span style="font-size: larger;">${requestScope.user.address}</span></h5>
                                                        </div>  

                                                    </div>
                                                </div>
                                                <hr>
                                                <c:set var="orderDetailList" value="${requestScope.list}" />
                                                <c:set var="count" value="${0}" />

                                                <c:forEach var="orderDetail" items="${orderDetailList}">
                                                    <tr>
                                                        <td>${orderDetail.invoiceId}</td>
                                                        <td>${orderDetail.productId}</td>
                                                        <td>${orderDetail.soldPrice}</td>
                                                        <td>${orderDetail.quantity}</td>
                                                        <td>${orderDetail.soldPrice * orderDetail.quantity}</td>
                                                    </tr>
                                                    <c:set var="count" value="${count + 1}" />
                                                </c:forEach>

                                                </tbody>

                                            </table>                                                    
                                            <div class="clearfix">


                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="Footer.jsp"/>

    </body>
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/views/admin/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/views/admin/js/core/popper.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/views/admin/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="${pageContext.request.contextPath}/views/admin/js/plugins/bootstrap-switch.js"></script>
    <!--  Chartist Plugin  -->
    <script src="${pageContext.request.contextPath}/views/admin/js/plugins/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="${pageContext.request.contextPath}/views/admin/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/views/admin/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#selectAllOrderCheckBox").click(function () {
                $(".CustomerOrderCheckBox").not(this).prop('checked', this.checked);
            });
        });


    </script>

</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/"%>

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
        
        <c:set var="changedMsg" value="${changed}"/>                   <!-- changed password success message-->
        <c:if test="${not empty changedMsg}">

            <script>
            confirm("${changedMsg}");
            </script>   
            <c:remove var="changed" scope="session"/>
        </c:if>
        <div class="wrapper">

            <jsp:include page="Menu.jsp"/>  


            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                    <div class="container-fluid">
                        <form action="admin" method="post"> 
                            <input type="hidden" name="action" value="search"/>
                            <input name="orderId" class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Enter ID..." aria-label="Search">
                            
                        </form>
                    </div>
                </nav>
                <!-- End Navbar -->
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="container-fluid"> 
                                <div class="card-body ">
                                    <div class="table-responsive">
                                        <div class="table-wrapper">
                                            <form action="admin" method="post">
                                                <input type="hidden" name="action" value="delete"/>
                                                <div class="table-title">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <h2>DANH SÁCH ĐƠN HÀNG</h2>
                                                        </div>

                                                        <div class="col-sm-6">
                                                            <input style="background-color: red; cursor: pointer;" value="Xóa đơn hàng" type="submit" class="btn btn-danger" data-toggle="modal" onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng?')"/> 
                                                        </div>

                                                    </div>
                                                </div>
                                                <table class="table table-striped table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th><span>Mã</span><a href="${pageContext.request.contextPath}/admin?action=sort&direction=down&by=id"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/admin?action=sort&direction=up&by=id"><i class="material-icons">arrow_upward</i></a></th>
                                                            <th>Khách hàng</th>
                                                            <th>Note</th>
                                                            <th><span>Tiền giảm</span><a href="${pageContext.request.contextPath}/admin?action=sort&direction=down&by=discounted"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/admin?action=sort&direction=up&by=discounted"><i class="material-icons">arrow_upward</i></a></th>
                                                            <th><span>Thành tiền</span><a href="${pageContext.request.contextPath}/admin?action=sort&direction=down&by=total"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/admin?action=sort&direction=up&by=total"><i class="material-icons">arrow_upward</i></a></th>
                                                            <th>Ngày<a href="${pageContext.request.contextPath}/admin?action=sort&direction=down&by=date"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/admin?action=sort&direction=up&by=date"><i class="material-icons">arrow_upward</i></a></th>
                                                            <th>Trạng thái</th>
                                                            
                                                            <th>Voucher</th>
                                                            <th>Action</th>
                                                            <th>
                                                                <span class="custom-checkbox">
                                                                    <input type="checkbox" id="selectAll">
                                                                    <label for="selectAll"></label>
                                                                </span>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set var="orderList" value="${requestScope.list}" />
                                                        <c:set var="count" value="${0}" />

                                                        <c:forEach var="order" items="${orderList}">
                                                            <tr>
                                                                <td>${order.orderId}</td>
                                                                <td>${order.userId}</td>
                                                                <td>${order.note}</td>
                                                                <td>${order.discountedMoney}</td>
                                                                <td>${order.total}</td>
                                                                <td>${order.orderDate}</td>
                                                                <td>${order.status}</td>
                                                                <td>${order.voucherId}</td>
                                                                <td>
                                                                    <a href="${pageContext.request.contextPath}/orderDetail?action=search&orderId=${order.orderId}&userId=${order.userId}" target="_blank" class="see"><i class="material-icons" data-toggle="tooltip" title="Image">visibility</i></a>
                                                                    </form>

                                                                    <form action="admin" method="post">
                                                                        <input type="hidden" name="action" value="edit"/>
                                                                        <a href="#editProduct${count}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                                        <!-- Edit Modal HTML -->
                                                                        <div id="editProduct${count}" class="modal fade">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">						
                                                                                        <h4 class="modal-title">Chỉnh sửa hóa đơn</h4>
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                    </div>
                                                                                    <div class="modal-body">					
                                                                                        <div class="form-group">
                                                                                            <label>Mã hóa đơn</label>
                                                                                            <input name="id" type="hidden" class="form-control" value="${order.orderId}" required>
                                                                                            <input disabled type="text" class="form-control" value="${order.orderId}" required>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label for="status">Trạng thái</label>
                                                                                            <select name="status" class="form-control" id="status">
                                                                                                <option value="${order.status}">${order.status}</option>
                                                                                                <option value="Đã thanh toán">Đã thanh toán</option>
                                                                                                <option value="Đơn bị hủy">Đơn hủy</option>
                                                                                                <option value="Đang xử lý">Đang xử lý</option>
                                                                                            </select>
                                                                                        </div>				
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                                                        <input type="submit" class="btn btn-info" value="Submit">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <span class="custom-checkbox">
                                                                        <input class="CheckBox" type="checkbox" id="checkbox2" name="options" value="${order.orderId}">
                                                                        <label for="checkbox"></label>
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <c:set var="count" value="${count + 1}" />
                                                        </c:forEach>
                                                    </tbody>

                                                </table>
                                                <div class="clearfix">
                                                     <div class="hint-text">Trang <b>${currentPage}</b> trên <b>${noOfPages}</b></div>

                                                    <c:choose>

                                                        <c:when test = "${param.action == 'sort'}">
                                                            <ul class="pagination">

                                                                <c:if test="${currentPage != 1}">
                                                                    <li class="page-item"><a href="admin?action=sort&direction=${param.direction}&by=${param.by}&page=${currentPage - 1}">Previous</a></li>
                                                                    </c:if>
                                                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                                                        <c:choose>
                                                                            <c:when test="${currentPage eq i}">
                                                                            <li class="page-item"><a class="page-link">${i}</a></li>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                            <li class="page-item"><a href="admin?action=sort&direction=${param.direction}&by=${param.by}&page=${i}" class="page-link">${i}</a></li>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                    <c:if test="${currentPage lt noOfPages}">
                                                                    <li class="page-item"><a href="admin?action=sort&direction=${param.direction}&by=${param.by}&page=${currentPage + 1}">Next</a></li>
                                                                    </c:if>                
                                                            </ul>
                                                        </c:when>

                                                        <c:when test = "${param.action == 'listBy'}">
                                                            <ul class="pagination">

                                                                <c:if test="${currentPage != 1}">
                                                                    <li class="page-item"><a href="admin?action=listBy&category=${param.category}&page=${currentPage - 1}">Previous</a></li>
                                                                    </c:if>
                                                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                                                        <c:choose>
                                                                            <c:when test="${currentPage eq i}">
                                                                            <li class="page-item"><a class="page-link">${i}</a></li>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                            <li class="page-item"><a href="admin?action=listBy&category=${param.category}&page=${i}" class="page-link">${i}</a></li>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>

                                                                <c:if test="${currentPage lt noOfPages}">
                                                                    <li class="page-item"><a href="admin?action=listBy&category=${param.category}&page=${currentPage + 1}">Next</a></li>
                                                                    </c:if>                
                                                            </ul>
                                                        </c:when>

                                                        <c:when test = "${param.action == 'search'}">
                                                            <ul class="pagination">

                                                                <c:if test="${currentPage != 1}">
                                                                    <li class="page-item"><a href="admin?action=search&by=${param.by}&keyword=${param.keyword}&page=${currentPage - 1}">Previous</a></li>
                                                                    </c:if>
                                                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                                                        <c:choose>
                                                                            <c:when test="${currentPage eq i}">
                                                                            <li class="page-item"><a class="page-link">${i}</a></li>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                            <li class="page-item"><a href="admin?action=search&by=${param.by}&keyword=${param.keyword}&page=${i}" class="page-link">${i}</a></li>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>

                                                                <c:if test="${currentPage lt noOfPages}">
                                                                    <li class="page-item"><a href="admin?action=search&by=${param.by}&keyword=${param.keyword}&page=${currentPage + 1}">Next</a></li>
                                                                    </c:if>                
                                                            </ul>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <tag:paging noOfPages="${noOfPages}" currentPage="${currentPage}" path="${pageContext.request.contextPath}/order"/>   
                                                        </c:otherwise>
                                                    </c:choose>


                                                </div>
                                                <div style="color: green;">
                                                    ${message}
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
    </div>

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
                                                                    $("#selectAll").click(function () {
                                                                        $(".CheckBox").not(this).prop('checked', this.checked);
                                                                    });
                                                                });


</script>

</html>

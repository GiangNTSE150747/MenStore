<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/views/admin/img/apple-icon.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/views/admin/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Quản lý voucher</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- CSS Files -->
        <link href="${pageContext.request.contextPath}/views/admin/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/views/admin/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />

        <link href="${pageContext.request.contextPath}/views/admin/css/qldata.css" rel="stylesheet"/>

        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>

    <body>

        <div class="wrapper">

            <jsp:include page="Menu.jsp"/>

            <div class="main-panel">

                <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                    <div class="container-fluid">
                        <form action="voucher" method="post"> 
                            <input type="hidden" name="action" value="search"/>
                            <input name="voucherId" class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Enter ID..." aria-label="Search">
                            
                        </form>
                    </div>
                </nav>

                <div class="content">
                    <div class="container-fluid">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <form action="voucher" method="post">
                                    <input type="hidden" name="action" value="delete"/>
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h2>BẢNG VOUCHER</h2>
                                            </div>

                                            <div class="col-sm-6">
                                                <input style="background-color: red; cursor: pointer;" value="Xóa voucher" type="submit" class="btn btn-danger" data-toggle="modal" onclick="return confirm('Xóa voucher có thể dẫn đến mất dữ liệu hệ thống, bạn có chắc muốn xóa?')"/> 
                                                <a style="background-color: #00BCD4;" href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">Thêm voucher</a>
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <span class="custom-checkbox">
                                                        <input class="Checkbox" type="checkbox" id="selectAll">
                                                        <label for="selectAll"></label>
                                                    </span>
                                                </th>
                                                <th><span>Mã</span><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=down&by=voucherID"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=up&by=voucherID"><i class="material-icons">arrow_upward</i></a></th>
                                                <th><span>Giảm giá</span><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=down&by=discount"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=up&by=discount"><i class="material-icons">arrow_upward</i></a></th>

                                                <th><span>Ngày hết hạn</span><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=down&by=date"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=up&by=date"><i class="material-icons">arrow_upward</i></a></th>
                                                <th><span>Giảm giá tối đa</span><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=down&by=maximum_discount"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=up&by=maximum_discount"><i class="material-icons">arrow_upward</i></a></th>
                                                <th><span>Áp dụng đơn tối thiểu</span><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=down&by=required"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/voucher?action=sort&direction=up&by=required"><i class="material-icons">arrow_upward</i></a></th>
                                                <th>Mô tả</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="voucherList" value="${requestScope.list}" />
                                            <c:set var="count" value="${0}" />

                                            <c:forEach var="voucher" items="${voucherList}">
                                                <tr>
                                                    <td>
                                                        <span class="custom-checkbox">
                                                            <input class="Checkbox" type="checkbox" id="checkbox2" name="options" value="${voucher.voucherID}">
                                                            <label for="checkbox2"></label>
                                                        </span>
                                                    </td>
                                                    <td>${voucher.voucherID}</td>
                                                    <td>${voucher.discountedPercent}</td>
                                                    <td>${voucher.dueDate}</td>
                                                    <td>${voucher.maximumDiscount}</td>
                                                    <td>${voucher.required}</td>
                                                    <td>${voucher.description}</td>
                                                    <td>
                                                        </form>
                                                        <form action="voucher" method="post">
                                                            <input type="hidden" name="action" value="edit"/>
                                                            <a href="#editVoucher${count}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                            <!-- Edit Modal HTML -->
                                                            <div id="editVoucher${count}" class="modal fade">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">						
                                                                            <h4 class="modal-title">Chỉnh sửa voucher</h4>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                        </div>
                                                                        <div class="modal-body">					
                                                                            <div class="form-group">
                                                                                <label>Mã voucher</label>
                                                                                <input name="edit_id" type="hidden" class="form-control" value="${voucher.voucherID}" required>
                                                                                <input disabled type="text" class="form-control" value="${voucher.voucherID}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Giảm giá</label>
                                                                                <input name="edit_discount" type="text" class="form-control" value="${voucher.discountedPercent}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Ngày hết hạn</label>
                                                                                <input name="edit_dueDate" type="text" class="form-control" value="${voucher.dueDate}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Giảm tối đa</label>
                                                                                <input name="edit_maxDiscount" type="text" class="form-control" value="${voucher.maximumDiscount}" required>  
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Áp dụng đơn tối thiểu</label>
                                                                                <input name="edit_minimumApplied" type="text" class="form-control" value="${voucher.required}" required>
                                                                            </div>	
                                                                            <div class="form-group">
                                                                                <label>Mô tả</label>
                                                                                <input name="edit_description" type="text" class="form-control" value="${voucher.description}">
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
                                                        <li class="page-item"><a href="voucher?action=sort&direction=${param.direction}&by=${param.by}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="voucher?action=sort&direction=${param.direction}&by=${param.by}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="voucher?action=sort&direction=${param.direction}&by=${param.by}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:when test = "${param.action == 'listBy'}">
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="voucher?action=listBy&category=${param.category}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="voucher?action=listBy&category=${param.category}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="voucher?action=listBy&category=${param.category}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:when test = "${param.action == 'search'}">
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="voucher?action=search&by=${param.by}&keyword=${param.keyword}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="voucher?action=search&by=${param.by}&keyword=${param.keyword}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="voucher?action=search&by=${param.by}&keyword=${param.keyword}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:otherwise>
                                                <tag:paging noOfPages="${noOfPages}" currentPage="${currentPage}" path="${pageContext.request.contextPath}/voucher"/>                                          
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                            </div>
                        </div>        
                    </div>

                    <!-- Add Modal HTML -->
                    <div id="addEmployeeModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="voucher" method="post">
                                    <input type="hidden" name="action" value="add"/>
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Thêm voucher</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>Mã voucher</label>
                                            <input name="voucherId" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Giảm giá (%)</label>
                                            <input name="discount" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Ngày hết hạn (yyyy-MM-dd)</label>
                                            <input name="dueDate" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Giảm tối đa</label>
                                            <input name="maxDiscount" type="text" class="form-control" required>  
                                        </div>
                                        <div class="form-group">
                                            <label>Áp dụng đơn tối thiểu</label>
                                            <input name="minimumApplied" type="text" class="form-control" required>
                                        </div>	
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <input name="description" type="text" class="form-control">
                                        </div>	


                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                                        <input type="submit" class="btn btn-success" value="Thêm">
                                    </div>
                                </form>
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
                <!--  Google Maps Plugin    -->
                <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
                <!--  Chartist Plugin  -->
                <script src="${pageContext.request.contextPath}/views/admin/js/plugins/chartist.min.js"></script>
                <!--  Notifications Plugin    -->
                <script src="${pageContext.request.contextPath}/views/admin/js/plugins/bootstrap-notify.js"></script>
                <!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
                <script src="${pageContext.request.contextPath}/views/admin/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
                <script>
                                                    $("#selectAll").click(function () {
                                                        $(".Checkbox").not(this).prop('checked', this.checked);
                                                    });


                </script>

                </html>

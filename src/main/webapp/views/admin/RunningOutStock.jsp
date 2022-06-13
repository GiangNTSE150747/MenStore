<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/views/admin/img/apple-icon.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/views/admin/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Product manage</title>
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
                        <div class="dropdown col-sm-6">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                PRODUCT
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock">All</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=AC">Accessories</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=BZ">Blazer</a> 
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=CT">Coat</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=HT">Hat</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=JK">Jacket</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=JN">Jeans</a> 
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=PT">Pants</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=SRT">Shorts</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=SS">Shoes</a> 
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=ST">Shirt</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=SU">Suit</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/running-out-stock?action=listBy&category=TST">T-Shirt</a>
                            </div>
                        </div>

                        <form action="product?action=search" method="post"> 
                            <select name="by" class="form-control form-control-sm mr-3 w-75">
                                <option value="" disabled selected>Choose</option>
                                <option value="ProductID">Product ID</option>
                                <option value="ProductName">Product Name</option>
                                <option value="CategoryID">Category</option>
                                <option value="Status">Status</option>
                            </select>
                            <input name="keyword" class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Search..." aria-label="Search">
                        </form>
                    </div>
                </nav>

                <div class="content">
                    <div class="container-fluid">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <form action="running-out-stock?action=delete" method="post">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h2>PRODUCT <b>TABLE</b></h2>
                                            </div>

                                            <div class="col-sm-6">
                                                <input value="Delete" type="submit" class="btn btn-danger" data-toggle="modal" onclick="return confirm('Are you sure you want to delete these Records?')"/> 
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
                                                <th><span>Mã</span><a href="${pageContext.request.contextPath}/running-out-stock?action=sort&direction=down&by=id"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/running-out-stock?action=sort&direction=up&by=id"><i class="material-icons">arrow_upward</i></a></th>
                                                <th><span>Tên</span><a href="${pageContext.request.contextPath}/running-out-stock?action=sort&direction=down&by=name"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/running-out-stock?action=sort&direction=up&by=name"><i class="material-icons">arrow_upward</i></a></th>
                                                <th>Size</th>
                                                <th><span>Giá</span><a href="${pageContext.request.contextPath}/running-out-stock?action=sort&direction=down&by=price"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/running-out-stock?action=sort&direction=up&by=price"><i class="material-icons">arrow_upward</i></a></th>
                                                <th>Giảm giá(%)</th>
                                                <th><span>Số lượng</span><a href="${pageContext.request.contextPath}/running-out-stock?action=sort&direction=down&by=quantity"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/running-out-stock?action=sort&direction=up&by=quantity"><i class="material-icons">arrow_upward</i></a></th>
                                                <th>Loại hàng</th>
                                                <th>Trạng thái</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="productList" value="${requestScope.list}" />
                                            <c:set var="count" value="${0}" />

                                            <c:forEach var="product" items="${productList}">
                                                <tr>
                                                    <td>
                                                        <span class="custom-checkbox">
                                                            <input class="Checkbox" type="checkbox" id="checkbox2" name="options" value="${product.productId}">
                                                            <label for="checkbox2"></label>
                                                        </span>
                                                    </td>
                                                    <td>${product.productId}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${product.size}</td>
                                                    <td>${product.price}</td>
                                                    <td>${product.discount}</td>
                                                    <td>${product.quantity}</td>
                                                    <td>${product.categoryId}</td>
                                                    <td>${product.status}</td>
                                                    <td>
                                                        <a href="${product.linkImage}" target="_blank" class="see"><i class="material-icons" data-toggle="tooltip" title="Image">visibility</i></a>
                                                        </form>
                                                        <form action="running-out-stock?action=edit" method="post">
                                                            <a href="#editProduct${count}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                            <!-- Edit Modal HTML -->
                                                            <div id="editProduct${count}" class="modal fade">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">						
                                                                            <h4 class="modal-title">PRODUCT TABLE</h4>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                        </div>
                                                                        <div class="modal-body">					
                                                                            <div class="form-group">
                                                                                <label>Product ID</label>
                                                                                <input name="id" type="hidden" class="form-control" value="${product.productId}" required>
                                                                                <input disabled type="text" class="form-control" value="${product.productId}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Product name</label>
                                                                                <input name="name" type="text" class="form-control" value="${product.productName}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Size</label>
                                                                                <input name="size" type="text" class="form-control" value="${product.size}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Price</label>
                                                                                <input name="price" type="text" class="form-control" value="${product.price}" required>  
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Discount</label>
                                                                                <input name="discount" type="text" class="form-control" value="${product.discount}" required>
                                                                            </div>	
                                                                            <div class="form-group">
                                                                                <label>Quantity</label>
                                                                                <input name="quantity" type="text" class="form-control" value="${product.quantity}" required>
                                                                            </div>	
                                                                            <div class="form-group">
                                                                                <label>Category</label>
                                                                                <input name="categoryId" type="text" class="form-control" value="${product.categoryId}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Status</label>
                                                                                <input name="status" type="text" class="form-control" value="${product.status}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Link image</label>
                                                                                <input name="linkImage" type="text" class="form-control" value="${product.linkImage}" required>
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
                                        <div class="hint-text">Showing <b>${currentPage}</b> out of <b>${noOfPages}</b> entries</div>

                                        <c:choose>

                                            <c:when test = "${param.action == 'sort'}">
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="running-out-stock?action=sort&direction=${param.direction}&by=${param.by}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="running-out-stock?action=sort&direction=${param.direction}&by=${param.by}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="running-out-stock?action=sort&direction=${param.direction}&by=${param.by}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:when test = "${param.action == 'listBy'}">
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="running-out-stock?action=listBy&category=${param.category}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="running-out-stock?action=listBy&category=${param.category}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="running-out-stock?action=listBy&category=${param.category}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:when test = "${param.action == 'search'}">
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="running-out-stock?action=search&by=${param.by}&keyword=${param.keyword}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="running-out-stock?action=search&by=${param.by}&keyword=${param.keyword}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="running-out-stock?action=search&by=${param.by}&keyword=${param.keyword}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:otherwise>
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="running-out-stock?page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="running-out-stock?page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="running-out-stock?page=${currentPage + 1}">Next</a></li>
                                                        <li class="page-item"><a href="#">${param.action}</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:otherwise>
                                        </c:choose>


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

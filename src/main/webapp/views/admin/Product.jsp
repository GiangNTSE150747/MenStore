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
                                Lo???i s???n ph???m
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/product">T???t c???</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/product?action=listBy&category=AT">??o thun</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/product?action=listBy&category=SM">S?? mi</a> 
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/product?action=listBy&category=QT">Qu???n t??y</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/product?action=listBy&category=QJ">Qu???n jean</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/product?action=listBy&category=GI">Gi??y</a>
                            </div>
                        </div>

                        <form action="product?action=search" method="post"> 
                            <div class="input-group mt-3 mb-3">
                                <div class="input-group-prepend">
                                    <select name="by" style="height: 30px; border-radius: 3px;"> 
                                        <option value="ProductID">M?? s???n ph???m</option>
                                        <option value="ProductName">T??n s???n ph???m</option>
                                        <option value="Status">Tr???ng th??i</option>
                                    </select>
                                    <input name="keyword" type="text" placeholder="Search..." aria-label="Search">
                                </div>
                            </div>
                        </form>
                    </div>
                </nav>

                <div class="content">
                    <div class="container-fluid">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <form action="product?action=delete" method="post">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h2>B???NG S???N PH???M</h2>
                                            </div>

                                            <div class="col-sm-6">
                                                <input style="background-color: red; cursor: pointer;" value="X??a s???m ph???m" type="submit" class="btn btn-danger" data-toggle="modal" onclick="return confirm('X??a s???n ph???m c?? th??? d???n ?????n m???t d??? li???u h??? th???ng, b???n c?? ch???c mu???n x??a??')"/> 
                                                <a href="#addEmployeeModal" class="btn btn-success" style="background-color: #00BCD4" data-toggle="modal">Th??m s???n ph???m</a>
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
                                                <th><span>M??</span><a href="${pageContext.request.contextPath}/product?action=sort&direction=down&by=id"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/product?action=sort&direction=up&by=id"><i class="material-icons">arrow_upward</i></a></th>
                                                <th><span>T??n</span><a href="${pageContext.request.contextPath}/product?action=sort&direction=down&by=name"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/product?action=sort&direction=up&by=name"><i class="material-icons">arrow_upward</i></a></th>
                                                <th>Size</th>
                                                <th><span>Gi??</span><a href="${pageContext.request.contextPath}/product?action=sort&direction=down&by=price"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/product?action=sort&direction=up&by=price"><i class="material-icons">arrow_upward</i></a></th>
                                                <th>Gi???m gi??(%)</th>
                                                <th><span>S??? l?????ng</span><a href="${pageContext.request.contextPath}/product?action=sort&direction=down&by=quantity"><i class="material-icons">arrow_downward</i></a><a href="${pageContext.request.contextPath}/product?action=sort&direction=up&by=quantity"><i class="material-icons">arrow_upward</i></a></th>
                                                <th>Lo???i h??ng</th>
                                                <th>Tr???ng th??i</th>
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
                                                        <a href="#seeImage${count}" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Image">visibility</i></a>

                                                        <div id="seeImage${count}" class="modal fade">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">						
                                                                        <h4 class="modal-title">H??nh ???nh s???n ph???m</h4>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                    </div>
                                                                    <div style="text-align: center" class="modal-body">					
                                                                        <img src="${product.linkImage}" width="300" height="400" alt="alt"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        </form>
                                                        <form action="product?action=edit" method="post">
                                                            <a href="#editProduct${count}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                            <!-- Edit Modal HTML -->
                                                            <div id="editProduct${count}" class="modal fade">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">						
                                                                            <h4 class="modal-title">B???N S???N PH???M</h4>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                        </div>
                                                                        <div class="modal-body">					
                                                                            <div class="form-group">
                                                                                <label>M?? s???n ph???m</label>
                                                                                <input name="id" type="hidden" class="form-control" value="${product.productId}" required>
                                                                                <input disabled type="text" class="form-control" value="${product.productId}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>T??n</label>
                                                                                <input name="name" type="text" class="form-control" value="${product.productName}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Size</label>
                                                                                <input name="size" type="text" class="form-control" value="${product.size}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Gi??</label>
                                                                                <input name="price" type="text" class="form-control" value="${product.price}" required>  
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Gi???m gi??(%)</label>
                                                                                <input name="discount" type="text" class="form-control" value="${product.discount}" required>
                                                                            </div>	
                                                                            <div class="form-group">
                                                                                <label>S??? l?????ng</label>
                                                                                <input name="quantity" type="text" class="form-control" value="${product.quantity}" required>
                                                                            </div>	
                                                                            <div class="form-group">
                                                                                <label>Lo???i</label>
                                                                                <select name="categoryId" class="form-control" id="status">
                                                                                    <option value="${product.categoryId}">${product.categoryId}</option>
                                                                                    <option value="AT">??o thun</option>
                                                                                    <option value="SM">??o s?? mi</option>
                                                                                    <option value="QT">Qu???n t??y</option>
                                                                                    <option value="QJ">Qu???n Jean</option>
                                                                                    <option value="GI">Gi??y</option>
                                                                                </select>
<!--                                                                                <input name="categoryId" type="text" class="form-control" value="${product.categoryId}" required>-->
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Tr???ng th??i</label>
                                                                                <select name="status" class="form-control" id="status">
                                                                                    <option value="${product.status}">${product.status}</option>
                                                                                    <option value="On">On</option>
                                                                                    <option value="Off">Off</option>
                                                                                </select>
<!--                                                                                <input name="status" type="text" class="form-control" value="${product.status}" required>-->
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>H??nh ???nh</label>
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
                                         <div class="hint-text">Trang <b>${currentPage}</b> tr??n <b>${noOfPages}</b></div>

                                        <c:choose>

                                            <c:when test = "${param.action == 'sort'}">
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="product?action=sort&direction=${param.direction}&by=${param.by}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="product?action=sort&direction=${param.direction}&by=${param.by}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="product?action=sort&direction=${param.direction}&by=${param.by}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:when test = "${param.action == 'listBy'}">
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="product?action=listBy&category=${param.category}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="product?action=listBy&category=${param.category}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="product?action=listBy&category=${param.category}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:when test = "${param.action == 'search'}">
                                                <ul class="pagination">

                                                    <c:if test="${currentPage != 1}">
                                                        <li class="page-item"><a href="product?action=search&by=${param.by}&keyword=${param.keyword}&page=${currentPage - 1}">Previous</a></li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${noOfPages}" var="i">
                                                            <c:choose>
                                                                <c:when test="${currentPage eq i}">
                                                                <li class="page-item"><a class="page-link">${i}</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <li class="page-item"><a href="product?action=search&by=${param.by}&keyword=${param.keyword}&page=${i}" class="page-link">${i}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>

                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="page-item"><a href="product?action=search&by=${param.by}&keyword=${param.keyword}&page=${currentPage + 1}">Next</a></li>
                                                        </c:if>                
                                                </ul>
                                            </c:when>

                                            <c:otherwise>
                                                <tag:paging noOfPages="${noOfPages}" currentPage="${currentPage}" path="${pageContext.request.contextPath}/product"/>   
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
                                <form action="product?action=add" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">ADD PRODUCT</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>M?? s???n ph???m</label>
                                            <input name="id" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>T??n s???n ph???m</label>
                                            <input name="name" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Size</label>
                                            <input name="size" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Gi??</label>
                                            <input name="price" type="text" class="form-control" required>  
                                        </div>
                                        <div class="form-group">
                                            <label>Gi???m gi??(%)</label>
                                            <input name="discount" type="text" class="form-control" required>
                                        </div>	
                                        <div class="form-group">
                                            <label>S??? l?????ng</label>
                                            <input name="quantity" type="text" class="form-control" required>
                                        </div>	
                                        <div class="form-group">
                                            <label>Lo???i s???n ph???m</label>
                                            <select name="categoryId" class="form-control" id="status">
                                                <option value="AT" selected="">??o thun</option>
                                                <option value="SM">??o s?? mi</option>
                                                <option value="QT">Qu???n t??y</option>
                                                <option value="QJ">Qu???n Jean</option>
                                                <option value="GI">Gi??y</option>
                                            </select>
                                            <!--                                            <input name="categoryId" type="text" class="form-control" required>-->
                                        </div>
                                        <div class="form-group">
                                            <label>Tr???ng th??i</label>
                                            <select name="status" class="form-control" id="status">
                                                <option value="On" selected="">On</option>
                                                <option value="Off">Off</option>
                                            </select>
<!--                                            <input name="status" type="text" class="form-control" >-->
                                        </div>
                                        <div class="form-group">
                                            <label>Link h??nh ???nh</label>
                                            <input name="linkImage" type="text" class="form-control" >
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="H???y">
                                        <input type="submit" class="btn btn-success" value="Th??m">
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

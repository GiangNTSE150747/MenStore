<%-- 
    Document   : paging
    Created on : Mar 20, 2022, 11:58:22 PM
    Author     : MyPC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="This tag use for paging with no action paramater" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="currentPage" required="true"%>
<%@attribute name="noOfPages" required="true"%>
<%@attribute name="path" required="true"%>

<ul class="pagination">

    <c:if test="${currentPage != 1}">
        <li class="page-item"><a href="${path}?page=${currentPage - 1}">Previous</a></li>
    </c:if>
    <c:forEach begin="1" end="${noOfPages}" var="i">
        <c:choose>
            <c:when test="${currentPage eq i}">
                <li class="page-item"><a class="page-link">${i}</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a href="${path}?page=${i}" class="page-link">${i}</a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${currentPage lt noOfPages}">
        <li class="page-item"><a href="${path}?page=${currentPage + 1}">Next</a></li>

    </c:if>    
</ul>
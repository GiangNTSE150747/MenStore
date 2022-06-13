<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="name" required="true"%>
<%@attribute name="image" required="true"%>
<%@attribute name="price" required="true"%>
<%@attribute name="discount" required="true"%>
<%@attribute name="count" required="true"%>

<c:if test="${(count%3)==1}">
    <div class="grids_of_3">
    </c:if>
    <div style="text-align: center !important;" class="grid1_of_3">
        <c:url var="productDetail" value="${request.contextPath}/detail" scope="request">
            <c:param name="productName" value="${name}"></c:param>
        </c:url>
        <a href="${productDetail}">
            <img src="${image}" width="260" height="300" alt="">
            <h3 >${name}</h3>
            <c:set var="actuaPrice" value="${(price - price*discount/100)/1000}k"/>
            <span class="price">${actuaPrice}</span>
            <c:if test="${discount != '0.0'}">
                <span class="price1 bg">on sale</span>
            </c:if>
        </a>
    </div>
    <c:if test="${(count%3)==0}">
        <div class="clear"></div> 
    </c:if>            
    <c:if test="${(count%3)==1}">
    </div>
</c:if>
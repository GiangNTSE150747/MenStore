<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@tag description="This tag use to show product in web view" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="name" required="true"%>
<%@attribute name="image" required="true"%>
<%@attribute name="price" required="true"%>
<%@attribute name="discount" required="true"%>

<div class="grid1_of_3">
    <a href="detail?productName=${name}">
        <img src="${image}" width="260" height="300"/>

        <h3 style="text-align: center;">${name}</h3>

        <c:set var="actuaPrice" value="${(price - price*discount/100)/1000}k"/>

        <span class="price">${actuaPrice}</span>
        
        <c:if test="${discount != '0.0'}">
            <span class="price1 bg">on sale</span>
        </c:if>
    </a>
</div>
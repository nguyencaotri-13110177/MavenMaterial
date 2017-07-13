<%@page  pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="index" class="brand-logo"><image src="resources/img/logo.png"></a>

                <!-- menu ở chế độ desktop  -->
                <ul class="right hide-on-med-and-down">
                    <li><a href="quanly">Live Chat</a></li>
                    <li><a href="guiemail">Gửi Email</a></li>
                    <li><a href="dangnhap">Thống Kê</a></li>
                    <li>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <a onclick="document.forms['logoutForm'].submit()">Đăng xuất</a>
                        </c:if>
                    </li>                    
                </ul>


                <!-- menu ở chế độ mobile  -->
                <ul id="nav-mobile" class="side-nav">
                    <li><a href="quanly">Live Chat</a></li>
                    <li><a href="guiemail">Gửi Email</a></li>
                    <li><a href="huongdan">Thống Kê</a></li>
                    <li><a href="contact">Đăng xuất</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
    </body>
</html>

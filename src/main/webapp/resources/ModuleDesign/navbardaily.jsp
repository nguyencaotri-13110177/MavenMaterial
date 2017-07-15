<%@page  pageEncoding="UTF-8"%>
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
                    <li><a href="quanly"><spring:message code="navbar.navbardaily.LiveChat"/></a></li>
                    <li><a href="guiemail"><spring:message code="navbar.navbardaily.SendEmail"/></a></li>
                    <li><a href="thongke"><spring:message code="navbar.navbardaily.Statistic"/></a></li>
                    <li><a href="create_new_user"><spring:message code="navbar.navbardaily.CreateNewUser"/></a></li>
                    <li>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <a onclick="document.forms['logoutForm'].submit()">
                                <spring:message code="navbar.navbardaily.Logout"/></a>
                        </c:if>
                    </li>
                </ul>

                <!-- menu ở chế độ mobile  -->
                <ul id="nav-mobile" class="side-nav">
                    <li><a href="quanly"><spring:message code="navbar.navbardaily.LiveChat"/></a></li>
                    <li><a href="guiemail"><spring:message code="navbar.navbardaily.SendEmail"/></a></li>
                    <li><a href="thongke"><spring:message code="navbar.navbardaily.Statistic"/></a></li>
                    <li><a href="create_new_user"><spring:message code="navbar.navbardaily.CreateNewUser"/></a></li>
                    <li>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                            <a onclick="document.forms['logoutForm'].submit()">
                                <spring:message code="navbar.navbardaily.Logout"/></a></a>
                        </c:if>
                    </li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
    </body>
</html>

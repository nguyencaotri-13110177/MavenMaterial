<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="resources/img/favicon.ico" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>T&T_DangNhap</title>
    
    <link href="resources/css/icon.css" rel="stylesheet">
    <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <link rel="stylesheet" href="resources/css/jquery-ui.css">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="resources/js/air-port-codes-api-min.js"></script>
    
    <!--Script Zendesk Chat Support Live Chat-->
    <script src="resources/js/livechat.js"></script>
    <!--End of Zendesk Chat Script-->
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<%@ include file="/resources/ModuleDesign/navbar.jsp"%>
<div class="container">
    <div class="section">
        <div class="row">
            <div class="col s12 m8 offset-m2 l6 offset-l3">
                <div class="card-panel grey lighten-5 z-depth-1">
                    <div class="row">
                        <center><img src="resources/img/locked.png" alt="" ></center><br>
                        <form method="POST" action="${contextPath}/login" class="form-signin">
                            <div class="form-group ${error != null ? 'has-error' : ''}">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <span>${message}</span>
                                        <input id="username" name="username" type="text" class="validate" autofocus="true"/>
                                        <label for="username"><spring:message code="dangnhap.TenDangNhap"/></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="password" name="password" type="password" class="validate"/>
                                        <label for="password"><spring:message code="dangnhap.MatKhau"/></label>
                                    </div>
                                </div>
                                <span>${error}</span>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <center>
                                    <button class="btn btn-lg btn-primary btn-block" type="submit">
                                        <spring:message code="dangnhap.button.DangNhap"/>
                                    </button>
                                </center>
                                <center>
                                    <h6><a href="${contextPath}/create_new_user"><spring:message code="dangnhap.LayLaiMatKhau"/></a></h6>
                                </center>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  Scripts-->
<script src="resources/js/materialize.js"></script>
<script src="resources/js/init_2.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <link rel="shortcut icon" href="resources/img/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>T&T_TaoTaiKhoanMoi</title>

    <!-- CSS  -->
    <link href="resources/css/icon.css" rel="stylesheet">
    <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    <link rel="stylesheet" href="resources/css/jquery-ui.css">
    <script src="resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="resources/js/air-port-codes-api-min.js"></script>
        
</head>

<body>
    <%@ include file="/resources/ModuleDesign/navbardaily.jsp"%>
    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col s12 m8 offset-m2 l6 offset-l3">
                    <div class="card-panel grey lighten-5 z-depth-1">
                        <div class="row">
                        <center><img src="resources/img/locked.png" alt="" ></center><br>
                            <form:form method="POST" modelAttribute="userForm" class="form-signin">
                                <spring:bind path="username">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <form:input type="text" path="username" class="form-control" placeholder="Username"
                                                    autofocus="true"></form:input>
                                        <form:errors path="username"></form:errors>
                                    </div>
                                </spring:bind>

                                <spring:bind path="password">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                                        <form:errors path="password"></form:errors>
                                    </div>
                                </spring:bind>

                                <spring:bind path="passwordConfirm">
                                    <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <form:input type="password" path="passwordConfirm" class="form-control"
                                                    placeholder="Confirm your password"></form:input>
                                        <form:errors path="passwordConfirm"></form:errors>
                                    </div>
                                </spring:bind>
                                <center>
                                    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                                </center>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                       
    </div>
    <!-- /container -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="resources/js/materialize.js"></script>
        <script src="resources/js/init_2.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>T&T_search_result</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
        <script src="resources/js/air-port-codes-api-min.js"></script>
        <script src="resources/js/sorttable.js"></script>
        
        <!--Script Zendesk Chat Support Live Chat-->
        <script src="resources/js/livechat.js"></script>
        <!--End of Zendesk Chat Script-->
        
        <style>
            table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
                content: " \25B4\25BE" 
            }
        </style>






    </head>
    <body>
        <%@ include file="/resources/ModuleDesign/navbar.jsp"%>

        <div class="container">
            <div class="section sortable">

                <table  class="striped sortable">
                    <tr>
                        <th></th>
                        <th>Hãng</th>
                        <th>Thời Gian Khởi Hành</th>
                        <th>Thời Gian Đến</th>
                        <th>Thời gian</th>
                        <th>Tổng Giá Tiền</th>
                        <th>&nbsp;</th>
                    </tr>
                    <c:forEach var="sr" items="${searchResults}">
                        <tr>
                            <td><img src="resources/img/${sr.getHang()}.png" width="50" height="20"></td>
                            <td>${sr.getHang()}</td>
                            <td>${sr.getThoiGianKhoiHanh()}</td>
                            <td>${sr.getThoiGianDen()}</td>
                            <td>${sr.getKhoangCach()} phút</td>
                            <td>${sr.getTongTienText()}</td>
                            <td><a href="a?id=${sr.id}">Choose</a></td>
                        </tr>  
                    </c:forEach>
                </table>

            </div>
        </div>





        <!--  Scripts-->
        <script src="resources/js/materialize.js"></script>
        <script src="resources/js/init_2.js"></script>

    </body>
</html>
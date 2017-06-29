<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>T&T_HuongDan</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
        <script src="resources/js/air-port-codes-api-min.js"></script>

        <!--Script Zendesk Chat Support Live Chat-->
        <script src="resources/js/livechat.js"></script>
        <!--End of Zendesk Chat Script-->






    </head>
    <body>
        <%@ include file="/resources/ModuleDesign/navbar.jsp"%>

        <div class="container">
            <div class="section">

                <div class="row">
                    <ul class="collapsible" data-collapsible="accordion">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">label_outline</i>Hướng dẫn nhập dữ liệu vào khung tìm vé</div>
                            <div class="collapsible-body"><img src="resources/img/KhungTimVe2.gif" width="100%"></div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">perm_phone_msg</i>Hướng dẫn Live Chat Support</div>
                            <div class="collapsible-body"><img src="resources/img/HuongDanChat.gif" width="100%"></div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">reorder</i>Hướng dẫn lọc vé theo Hãng - Thời Gian - Giá Tiền</div>
                            <div class="collapsible-body"><img src="resources/img/LocVeTheoDieuKien.gif" width="100%"></div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">language</i>Hướng dẫn chọn ngôn ngữ</div>
                            <div class="collapsible-body"><img src="resources/img/ChonNgonNgu.gif" width="100%"></div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>





        <!--  Scripts-->
        <script src="resources/js/materialize.js"></script>
        <script src="resources/js/init_2.js"></script>

    </body>
</html>
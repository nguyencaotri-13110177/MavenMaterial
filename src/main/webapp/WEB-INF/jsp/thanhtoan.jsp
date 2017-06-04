<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>T&T_ThanhToan</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
        <script src="resources/js/air-port-codes-api-min.js"></script>






    </head>
    <body>
        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo"><image src="resources/img//logo.png"></a>

                <!-- menu ở chế độ desktop  -->
                <ul class="right hide-on-med-and-down">
                    <li><a href="#"><spring:message code="lable.index.Home"/></a></li>
                    <li><a href="#"><spring:message code="lable.index.TicketingGuide"/></a></li>
                    <li><a href="#"><spring:message code="lable.index.Contact"/></a></li>
                    <li>
                        <ul id="dropdown1" class="dropdown-content">
                            <li><a href="?lang=en">Tiếng anh</a></li>
                            <li><a href="?lang=vi">Tiếng việt</a></li>
                        </ul>
                        <a class="btn dropdown-button" href="#!" data-activates="dropdown1"><i class="material-icons left">language</i><spring:message code="lable.index.ChooseLanguage"/></a>
                    </li>
                </ul>


                <!-- menu ở chế độ mobile  -->
                <ul id="nav-mobile" class="side-nav">
                    <li><a href="#"><spring:message code="lable.index.Home"/></a></li>
                    <li><a href="#"><spring:message code="lable.index.TicketingGuide"/></a></li>
                    <li><a href="#"><spring:message code="lable.index.Contact"/></a></li>
                    <li>
                        <ul id="dropdown2" class="dropdown-content">
                            <li><a href="?lang=en">Tiếng anh</a></li>
                            <li><a href="?lang=vi">Tiếng việt</a></li>
                        </ul>
                        <a class="btn dropdown-button" href="#!" data-activates="dropdown2"><i class="material-icons left">language</i><spring:message code="lable.index.ChooseLanguage"/></a>
                    </li>

                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>

        <div class="container">
            <div class="section">

                <div class="row">
                    <div class="col s12">
                        <h4>Chọn hình thức thanh toán</h4>
                    </div>
                    <div class="col s12">
                        <ul class="collapsible" data-collapsible="accordion">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">polymer</i>Cổng thanh toán NGÂN LƯỢNG</div>
                                <div class="collapsible-body">
                                    <img src="resources/img/nganluong.png"  height="90" width="50%">
                                    <p>Thanh toán được thực hiện qua cổng thanh toán trực tuyến NGANLUONG.VN<br>
                                        Lưu ý:<br>
                                        - Nếu chọn thanh toán Online, thì thẻ phải được kích hoạt tính năng thanh toán Online.<br>
                                    </p>
                                    
                                    <center><a target="_blank" href="https://www.nganluong.vn/button_payment.php?receiver=datvemaybay2017@gmail.com&product_name=123123&price=150000&return_url=index&comments=Thanh toan cho ma dat cho 131421"><img src="https://www.nganluong.vn/css/newhome/img/button/pay-sm.png"border="0" /></a></center>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">label_outline</i>Trực tiếp tại ngân hàng hoặc trụ ATM</div>
                                <div class="collapsible-body">
                                    <img src="resources/img/banklink.png"  height="250" width="100%">
                                    <p>Bạn có thể chuyển tiền mặt tại quầy giao dịch hoặc chuyển khoản qua trụ ATM<br>
                                        Lưu ý:<br>
                                        - Thẻ của bạn phải là loại thẻ chuyển khoảng cho ngân khác được.<br>
                                        - Phí chuyển khoản sẽ do người chuyển trả.
                                    </p>
                                    <div><center><a class="waves-effect waves-light btn" href="chuyenkhoan">Thanh Toán<i class="material-icons right">send</i></a></center></div>
                                </div>
                            </li>
                           
                            <li>
                                <div class="collapsible-header"><i class="material-icons">lock</i>Ví điện tử MOMO</div>
                                <div class="collapsible-body">
                                    <p>Bạn thanh toán trực tiếp qua ứng dụng MOMO hoặc tại chuỗi các cửa hàng có hỗ trợ thanh toán qua MOMO dưới đây.
                                    </p>
                                    <img src="resources/img/payoo.jpg"  height="100" width="80%" class="center">
                                    <br><br>
                                    <div><center><a class="waves-effect waves-light btn" href="momo">Thanh Toán<i class="material-icons right">send</i></a></center></div>
                                </div>
                            </li>
                            
                            <li>
                                <div class="collapsible-header"><i class="material-icons">store</i>Tại cửa hàng</div>
                                <div class="collapsible-body"><p>Danh sách các cửa hàng đại lý <a href="#">xem tại đây</a></p></div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>





        <!--  Scripts-->
        <script src="resources/js/materialize.js"></script>
        <script src="resources/js/init_2.js"></script>

    </body>
</html>
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
                                <div class="collapsible-header"><i class="material-icons">label_outline</i>Chuyển khoản</div>
                                <div class="collapsible-body">
                                    <p>Bạn có thể chuyển tiền mặt tại quầy giao dịch hoặc chuyển khoản qua InternetBanking và trụ ATM<br>
                                        Lưu ý:<br>
                                        - Chưa áp dụng chuyển khoản qua ATM hoặc InternetBanking từ ngân hàng khác hệ thống.<br>
                                        - Phí chuyển khoản sẽ do người chuyển trả.
                                    </p>
                                    <div class="collection">
                                        <a href="chuyenkhoan_vietcombank" class="collection-item">Vietcombank<img src="resources/img/vietcombank.jpg"  height="25" width="100" class="right"></a>
                                        <a href="chuyenkhoan_vietinbank" class="collection-item">Vietinbank <img src="resources/img/vietinbank.png"  height="25" width="100" class="right"></a>
                                        <a href="chuyenkhoan_bidv" class="collection-item">BIDV<img src="resources/img/bidv.png"  height="25" width="100" class="right"></a>
                                        <a href="chuyenkhoan_techcombank" class="collection-item">Techcombank<img src="resources/img/techcombank.png"  height="25" width="100" class="right"></a>
                                        <a href="chuyenkhoan_sacombank" class="collection-item">Sacombank<img src="resources/img/sacombank.png"  height="25" width="100" class="right"></a>
                                        <a href="chuyenkhoan_acb" class="collection-item">ACB<img src="resources/img/acb.jpg"  height="25" width="100" class="right"></a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">payment</i>Thẻ tín dụng</div>
                                <div class="collapsible-body">
                                    <img src="resources/img/mastercard.png"  height="50" width="100" class="center"><br>
                                    <div class="row">
                                        <form class="col s12">
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input placeholder="16 số in trên mặt thẻ" type="text" class="validate">
                                                    <label>Số thẻ tín dụng</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <input placeholder="MM/YY" type="text" class="validate">
                                                    <label>Hiệu lực đến</label>
                                                </div>
                                                <div class="input-field col s6">
                                                    <input placeholder="3 số CVV" type="text" class="validate">
                                                    <label>CVV</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input placeholder="Tên in trên mặt thẻ" type="text" class="validate">
                                                    <label>Tên in trên thẻ</label>
                                                </div>
                                            </div>
                                            
                                            <center>
                                            <button class="btn waves-effect waves-light" type="submit" name="action">Thanh Toán
                                                <i class="material-icons right">send</i>
                                            </button>
                                            </center>

                                        </form>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">lock</i>Ví điện tử</div>
                                <div class="collapsible-body">
                                    <p>Bạn thanh toán trực tiếp qua ví điện tử MOMO hoặc tại chuỗi các cửa hàng có hỗ trợ thanh toán qua MOMO dưới đây.
                                    </p>
                                    <img src="resources/img/payoo.jpg"  height="100" width="80%" class="center">
                                    <br><br>
                                    <div><center><a class="waves-effect waves-light btn">Thanh Toán<i class="material-icons right">send</i></a></center></div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">payment</i>Thẻ ATM</div>
                                <div class="collapsible-body">
                                    <img src="resources/img/onepay.jpg"  height="90" width="60%">
                                    <p>Thanh toán được thực hiện qua ONEPAY<br>
                                        Lưu ý:<br>
                                        - Thẻ phải do ngân hàng nội địa phát hành.<br>
                                        - Thẻ đã được kích hoạt tính năng thanh toán trực tuyến.<br>
                                    </p>
                                    <div><center><a class="waves-effect waves-light btn">Thanh Toán<i class="material-icons right">send</i></a></center></div>
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
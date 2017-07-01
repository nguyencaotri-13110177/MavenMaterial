<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>T&T_flight_info</title>

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


        <!--Event Xác nhận Email cung cấp là chính xác-->
        <script>
            function XacNhan() {
                $("#ThongTinHanhKhach").show();
                $("#NutXacNhan").hide();
            }
        </script>

        <!--Event Xem Chi Tiết Gia-->
        <script>
            function XemChiTietGia() {
                $("#ChiTietGia").show();
            }
            function AnChiTietGia() {
                $("#ChiTietGia").hide();
            }
        </script>

    </head>
    <body>

        <%@ include file="/resources/ModuleDesign/navbar.jsp"%>

        <div class="container">
            <div class="section">

                <div class="row">
                    <div class="col m7 ">
                        <div class="card-panel ">
                            <span>
                                <div>
                                    <form action="thanhtoan" >
                                        <center><img src="resources/img/payer.gif" style="margin: left" width="50" height="50"><h5><b>Thông tin khách hàng thanh toán</b></h5></center><br>
                                        <div class="row">

                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <input id="last_name" type="text" class="validate">
                                                    <label for="last_name">Họ tên</label>
                                                </div>
                                                <div class="input-field col s6">
                                                    <input id="last_name" type="text" class="validate">
                                                    <label for="last_name">CMND</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <input id="last_name" type="text" class="validate">
                                                    <label for="last_name">SDT</label>
                                                </div>
                                                <div class="input-field col s6">
                                                    <input id="email" type="email" class="validate">
                                                    <label for="email">Email</label>
                                                </div>
                                            </div>

                                            <center>
                                                <a class="waves-effect waves-light btn" href="#modal1" id="NutXacNhan">Tiếp tục <i class="material-icons right">send</i> </a>
                                            </center>
                                            <!-- Modal Structure -->
                                            <div id="modal1" class="modal">
                                                <div class="modal-content">                                                    
                                                    <img src="resources/img/logo.png">
                                                    <p>Vé điện tử sẽ được gởi vào Email trên và thông tin tóm tắt vé sẽ được gởi đến số điện thoại trên, Vui lòng xác nhận thông tin mà bạn cung cấp là chính xác.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat" onclick="XacNhan()">Đúng, thông tin trên là chính xác</a>
                                                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Thay đổi</a>
                                                </div>
                                            </div>



                                        </div>
                                        <div hidden id="ThongTinHanhKhach">
                                            <center><img src="resources/img/passanger.png" style="margin: left" width="50" height="50"><h5><b>Thông tin hành khách</b></h5></center><br>


                                            <c:forEach var="i" begin="1" end="${searchResult.getSLNguoiLon()}">
                                                <h5 style="color: #4caf50">Hành khách người lớn</h5>
                                                <div class="row">
                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <input id="last_name" type="text" class="validate">
                                                            <label for="last_name">Họ tên</label>
                                                        </div>
                                                        <div class="input-field col s6">
                                                            <input id="last_name" type="text" class="validate">
                                                            <label for="last_name">CMND</label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col s12">
                                                            Ngày sinh:
                                                            <div class="input-field inline">
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Ngày</label>
                                                                </div>
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Tháng</label>
                                                                </div>
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Năm</label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <br>
                                            <c:forEach var="i" begin="1" end="${searchResult.getSLTreEm()}">
                                                <h5 style="color: #ea80fc">Hành khách trẻ em</h5>
                                                <div class="row">
                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <input id="last_name" type="text" class="validate">
                                                            <label for="last_name">Họ tên</label>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="row">
                                                        <div class="col s12">
                                                            Ngày sinh:
                                                            <div class="input-field inline">
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Ngày</label>
                                                                </div>
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Tháng</label>
                                                                </div>
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Năm</label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <br>
                                            <c:forEach var="i" begin="1" end="${searchResult.getSLEmBe()}">
                                                <h5 style="color: #ff5722">Hành khách em bé</h5>
                                                <div class="row">
                                                    <div class="row">
                                                        <div class="input-field col s6">
                                                            <input id="last_name" type="text" class="validate">
                                                            <label for="last_name">Họ tên</label>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="row">
                                                        <div class="col s12">
                                                            Ngày sinh:
                                                            <div class="input-field inline">
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Ngày</label>
                                                                </div>
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Tháng</label>
                                                                </div>
                                                                <div class="input-field col s4">
                                                                    <input id="last_name" type="text" class="validate">
                                                                    <label for="last_name">Năm</label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <center>
                                                <button class="btn waves-effect waves-light" type="submit" name="action">Tiếp tục
                                                    <i class="material-icons right">send</i>
                                                </button>
                                            </center>
                                        </div>

                                    </form>
                                </div>
                            </span>
                        </div>
                    </div>


                    <div class="col m5 ">
                        <div class="card">
                            <div class="card-image">
                                <img src="resources/img/ex1.jpg">
                                <span class="card-title">Thông tin chuyến bay</span>
                            </div>
                            <div class="card-content">
                                <img src="resources/img/${searchResult.getHang()}.png">
                                <p><img src="resources/img/NoiDi24.png"> Noi Di: ${searchResult.getNoiDi()} | Thời gian khởi hành: ${searchResult.getThoiGianKhoiHanh()}</p><br>
                                <p><img src="resources/img/NoiDen24.png"> Noi Den: ${searchResult.getNoiDen()} | Thời gian đến: ${searchResult.getThoiGianDen()}</p><br>
                                <p> Tổng Giá Vé: ${searchResult.getTongTienText()}</p><br>
                                <a href="#!" onclick="XemChiTietGia()">Xem chi tiết giá vé</a><br>
                                <div id="ChiTietGia" hidden>
                                    =======================================<br>
                                    Người lớn:<br>
                                    - Giá 1 vé người lớn: ${searchResult.getGia1VeNguoiLon()}<br>
                                    - Số lượng vé người lớn: ${searchResult.getSLNguoiLon()}<br>
                                    =>Thành tiền: ${searchResult.getTongTienNguoiLon()}<br>
                                    =======================================<br>
                                    Trẻ Em:<br>
                                    - Giá 1 vé trẻ em: ${searchResult.getGia1VeTreEm()}<br>
                                    - Số lượng vé trẻ em: ${searchResult.getSLTreEm()}<br>
                                    =>Thành tiền: ${searchResult.getTongTienTreEm()}<br>
                                    =======================================<br>
                                    Em Bé:<br>                                    
                                    - Giá 1 vé em bé: ${searchResult.getGia1VeEmBe()}<br>
                                    - Số lượng vé em bé: ${searchResult.getSLEmBe()}<br>
                                    =>Thành tiền: ${searchResult.getTongTienEmBe()}<br>
                                    =======================================<br>
                                    <center><a href="#!" onclick="AnChiTietGia()">Ẩn tiết giá vé</a><br></center>
                                </div>
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
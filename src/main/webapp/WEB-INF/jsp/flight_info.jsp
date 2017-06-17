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

        <style>





            table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
                content: " \25B4\25BE" 
            }
        </style>






    </head>
    <body>

        <nav class="white" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo"><image src="resources/img/logo.png"></a>

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



                                        </div>
                                        <center><img src="resources/img/passanger.png" style="margin: left" width="50" height="50"><h5><b>Thông tin hành khách</b></h5></center><br>
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
                                        <center>
                                            <button class="btn waves-effect waves-light" type="submit" name="action">Tiếp tục
                                                <i class="material-icons right">send</i>
                                            </button>
                                        </center>
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

                                <div>Schedule: ${fOrigin} ==>> ${fDestination} </div>
                                <div>${fAirline} | ${fAircraft} | ${fArrive} - ${fDepart}</div>
                                <div>Type of ticket: Starter | <a href="#">More details</a></div>
                                <div>Price: ${fPrice}</div>
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
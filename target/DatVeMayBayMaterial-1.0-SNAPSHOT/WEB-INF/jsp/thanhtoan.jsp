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
        
        <!--Script Zendesk Chat Support-->
        <script type="text/javascript">
            window.$zopim || (function (d, s) {
                var z = $zopim = function (c) {
                    z._.push(c)
                }, $ = z.s =
                        d.createElement(s), e = d.getElementsByTagName(s)[0];
                z.set = function (o) {
                    z.set.
                            _.push(o)
                };
                z._ = [];
                z.set._ = [];
                $.async = !0;
                $.setAttribute("charset", "utf-8");
                $.src = "https://v2.zopim.com/?4rUu7hwQ8jR6rCP4Uw2Qa1HkgzsRvj5F";
                z.t = +new Date;
                $.
                        type = "text/javascript";
                e.parentNode.insertBefore($, e)
            })(document, "script");
        </script>
        <!--End of Zendesk Chat Script-->






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
                        <h4><spring:message code="thanhtoan.ChooseAFormOfPayment"/></h4>
                    </div>
                    <div class="col s12">
                        <ul class="collapsible" data-collapsible="accordion">
                            <li>
                                <div class="collapsible-header"><i class="material-icons">polymer</i><spring:message code="thanhtoan.PaymentGatewayNGANLUONG"/></div>
                                <div class="collapsible-body">
                                    <img src="resources/img/nganluong.png"  height="90" width="50%">
                                    <p><spring:message code="thanhtoan.abc"/><br>
                                        <spring:message code="thanhtoan.comment2"/><br>
                                        <spring:message code="thanhtoan.comment3"/><br>
                                    </p>
                                    
                                    <center><a target="_blank" href="https://www.nganluong.vn/button_payment.php?receiver=datvemaybay2017@gmail.com&product_name=123123&price=150000&return_url=index&comments=Thanh toan cho ma dat cho 131421"><img src="https://www.nganluong.vn/css/newhome/img/button/pay-sm.png"border="0" /></a></center>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">label_outline</i><spring:message code="thanhtoan.DirectAtTheBankOrATM"/></div>
                                <div class="collapsible-body">
                                    <img src="resources/img/banklink.png"  height="250" width="100%">
                                    <p><spring:message code="thanhtoan.comment4"/><br>
                                        <spring:message code="thanhtoan.comment5"/><br>
                                        <spring:message code="thanhtoan.comment6"/><br>
                                        <spring:message code="thanhtoan.comment7"/>
                                    </p>
                                    <div><center><a class="waves-effect waves-light btn" href="chuyenkhoan"><spring:message code="thanhtoan.button.thanhtoan"/><i class="material-icons right">send</i></a></center></div>
                                </div>
                            </li>
                           
                            <li>
                                <div class="collapsible-header"><i class="material-icons">lock</i><spring:message code="thanhtoan.MOMOE-Wallet"/></div>
                                <div class="collapsible-body">
                                    <p><spring:message code="thanhtoan.comment8"/>
                                    </p>
                                    <img src="resources/img/payoo.jpg"  height="100" width="80%" class="center">
                                    <br><br>
                                    <div><center><a class="waves-effect waves-light btn" href="momo"><spring:message code="thanhtoan.button.thanhtoan"/><i class="material-icons right">send</i></a></center></div>
                                </div>
                            </li>
                            
                            <li>
                                <div class="collapsible-header"><i class="material-icons">store</i><spring:message code="thanhtoan.AtStore"/></div>
                                <div class="collapsible-body"><p><spring:message code="thanhtoan.comment9"/> <a href="#"><spring:message code="thanhtoan.comment10"/></a></p></div>
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
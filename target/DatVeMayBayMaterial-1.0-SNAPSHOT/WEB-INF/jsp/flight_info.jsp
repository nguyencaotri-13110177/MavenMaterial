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

                <form:form>
                    <div><h3>Flight information</h3></div>
                    <div>Schedule: ${fOrigin} ==>> ${fDestination} </div>
                    <div>${fAirline} | ${fAircraft} | ${fArrive} - ${fDepart}</div>
                    <div>Type of ticket: Starter | <a href="#">More details</a></div>
                    <div>Price: ${fPrice}</div>
                </form:form>

                <form:form>
                    <div><h3>Customer information</h3></div>
                    <!-- for earth adult-->
                    <div>
                        <input value="Mr/Mrs/Mr/Miss">
                        <input value="Last name">
                        <input value="First name">
                    </div>
                    <!-- for earth child and senior-->
                    <div>
                        <!-- for earth child-->
                        <input value="Brother/Sister">
                        <input value="Full name">
                        <input value="Date of birth">
                        <!-- for earth senior-->
                        <input value="Son/Daughter">
                        <input value="Full name">
                        <input value="Date of birth">
                    </div>
                    <!-- Infomation of contact ones -->
                    <div>
                        Email: <input value="Your email">
                        Confirm your Email: <input value="Confirm your email">
                    </div>
                    <div>
                        Phone number: <input value="Your phone number">
                        Address: <input value="Your address">
                        Country: <input value="Your country">
                    </div>
                </form:form>

                <form:form>
                    <div><h3>Luggage information</h3></div>
                    <!-- -->
                    <div>Hand luggage: Free up to 7kilogram/person/flight</div>
                    <div>
                        Way to go: 
                        <input value="1/2/3/..."> person
                        Luggage over:
                        <input value="Nothing/15kilogram/...">
                    </div>
                </form:form>

                <form:form>
                    <div><h3>Pay information</h3></div>
                    <!-- -->
                    <div>Price standard: </div>
                    <!-- for earth person/luggage -->
                    <div>
                        1/2/...Adult
                        2.430.000 VND
                    </div>
                    <div><h3>Tax and service</h3></div>
                    <!-- for earth person/luggage -->
                    <div>
                        1/2/...Adult
                        1.430.000 VND
                    </div>
                    <!-- -->
                    <div>Over luggage: </div>
                    <div>
                        430.000 VND
                    </div>
                </form:form>

                <form:form>
                    <div><h3>Pay way</h3></div>
                    <div>Banking</div>
                    <div>Online</div>
                    <div>In office</div>
                    <div>On your home</div>
                </form:form>
                <input value="Finish" type="submit">

            </div>
        </div>





        <!--  Scripts-->
        <script src="resources/js/materialize.js"></script>
        <script src="resources/js/init_2.js"></script>

    </body>
</html>
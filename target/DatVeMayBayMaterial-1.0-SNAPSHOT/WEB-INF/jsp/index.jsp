<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>Parallax Template - Materialize</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
        <script src="resources/js/air-port-codes-api-min.js"></script>


        <!-- API tim san bay  -->
        <script>
            $(function () {

                var apiKey,
                        apca,
                        params = {
                            secret: 'ec657e8ef6bd074',
                            key: 'b04f63abe1',
                            limit: 10
                        };

                initAutoSelect();




                function initAutoSelect() {
                    $(".autocomplete").each(function () {
                        var apca = new apc('autocomplete', params),
                                autocompleteObj = {
                                    source: function (request, response) {
                                        // make the request
                                        apca.request(request.term);

                                        // this builds each line of the autocomplete
                                        itemObj = function (airport, isChild) {
                                            var label;
                                            if (isChild) {
                                                label = '&rdsh;' + airport.iata + ' - ' + airport.name;
                                            } else {
                                                label = airport.city;
                                                if (airport.state.abbr) {
                                                    label += ', ' + airport.state.abbr;
                                                }
                                                if (airport.country.name && ['US'].indexOf(airport.country.iso) < 0) {
                                                    label += ', ' + airport.country.name;
                                                }
                                                label += ' (' + airport.iata + ' - ' + airport.name + ')';
                                            }
                                            return {
                                                label: label,
                                                value: airport.iata + ' - ' + airport.name,
                                                code: airport.iata
                                            };
                                        };


                                        // this deals with the successful response data
                                        apca.onSuccess = function (data) {
                                            var listAry = [],
                                                    thisAirport;
                                            if (data.status) { // success
                                                for (var i = 0, len = data.airports.length; i < len; i++) {
                                                    thisAirport = data.airports[i];
                                                    listAry.push(itemObj(thisAirport));
                                                    if (thisAirport.children) {
                                                        for (var j = 0, jLen = thisAirport.children.length; j < jLen; j++) {
                                                            listAry.push(itemObj(thisAirport.children[j], true));
                                                        }
                                                    }
                                                }
                                                response(listAry);
                                            } else { // no results
                                                response();
                                            }
                                        };
                                        apca.onError = function (data) {
                                            response();
                                            console.log(data.message);
                                        };
                                    },
                                    select: function (event, ui) {
                                        // do something for click event
                                        console.log(ui.item.code);
                                    }
                                }



                        // this is necessary to allow html entities to display properly in the jqueryUI labels
                        $(this).autocomplete(autocompleteObj).data("ui-autocomplete")._renderItem = function (ul, item) {
                            return $("<li></li>")
                                    .data("item.autocomplete", item)
                                    .append($("<a></a>").html(item.label))
                                    .appendTo(ul);
                        };

                    });
                }
                ;
            });
        </script>



        <!-- disable ngày về khi chọn 1 chiều -->
        <script>



            $(document).ready(function () {
                document.getElementById("ngayve").disabled = true;

                $('#motchieu').change(function () {
                    if ($(this).is(":checked")) {
                        document.getElementById("ngayve").disabled = true;
                        document.getElementById("ngayve").value = "";


                    }
                });
                $('#khuhoi').change(function () {
                    if ($(this).is(":checked")) {
                        document.getElementById("ngayve").disabled = false;

                    }
                });


            });
        </script>




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

        <div id="index-banner" class="parallax-container"><!-- class quy dinh mau chu cua banner trong style.css / hinh nen -->
            <div class="section no-pad-bot">
                <div class="container">
                    <div class="row">
                        <div class="col s12 m7">
                            <div class="card">
                                <div class="card-image">
                                    <img src="resources/img/img8.png"> <!-- hinh cua image Card TimVe -->
                                    <span class="card-title"><spring:message code="lable.index.Title"/></span>
                                </div>
                                <div class="card-content">
                                    <div class="row">
                                        <form class="col s12">
                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <input placeholder="<spring:message code="lable.index.From.comment"/>" id="first_name" type="text" class="validate autocomplete">
                                                    <label for="first_name"><spring:message code="lable.index.From"/></label>
                                                </div>
                                                <div class="input-field col s6">
                                                    <input placeholder="<spring:message code="lable.index.From.comment"/>" id="first_name" type="text" class="validate autocomplete">
                                                    <label for="first_name"><spring:message code="lable.index.To"/></label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                &nbsp;&nbsp;<input name="group1" type="radio" id="motchieu" checked/>
                                                <label for="motchieu"><spring:message code="lable.index.OneWay"/></label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input name="group1" type="radio" id="khuhoi" />
                                                <label for="khuhoi"><spring:message code="lable.index.TwoWay"/></label>
                                            </div>

                                            <div class="row">
                                                <div class="input-field col s6">
                                                    <label for="first_name"><spring:message code="lable.index.Departure"/></label>
                                                    <input type="date" class="datepicker" placeholder="<spring:message code="lable.index.Departure.comment"/>" id="ngaydi">
                                                </div>
                                                <div class="input-field col s6">
                                                    <label for="first_name"><spring:message code="lable.index.Return"/></label>
                                                    <input type="date" class="datepicker" placeholder="<spring:message code="lable.index.Return.comment"/>" id="ngayve">
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="input-field col s4">
                                                    <select>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="1">4</option>
                                                        <option value="1">5</option>
                                                        <option value="2">6</option>
                                                        <option value="3">7</option>
                                                        <option value="2">8</option>
                                                        <option value="3">9</option>
                                                    </select>
                                                    <label><spring:message code="lable.index.Adults"/></label>
                                                </div>
                                                <div class="input-field col s4">
                                                    <select>
                                                        <option value="1">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="1">4</option>
                                                        <option value="1">5</option>
                                                        <option value="2">6</option>
                                                        <option value="3">7</option>
                                                        <option value="2">8</option>
                                                        <option value="3">9</option>
                                                    </select>
                                                    <label><spring:message code="lable.index.Children"/></label>
                                                </div>
                                                <div class="input-field col s4">

                                                    <select>
                                                        <option value="1">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="1">4</option>
                                                        <option value="1">5</option>
                                                        <option value="2">6</option>
                                                        <option value="3">7</option>
                                                        <option value="2">8</option>
                                                        <option value="3">9</option>
                                                    </select>
                                                    <label><spring:message code="lable.index.Infants"/></label>
                                                </div>
                                            </div>

                                            <center><a class="waves-effect waves-light btn"><i class="material-icons left">search</i><spring:message code="lable.index.SearchTickets"/></a></center>



                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="parallax"><img src="resources/img/imga.jpg" alt="Unsplashed background img 1" style="height:500px;width:100%;"></div> <!-- hinh cua banner -->
        </div>



        <div class="container">
            <div class="section">
                <!--   Icon Section   -->
                <div class="row">
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center brown-text"><img src="resources/img/iconapi.png" height="70px" width="100px"></h2>
                            <h5 class="center"><spring:message code="lable.index.col1"/></h5>

                            <p class="light"><spring:message code="lable.index.col1.content"/></p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center brown-text"><img src="resources/img/iconMaterial2.png" height="70px" width="100px"></h2>
                            <h5 class="center"><spring:message code="lable.index.col2"/></h5>

                            <p class="light"><spring:message code="lable.index.col2.content"/></p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center brown-text"><img src="resources/img/iconCloud.png" height="70px" width="100px"></h2>
                            <h5 class="center"><spring:message code="lable.index.col3"/></h5>

                            <p class="light"><spring:message code="lable.index.col3.content"/></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="container">
            <div class="row">
                <img src="resources/img/imgbr.png" alt="Unsplashed background img 2" class="col s12"> <!-- hinh cac hang may bay -->
            </div>
        </div>





        <div class="container">
            <div class="section">

                <div class="row">
                    <div class="col s12 center">
                        <h3><i class="mdi-content-send brown-text"></i></h3>
                        <h4><spring:message code="lable.index.TicketAgent"/></h4>
                        <p class="left-align light"><spring:message code="lable.index.TicketAgent.content"/></p>
                    </div>
                </div>

            </div>
        </div>




        <footer class="page-footer teal">
            <div class="footer-copyright">
                <div class="container">
                    Đặt vé máy bay T&T Team @2017
                </div>
            </div>
        </footer>


        <!--  Scripts-->

        <script src="resources/js/materialize.js"></script>
        <script src="resources/js/init_2.js"></script>

    </body>
</html>

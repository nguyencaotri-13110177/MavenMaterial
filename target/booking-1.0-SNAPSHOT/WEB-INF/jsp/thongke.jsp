<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="resources/img/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <meta name="description" content="">
    <meta name="author" content="">
        <title>T&T_ThongKe</title>

        <!-- CSS  -->
        <link href="resources/css/icon.css" rel="stylesheet">
        <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

        <link rel="stylesheet" href="resources/css/jquery-ui.css">
        <script src="resources/js/jquery.min.js" type="text/javascript"></script>
        <script src="resources/js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="resources/js/air-port-codes-api-min.js"></script>
        
        <script type="text/javascript" src="resources/js/loader.js"></script>
    <script type="text/javascript">
       google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('date', 'X');
      data.addColumn('number', 'Number of the ticket has been sold');

      data.addRows([
        [new Date(2017, 0), 50],
        [new Date(2017, 1), 46],
        [new Date(2017, 2), 57],
        [new Date(2017, 3), 41],
        [new Date(2017, 4), 49],
        [new Date(2017, 5), 53],
        [new Date(2017, 6), 55],
        [new Date(2017, 7), 70],
        [new Date(2017, 8), 80],
        [new Date(2017, 9), 60],
        [new Date(2017, 10), 50],
        [new Date(2017, 11), 70]
      ]);

      var options = {
        hAxis: {
          title: 'Month'
        },
        vAxis: {
          title: 'Number of the ticket'
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
    </script>
    </head>
    <body>
        <%@ include file="/resources/ModuleDesign/navbardaily.jsp"%>
        <div class="jumbotron">
            <center>
                <h4>Number of flight tickets sold over a year</h4>
                <div id="chart_div" style="width: 900px; height: 500px"></div>
            </center>
        </div>
        <!--  Scripts-->
        <script src="resources/js/materialize.js"></script>
        <script src="resources/js/init_2.js"></script>

    </body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search result</title>
    </head>

    <body>
        <table border="1" style="width:100%">
            <tr>
                <th>Airline</th>
                <th>Depart</th>
                <th>Arrive</th>
                <th>Duration</th>
                <th>Price per person</th>
                <th>&nbsp;</th>
            </tr>
            <c:forEach var="sr" items="${searchResults}">
                <tr>
                    <td>${sr.airline}</td>
                    <td>${sr.depart}</td>
                    <td>${sr.arrive}</td>
                    <td>${sr.duration}</td>
                    <td>${sr.pricePerPerson}</td>
                    <td><a href="flight-info?v&id=${sr.id}">Choose</a></td>
                </tr>  
            </c:forEach>
        </table>
        <a href="index">Back</a>
    </body>
</html>

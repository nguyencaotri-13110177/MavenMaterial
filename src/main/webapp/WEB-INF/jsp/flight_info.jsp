<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight ticket info</title>
    </head>
    <body>
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
    </body>
</html>

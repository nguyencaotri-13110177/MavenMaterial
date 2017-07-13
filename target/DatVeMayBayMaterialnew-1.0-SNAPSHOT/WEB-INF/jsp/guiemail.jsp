<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="resources/img/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>T&T_QuanLy</title>

        <!-- CSS  -->
        <link href="resources/css/icon.css" rel="stylesheet">
        <link href="resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

        <link rel="stylesheet" href="resources/css/jquery-ui.css">
        <script src="resources/js/jquery.min.js" type="text/javascript"></script>
        <script src="resources/js/jquery-ui.min.js" type="text/javascript"></script>
        <script src="resources/js/air-port-codes-api-min.js"></script>

        <!-- CKEditor  -->
        <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
        <script>CKEDITOR.replace(jQuery('.ckeditor'));</script>

    </head>
    <body>
        <%@ include file="/resources/ModuleDesign/navbardaily.jsp"%>

        <div class="container">
            <div class="section">


                <div class="row">
                    <div class="white-text card-panel teal lighten-2">Gửi email đến khách hàng</div>
                    <form class="col s12" action="guiemail" method="post">                        
                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="icon_prefix" type="text" class="validate" name="EmailNhan">
                            <label for="icon_prefix">Email nhận</label>
                        </div>

                        <textarea name="NoiDung" class="ckeditor" rows="900">
                                    <table cellspacing="0" style="width:100.0%">
	<tbody>
		<tr>
			<td style="background-color:white">
			<table style="width:100.0%">
				<tbody>
					<tr>
						<td>
						<p><img alt="" src="https://datvemaybay2017.herokuapp.com/resources/img/logo.png" style="height:63px; width:264px" /></p>
						</td>
						<td>
						<p>Hotline: 0167.4960.395</p>
						</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
		<tr>
			<td>
                            <p>Enter the content here...............</p>
			</td>
		</tr>
		<tr>
			<td>
			<table style="width:100.0%">
				<tbody>
					<tr>
						<td>
						<p>Thank you for your interest and use of our services</p>
						</td>
					</tr>
					<tr>
						<td>
						<p><strong>BQT. T&amp;TFlightTicket</strong></p>
						</td>
					</tr>
					<tr>
						<td style="background-color:#6e6e6e">
						<p>Copyright &copy; datvemaybay2017.herokuapp.com</p>
						</td>
					</tr>
					<tr>
						<td>
						<p>Hotline: Mr.Tri:&nbsp;0167.4960.395 - Mr.Tuong:&nbsp;0167.944.6739<br />
						Email: datvemaybay@gmail.com</p>
						</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>
                        </textarea><br>

                        <center>
                            <button class="btn waves-effect waves-light" type="submit" name="action">Gửi thư
                                <i class="material-icons right">send</i>
                            </button>
                        </center>
                    </form>
                </div>


            </div>
        </div>

        <!--  Scripts-->
        <script src="resources/js/materialize.js"></script>
        <script src="resources/js/init_2.js"></script>

    </body>
</html>
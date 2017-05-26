<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
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
		<li><a href="#">Home</a></li>
		<li><a href="#">Hướng dẫn tìm vé</a></li>
        <li><a href="#">Liên hệ</a></li>
		<li>
		<div class="input-field col ">
    <select class="icons">
      <option value="" data-icon="resources/img/TiengViet.png" class="left circle">Tiếng Việt</option>
      <option value="" data-icon="resources/img/English.png" class="left circle">English</option>
    </select>
    <label>Chọn ngôn ngữ</label>
  </div>
		</li>
      </ul>
	  

	  <!-- menu ở chế độ mobile  -->
      <ul id="nav-mobile" class="side-nav">
        <li><a href="#">home</a></li>
		<li><a href="#">Hướng dẫn tìm vé</a></li>
		<li><a href="#">Liên hệ</a></li>
		<li>
		<div class="input-field col ">
    <select class="icons">
      <option value="" data-icon="resources/img/TiengViet.png" class="left circle">Tiếng Việt</option>
      <option value="" data-icon="resources/img/English.png" class="left circle">English</option>
    </select>
    <label>Chọn ngôn ngữ</label>
  </div>
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
              <span class="card-title">Tìm vé máy bay</span>
            </div>
            <div class="card-content">
              <div class="row">
    <form class="col s12">
	  
	  <div class="row">
        <div class="input-field col s6">
          <input placeholder="Nhập mã hoặc tên thành phố" id="first_name" type="text" class="validate autocomplete">
          <label for="first_name">Sân bay đi</label>
        </div>
        <div class="input-field col s6">
          <input placeholder="Nhập mã hoặc tên thành phố" id="first_name" type="text" class="validate autocomplete">
          <label for="first_name">Sân bay đến</label>
        </div>
      </div>
	  
	  <div class="row">
          &nbsp;&nbsp;<input name="group1" type="radio" id="motchieu" checked/>
      <label for="motchieu">Một chiều</label>&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="group1" type="radio" id="khuhoi" />
      <label for="khuhoi">Khứ hồi</label>
      </div>
	   
	   <div class="row">
        <div class="input-field col s6">
          <label for="first_name">Ngày đi</label>
          <input type="date" class="datepicker" placeholder="Chọn ngày đi" id="ngaydi">
        </div>
        <div class="input-field col s6">
          <label for="first_name">Ngày về</label>
          <input type="date" class="datepicker" placeholder="Chọn ngày về" id="ngayve">
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
    <label>Người lớn</label>
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
    <label>Trẻ em</label>
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
    <label>Em bé</label>
        </div>
      </div>
	  
	  <center><a class="waves-effect waves-light btn"><i class="material-icons left">search</i>Tìm vé</a></center>

      
      
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
            <h5 class="center">Sử dụng API được cung cấp bởi Google</h5>

            <p class="light">Ứng dụng sử dụng QPX Express API được cung cấp bởi Google cho kết quả tin cậy, nhanh chóng, chính xác.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><img src="resources/img/iconMaterial2.png" height="70px" width="100px"></h2>
            <h5 class="center">Giao diện Material</h5>

            <p class="light">Phong cách thiết kế Material Design mang lại cho người dùng một trải nghiệm hiện đại, mới mẻ hơn và thú vị hơn. Đồng bộ với nhiều thiết bị có kích thước màn hình khác nhau.</p>
          </div>
        </div>

        <div class="col s12 m4">
          <div class="icon-block">
            <h2 class="center brown-text"><img src="resources/img/iconCloud.png" height="70px" width="100px"></h2>
            <h5 class="center">Sử dụng các công nghệ mới</h5>

            <p class="light">Ứng dụng sử dụng Spring MVC Framework 4.2, project sử dụng công cụ Maven để quản lý và thiết lập tự động. Ứng dụng được triển khai trên Google Cloud mang lại nhiều lợi ích.</p>
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
          <h4>About project</h4>
          <p class="left-align light">Nhu cầu đi lại bằng máy bay càng ngày càng nhiều, và trong tương lai máy bay dân sự sẽ càng ngày càng góp phần rút ngắn khoảng cách mọi nơi trên thế giới nói chung và ngay cả Việt Nam nói riêng. Có cầu sẽ có cung, thông thường các hãng hàng không sẽ cung ứng vé máy bay theo ba kênh: thông qua website bán vé trực tuyến, phòng vé hoặc đại lý chính thức có hợp đồng thương mại với hãng (được gọi là các đại lý cấp 1). Các hãng máy bay có doanh thu đa phần dựa trên doanh thu từ các Đại lý bán vé máy bay mang lại. Đại lý vé máy bay thường có 2 cấp, cấp 1 tức là cấp cao nhất, xuất vé trực tiếp từ hãng. Cấp 2, là nhánh con của cấp cấp 1, xuất vé chủ yếu từ cấp 1. Cũng có cấp 3, nhưng không chính thức, đó là hình thức cộng tác viên. Để làm một Đại lý vé máy bay, ngoài vốn, hợp đồng ký kết chính thức với các hãng, mặt bằng kinh doanh, kinh nghiệm bán vé đó là Website cho phép tra cứu và đặt vé máy bay và xuất vé trực tiếp từ các hãng. Website này đáp ứng đầy đủ các tính năng mà một đại lý bán vé máy bay cần có.</p>
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

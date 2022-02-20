<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./views/assets/css/home.css">
<link rel="stylesheet" href="./views/assets/css/login.css">
<link rel="stylesheet" href="./views/assets/css/grid.css">
<link rel="stylesheet" href="./views/assets/css/base.css">
<link rel="stylesheet" href="./views/assets/css/forgotpassword.css">
<link rel="stylesheet" href="./views/assets/responsive/homeR.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="./views/assets/fontawesome-free-5.15.3-web/css/all.min.css">
</head>

<body>
	<div id="app">
		<jsp:include page="HeaderKhachHang.jsp"></jsp:include>

		<div class="container_content">
			<div class="col l-o-1 l-12 m-12">
				<c:forEach var="items" items="${baiviet }">
					<div class="container_content col">
						<div class="container_content-post">
							<img src="./views/assets/imgs/${ items.img }"
								style="width: 298px; height: 240px;" alt="">
							<p style="margin-top: 10px; font-size: 20px; font-weight: 500;">${items.ten_tieu_de }</p>
							<p>${items.noi_dung }</p>
							<div class="service-item">
								<h3>
									<a target="_blank" href="${items.link }"> Xem ngay</a>
								</h3>
							</div>
						</div>

					</div>
				</c:forEach>


			</div>

		</div>

		<!--modal login, regis start-->
		<jsp:include page="Login.jsp"></jsp:include>

		<jsp:include page="ForgotPassword.jsp"></jsp:include>

		<!--modal guest start
		<jsp:include page="BookingGuest.jsp"></jsp:include>-->
	</div>
	<jsp:include page="FooterKhachHang.jsp"></jsp:include>
	<script src="./views/assets/js/checkErrorLogin.js"></script>
	<script src="./views/assets/js/login.js"></script>
	<script src="./views/assets/js/register.js"></script>
	<script>
		var myCarousel = document.querySelector('#myCarousel')
		var carousel = new bootstrap.Carousel(myCarousel, {
			interval : 1000,
			wrap : false
		})
	</script>

	<script src="./views/assets/js/navbar.js"></script>
	<script src="./views/assets/js/onclickLogin.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</html>
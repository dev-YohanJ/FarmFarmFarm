<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&amp;display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="../order/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../order/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="../order/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="../order/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="../order/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="../order/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="../order/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../order/css/style.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- Header/Nav -->
<jsp:include page="/main/header.jsp"></jsp:include>
<title>결제 정보</title>

</head>
<body>
	<!-- 결제 정보 적힌 부분 -->
	<section class="breadcrumb-section set-bg">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-12 text-center">
					<h1>주문 페이지</h1>
				</div>
			</div>
		</div>
	</section>

	<!-- 주문한 사람 정보 들어가는 부분 -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<h4>구매자 정보</h4>
				<form action="#">
					<div class="row">
					<div class="col-lg-8 col-md-6">
						<div class="checkout__input">
							<p>이름<span>*</span></p>
							<input type="text" placeholder="이름">
						</div>
						<div class="checkout__input">
							<p>주소<span>*</span></p>
							<input type="text" placeholder="주소(도로명)" class="checkout__input__add">
							<input type="text" placeholder="상세 주소">
						</div>
						<div class="checkout__input">
							<p>우편번호<span>*</span></p>
							<input type="text" placeholder="우편번호">
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>전화번호<span>*</span></p>
									<input type="text">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>Email<span>*</span></p>
									<input type="text">
								</div>
							</div>
						</div>
					</div>	
					<h4>배송지 정보</h4>
					<div class="col-lg-8 col-md-6">
						<div class="checkout__input">
							<p>이름<span>*</span></p>
							<input type="text" placeholder="이름">
						</div>
						<div class="checkout__input">
							<p>주소<span>*</span></p>
							<input type="text" placeholder="주소(도로명)" class="checkout__input__add" id = "address">
							<input type="text" placeholder="상세 주소">
						</div>
						<div class="checkout__input">
							<button class="btn btn-success float-right" type="button" id = "postcode" >배송지 변경</button>
							<p>우편번호<span>*</span></p>
							<input type="text" placeholder="우편번호" name = "post1" id = "post1" size = "3">
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>전화번호<span>*</span></p>
									<input type="text">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="checkout__input">
									<p>Email<span>*</span></p>
									<input type="text">
								</div>
							</div>
						</div>
					</div>
						<div class="checkout__order">
							<h4>주문 내역</h4>
							<div class="checkout__order__products">상품 <span>가격</span></div>
							<ul>
								<li>상품명 <span>₩ 20000</span></li>
								<li>상품명 <span>₩ 20000</span></li>
								<li>상품명 <span>₩ 20000</span></li>
							</ul>
							<div class="checkout__order__subtotal">배송비 <span>₩ 5000</span></div>
							<div class="checkout__order__total">합계 <span>₩ 65000</span></div>
							<div class="checkout__input__checkbox">
								<input type="checkbox" name="order" id="phone"> 휴대폰 결제
								<span class="checkmark"></span><br><br>
								<input type="checkbox" name="order" id="card"> 카드 결제
								<span class="checkmark"></span><br><br>
								<input type="checkbox" name="order" id="account"> 무통장 입금
								<span class="checkmark"></span>
							</div><br>
						</div>
					</div>	
					<div class="row">
						<div class="col-6">
 							<button class="btn btn-primary" type="button" style="width: 100%">주문하기</button>
 						</div>
 						<div class="col-6">	
 							<button class="btn btn-danger" type="button" style="width: 100%">취소하기</button>
 						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
    <!-- Checkout Section End -->

<!-- Js Plugins -->
<script src="../order/js/jquery-3.3.1.min.js"></script>
<script src="../order/js/bootstrap.min.js"></script>
<script src="../order/js/jquery.nice-select.min.js"></script>
<script src="../order/js/jquery-ui.min.js"></script>
<script src="../order/js/jquery.slicknav.js"></script>
<script src="../order/js/mixitup.min.js"></script>
<script src="../order/js/owl.carousel.min.js"></script>
<script src="../order/js/main.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- Footer -->
<jsp:include page="/main/footer.jsp"></jsp:include>

</body>
</html>
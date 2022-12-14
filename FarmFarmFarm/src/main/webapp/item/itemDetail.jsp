<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&amp;display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="item/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="item/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="item/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="item/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="item/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="item/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="item/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="item/css/style.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<jsp:include page="../main/header.jsp"/>
<title>제품 상세페이지</title>
</head>
<body>
<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large" 
							src=${iteminfo.item_file1} alt="">
					</div>
					<div class="product__details__pic__slider owl-carousel"><!-- 사진 들어가는 곳 -->
						<img data-imgbigurl=${iteminfo.item_file1} src=${iteminfo.item_file1} alt="">
						<img data-imgbigurl=${iteminfo.item_file2} src=${iteminfo.item_file2} alt="">
						<img data-imgbigurl=${iteminfo.item_file3} src=${iteminfo.item_file3} alt="">
						<img data-imgbigurl=${iteminfo.item_file4} src=${iteminfo.item_file4} alt="">
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${iteminfo.item_name}</h3>
					<div class="product__details__rating"><!-- 별점 -->
						<i class="fa fa-star"></i>
						<i class="fa fa-star"></i>
						<i class="fa fa-star"></i>
						<i class="fa fa-star"></i>
						<i class="fa fa-star-half-o"></i>
						<span>(18 reviews)</span>
					</div>
					<div class="product__details__price">₩ ${iteminfo.item_price}</div>
					<div class="product__details__quantity"><!-- 주문 수량 조정하는곳 -->
						<div class="quantity">
							<div class="pro-qty">
								<input type="text" value="1">
							</div>
						</div>
					</div>
					<a href="items.cart?id=${iteminfo.item_id}" class="primary-btn">ADD TO CART</a>
					<a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
					<ul>
						<li>
							<b>재고 수량 : </b>
							<span>${iteminfo.item_stock}</span>
						</li>
						<li>
							<b>배송일</b>
							<span>1~2일</span>
						</li>
						<li>
							<b>상품 무게</b>
							<span>0.5 kg</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" 
								aria-selected="true">Description</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
								aria-selected="false">Reviews <span>(1)</span></a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>상품 상세 설명</h6>
								<p>${iteminfo.item_description}</p>
							</div>
						</div>		
							<div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
									<h6>상품 리뷰</h6>
									<p>상품 리뷰 적는 곳입니다.</p>
								</div>	
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
</section>
<jsp:include page="/main/footer.jsp"/>

<script src="item/js/jquery-3.3.1.min.js"></script>
<script src="item/js/bootstrap.min.js"></script>
<script src="item/js/jquery.nice-select.min.js"></script>
<script src="item/js/jquery-ui.min.js"></script>
<script src="item/js/jquery.slicknav.js"></script>
<script src="item/js/mixitup.min.js"></script>
<script src="item/js/owl.carousel.min.js"></script>
<script src="item/js/main.js"></script>
<script>
var proQty = $('.pro-qty');
proQty.prepend('<span class="dec qtybtn">-</span>');
proQty.append('<span class="inc qtybtn">+</span>');
proQty.on('click', '.qtybtn', function () {
	var $button = $(this);
	var oldValue = $button.parent().find('input').val();
	if ($button.hasClass('inc')) {
		var newVal = parseFloat(oldValue) + 1;
	} else {
		// Don't allow decrementing below zero
		if (oldValue > 0) {
			var newVal = parseFloat(oldValue) - 1;
		} else {
			newVal = 0;
		}
	}
	$button.parent().find('input').val(newVal);
	$("a.primary-btn").prop("href", "items.cart?id=" + ${iteminfo.item_id} + "&num=" + newVal);
});
</script>
</body>
</html>
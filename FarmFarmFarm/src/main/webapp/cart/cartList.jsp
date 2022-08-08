<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>장바구니-test</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <style>
		.left-bar {margin-top:10px; border-radius:10%}
		main.container {display:flex}
		.d-flex.flex-column {margin:80px 50px 0 0; max-height:300px}
		.shoping__cart__item>img {width:100px; height:80px; border-radius:10px}
  </style>
</head>
<body>
<!-- Header/Nav -->
<jsp:include page="../main/header.jsp"></jsp:include>

<!-- main contents -->
<main class=container>
 <div class="row">
  <!-- Sidebar -->
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light left-bar col-3">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-4">My 팜팜팜</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="#" class="nav-link active" aria-current="page" style="background: #39A92E">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"/></svg>
          주문내역
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
          장바구니
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"/></svg>
          회원정보 수정
        </a>
      </li>
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
          배송조회
        </a>
      </li>
    </ul>
    <hr>
  </div>
  <!-- sidebar end -->
  

  <!-- Shoping Cart Section Begin -->
  <section class="shoping-cart spad col">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품명</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총 금액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="../image/fruits/grape.jpg" alt="포도">
                                        <h5>포도 2kg</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        32,900원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        32,900원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                         <span class="icon_close"></span>
                                    </td>
                                </tr>
                                 <tr>
                                    <td class="shoping__cart__item">
                                        <img src="../image/fruits/grape.jpg" alt="">
                                        <h5>포도 2kg</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        32,900원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        32,900원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="../image/fruits/grape.jpg" alt="">
                                        <h5>포도 2kg</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        32,900원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        32,900원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    &nbsp;
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>장바구니 총액</h5>
                        <ul>
                            <li>총 주문금액 <span>32,900원</span></li>
                        </ul>
                        <a href="#" class="primary-btn">주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
  <!-- Shoping Cart Section End -->
 </div>
</main>


<!-- Footer -->
<jsp:include page="../main/footer.jsp"></jsp:include>

<!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>
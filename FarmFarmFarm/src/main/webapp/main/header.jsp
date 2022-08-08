<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<style>
	nav.navbar {background: #39A92E}
	a>.navbar-brand {margin-lefe:20px;}
	li.nav-item {
		margin: 0px 50px 0px 20px;
	}
	input.form-control.me-2 {
	width: 200px;
	}
	.btn-outline-light {
		margin-right: 40px;
	}
	li>.nav-link {color: black}
	</style>

</head>
<body>
<!-- Header -->
  <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3">
      <a href="main.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
        <span class="fs-4"><img src="image/logo.png" width="90px" ></span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-item"><a href="#" class="nav-link">로그인</a></li>
        <li class="nav-item"><a href="#" class="nav-link">회원가입</a></li>
        <li class="nav-item"><a href="#" class="nav-link">장바구니</a></li>
        <li class="nav-item"><a href="#" class="nav-link">주문/배송</a></li>
      </ul>
    </header>
  </div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top" >
      <div class="container-fluid" >
        <a class="navbar-brand" href="#" >Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
             <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="#">신상품</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="#">베스트 100</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="#">제철상품</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="#">타임세일</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="#">고객센터</a>
	          </li>
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
    
</body>
</html>
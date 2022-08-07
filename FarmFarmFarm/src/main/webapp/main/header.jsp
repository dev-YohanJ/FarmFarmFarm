<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<style>
#navbarsExample08 li {
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
        <span class="fs-4"><img src="../image/logo.png" width="90px" ></span>
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
<nav class="navbar navbar-expand-lg navbar-dark sticky-top" style="background: #39A92E" aria-label="Tenth navbar example" >
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
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
      </div>
    </div>
     <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
      <button class="btn btn-outline-light" type="submit">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
		</svg>
      </button>
    </form>
  </nav>
</body>
</html>
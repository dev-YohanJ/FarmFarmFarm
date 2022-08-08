<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<style>
	img.h600 {height:500px}
	.items_p {text-align:center}
	.card shadow-sm {height:350px}
	.card-text-og {font-size:12px; color:darkgray; text-decoration:line-through}
	.card-text-cl {font-size:15px; color:red}
	.free-ship {width:60px; padding: 0 6px; font-size:10px; color:#767676; 
				text-align:center; border:1px #ddd solid; border-radius:10px; }
	h5>a {color: black; text-decoration: none}
</style>
</head>
<body>
<!-- Header/Nav -->
<jsp:include page="header.jsp"></jsp:include>

<!-- main contents -->
<main class=container>

<!-- main ad -->
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="image/ad/ad.jpg" class="d-block w-100 h600" alt="wheat">
      <div class="carousel-caption d-none d-md-block">
        <h1>메인 배너광고</h1>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="image/ad/ad2.jpg" class="d-block w-100 h600" alt="nuts">
      <div class="carousel-caption d-none d-md-block">
        <h1>메인 배너광고2</h1>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="image/ad/ad3.jpg" class="d-block w-100 h600" alt="apple">
      <div class="carousel-caption d-none d-md-block">
        <h1>메인 배너광고3</h1>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


  <!-- items -->
  <div class="album py-5 bg-light">
	<h3 class="items_p">직거래 순위 베스트</h3>
	<p class="items_p">가장 사랑을 많이 받고 있는 우리 농산품</p>  

    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      	<!-- item1 -->
        <div class="col">
          <div class="card shadow-sm">
	         <a href="#">
	           <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid" focusable="true">
	            	<image href="image/fruits/grape.jpg" width="100%" height="100%"/>
	            	<%-- <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text> --%>
	            </svg>
	          </a>
           
            <div class="card-body">
              <h5 class="card-title link"><a href="#">새콤달콤한 가평 포도 2kg</a></h5>
              <div class="price">
              	<span class="card-text"> 32,900원</span>
	            <span class="card-text-og">47,000원</span>
	            <span class="card-text-cl">30%</span>
              </div>
              <p class="free-ship">무료배송</p>
            </div>
          </div>
        </div>
        <!-- item2 -->
        <div class="col">
          <div class="card shadow-sm">
	         <a href="#">
	           <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid" focusable="true">
	            	<image href="image/fruits/peach.jpg" width="100%" height="100%"/>
	            	<%-- <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text> --%>
	            </svg>
	          </a>
           
            <div class="card-body">
              <h5 class="card-title link"><a href="#">맛좋은 황도복숭아 4kg</a></h5>
              <div class="price">
              	<span class="card-text"> 29,900원</span>
	            <span class="card-text-og">32,900원</span>
	            <span class="card-text-cl">10%</span>
              </div>
              <p class="free-ship">무료배송</p>
            </div>
          </div>
        </div>
        <!-- item3 -->
        <div class="col">
          <div class="card shadow-sm">
	         <a href="#">
	           <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid" focusable="true">
	            	<image href="image/vegetables/cherryTomato4.jpg" width="100%" height="100%"/>
	            	<%-- <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text> --%>
	            </svg>
	          </a>
           
            <div class="card-body">
              <h5 class="card-title link"><a href="#">친환경 유기농 방울토마토 2kg</a></h5>
              <div class="price">
              	<span class="card-text"> 13,900원</span>
	            <span class="card-text-og">19,900원</span>
	            <span class="card-text-cl">30%</span>
              </div>
              <p class="free-ship">무료배송</p>
            </div>
          </div>
        </div>
        
        <!-- item4 -->
        <div class="col">
          <div class="card shadow-sm">
	         <a href="#">
	           <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid" focusable="true">
	            	<image href="image/vegetables/potato.jpg" width="100%" height="100%"/>
	            	<%-- <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text> --%>
	            </svg>
	          </a>
           
            <div class="card-body">
              <h5 class="card-title link"><a href="#">전국최고 수미감자 5kg</a></h5>
              <div class="price">
              	<span class="card-text"> 16,900원</span>
	            <span class="card-text-og">19,900원</span>
	            <span class="card-text-cl">15%</span>
              </div>
              <p class="free-ship">무료배송</p>
            </div>
          </div>
        </div>
        <!-- item5 -->
        <div class="col">
          <div class="card shadow-sm">
	         <a href="#">
	           <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid" focusable="true">
	            	<image href="image/vegetables/onion.jpg" width="100%" height="100%"/>
	            	<%-- <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text> --%>
	            </svg>
	          </a>
           
            <div class="card-body">
              <h5 class="card-title link"><a href="#">저장용 일반양파 5kg</a></h5>
              <div class="price">
              	<span class="card-text"> 15,900원</span>
	            <span class="card-text-og">17,900원</span>
	            <span class="card-text-cl">11%</span>
              </div>
              <p class="free-ship">무료배송</p>
            </div>
          </div>
        </div>
        <!-- item6 -->
        <div class="col">
          <div class="card shadow-sm">
	         <a href="#">
	           <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid" focusable="true">
	            	<image href="image/nuts/peanut.jpg" width="100%" height="100%"/>
	            	<%-- <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text> --%>
	            </svg>
	          </a>
           
            <div class="card-body">
              <h5 class="card-title link"><a href="#">국내산 생땅콩 500g</a></h5>
              <div class="price">
              	<span class="card-text"> 13,900원</span>
	            <span class="card-text-og">8,900원</span>
	            <span class="card-text-cl">36%</span>
              </div>
              <p class="free-ship">무료배송</p>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

</main>


<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>listpage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<style>
	.banner {position: relative;
    	width: 100%;
    	height: 0;
    	padding-top: calc(350 / 1000 * 100%);
    	margin-top:10px}
	img.bn { position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius:5px;
            opacity:0.8}
    
    .bl1 {border:1px solid lightgray; border-radius:10px}
	.items_p {text-align:center}
	.card shadow-sm {height:350px}
	.card-text-og {font-size:12px; color:darkgray; text-decoration:line-through}
	.card-text-cl {font-size:15px; color:red}
	.free-ship {width:50px; padding: 0 6px; font-size:10px; color:#767676; border:1px #ddd solid; border-radius:10px; }
	h5>a {color: black; text-decoration: none}
	
	.sort{display: flex;
		    -webkit-box-align: center;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    padding-top: 15px;
		    border:1px solid lightgray;
		    border-radius:15px;
		    margin: 1rem 0;}
	a {text-decoration: none; cursor:pointer}
	.sort-detail>ul {list-style: none; display:flex; display}
	.sort-detail>ul>li>a{display:block; padding:0 10px; color:slategray !important; font-size:15px}
	.sort-totall>span {padding-left:10px; color:slategray; font-size:15px}
</style>
</head>
<body>
<!-- Header/Nav -->
<jsp:include page="/main/header.jsp"></jsp:include>

<!-- main contents -->
<main class=container>
<!-- main banner -->
 <div class="banner">
 	<img src="../image/ad/farmer.jpg" class="img-fluid bn" alt="banner">
 </div>


  <!-- items -->
  <div class="album">
    <div class="container">
    
    	<!-- sub_nav -->
    	<div class="sort">
    		<div class="sort-totall">
    			<span>전체 상품 00건</span>
    		</div>
    		<div class="sort-detail">
    			<ul>
	    			<li><a>최근 등록순</a></li>
	    			<li><a>판매 인기순</a></li>
	    			<li><a>낮은 가격순</a></li>
	    			<li><a>높은 가격순</a></li>
	    			<li><a>상품평 많은순</a></li>
	    		</ul>
    		</div>
    	</div>

	  <!-- products -->
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      	<!-- item1 -->
        <div class="col">
          <div class="card shadow-sm">
	         <a href="#">
	           <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid" focusable="true">
	            	<image href="../image/fruits/grape.jpg" width="100%" height="100%"/>
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
	            	<image href="../image/fruits/peach.jpg" width="100%" height="100%"/>
	            	<%-- <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text> --%>
	            </svg>
	          </a>
           
            <div class="card-body">
              <h5 class="card-title link"><a href="#">맛좋은 황도복숭아 4kg</a></h5>
              <div class="price">
              	<span class="card-text"> 32,900원</span>
	            <span class="card-text-og">29,900원</span>
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
	            	<image href="../image/vegetables/cherryTomato4.jpg" width="100%" height="100%"/>
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
	            	<image href="../image/vegetables/potato.jpg" width="100%" height="100%"/>
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
	            	<image href="../image/vegetables/onion.jpg" width="100%" height="100%"/>
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
	            	<image href="../image/nuts/peanut.jpg" width="100%" height="100%"/>
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
<jsp:include page="/main/footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../main/header.jsp"/><hr>
<style>
	select.form-control{
		width: auto;
		margin-bottom: 2em;
		display:inline-block;
	}
	a:hover { color:black; text-decoration: none; }
	a:active {color:black;text-decoration: none;}
	
	
	.rows{
		text-align: right;
	}
	
	.gray{
		color: gray
	}
	
	body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width: 15%;}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width: 70%;}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width: 10%;}
	body > div > table > thead > tr:nth-child(2) > th:nth-child(4){width: 5%;}
</style>
<script src="js/list.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>
<%
	String pagefile = (String)request.getAttribute("pagefile");
%>
<body>
<div class="container-fluid" style="margin-top: 10px; padding:30px">
  <div class="row">
    <div class="col-sm-2 bg-light">
      <aside>
        <jsp:include page = "admin_left.jsp"/>
      </aside>
        </div>
        
        <div class="col-sm-8" style="margin-bottom:5rem">
        <h3 style="text-align:center">문의 게시판</h3>
      <section>
        <table class="table" style="border-bottom:1px solid black">
          <thead id="title">
            <tr>
			  <th colspan="4 " style="text-align:right">검색	
			  <input type="search"> </th>
	 		</tr>
			<tr>
	   		  <th><div>번호</div></th>
	   		  <th><div>제목</div></th>
	   		  <th><div>작성자</div></th>
	   		  <th><div>날짜</div></th>
			</tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>&nbsp;&nbsp;1</td>
		      <td><a href="admin_qnaDetail.jsp">하이하이</a></td>
		      <td>하이하이</td>
		      <td>2022-08-04</td>
		    </tr>
		    <tr>
		      <td>&nbsp;&nbsp;2</td>
		      <td>왜 배송 안와요?</td>
		      <td>ez</td>
		      <td>2022-08-04</td>
		    </tr>
		    <tr>
		      <td>&nbsp;&nbsp;3</td>
		      <td>질문입니다.?</td>
		      <td>mj</td>
		      <td>2022-08-04</td>
		    </tr>
		    <tr>
		      <td>&nbsp;&nbsp;4</td>
		      <td>환불질문입니다</td>
		      <td>qeqe</td>
		      <td>2022-08-05</td>
		    </tr><tr>
		      <td>&nbsp;&nbsp;5</td>
		      <td>반갑습니다?</td>
		      <td>asdjqr132</td>
		      <td>2022-08-06</td>
		    </tr>
  		  </tbody>
 </table>
    			</section>
    		</div>
    	</div>
    </div>
<div class="container">
<%-- 게시글이 있는 경우 --%>
<c:if test="${listcount > 0 }">


 	
 <div class="center-block">
 	<ul class="pagination justify-content-center">
 		<c:if test="${page <= 1 }">
 			<li class="page-item">
 				<a class="page-link gray">이전&nbsp;</a>
 			</li>
 		</c:if>
 		<c:if test="${page > 1 }">
 			<li class="page-item">
 				<a href="BoardList.bo?page=${page-1 }"
 				   class = "page-link">이전&nbsp;</a>
 			</li>
 		</c:if>
 		
 		<c:forEach var="a" begin="${startpage }" end="${endpage }">
 			<c:if test="${a == page }">
 				<li class="page-item active">
 					<a class="page-link">${a}</a>
 				</li>
 			</c:if>
 			<c:if test="${a != page }">
 				<li class="page-item">
 					<a href="BoardList.bo?page=${a}"
 					   class="page-link">${a}</a>
 				</li>
 			</c:if>
 		</c:forEach>
 		
 		<c:if test="${page >= maxpage }">
 			<li class="page_item">
 				<a class="page-link gray">&nbsp;다음</a>
 			</li>	
 		</c:if>
 		<c:if test="${page < maxpage }">
 			<li class="page-item">
 				<a href="BoardList.bo?page=${page+1 }"
 				   class="page-link">&nbsp;다음</a>
 			</li>
 		</c:if>
 	</ul>
 </div>
</c:if><%-- <c:if test="${listcount > 0 }"> end --%>

<%-- 게시글이 없는 경우 --%>
<c:if test="${listcount == 0 }">
	<font size=5>등록된 글이 없습니다.</font>
</c:if>


	
</div>
</body>
<script>
	var pagefile='<%=pagefile%>';
	var filelist = ["admin_notice", "admin_qna", "admin_goods"];
	
	for(var index=0; index<filelist.length; index++){
		if(pagefile==filelist[index]){
			$('.nav-pills > .nav-item > .nav-link').eq(index).addClass('active');
		}else{
			$('.nav-pills > .nav-item > .nav-link').eq(index).removeClass('active');
		}
	}
</script>
<hr>
<jsp:include page="../main/footer.jsp"/>
</html>
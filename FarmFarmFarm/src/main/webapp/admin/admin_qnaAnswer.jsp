<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../other/header.jsp"/><hr>
<style>
	select.form-control{
		width: auto;
		margin-bottom: 2em;
		display:inline-block;
	}
	
	.rows{
		text-align: right;
	}
	
	.gray{
		color: gray
	}
	
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
    <div class="col-sm-1 bg-light">
      <aside>
        <jsp:include page = "admin_left.jsp"/>
      </aside>
        </div>
        
        <div class="col-sm-10" style="margin-bottom:5rem">
        <h3 style="text-align:center">문의하기 답변</h3>
 <div class="container">
 <form action="BoardAddAction.bo" method="post" enctype="multipart/form-data" name="boardform">
  <div class="form-group">
  	<label for="board_name">글쓴이</label>
  	<input name="board_name" id="board_name" value="${id }"	readOnly
  		   type="text" 	     class="form-control">
  </div>
  <div class="form-group">
  	<label for="board_pass">비밀번호</label>
  	<input name="board_pass" id="board_pass" type="password" maxlength="30"
  		   class="form-control" placeholder="비밀번호를 입력하세요">
  </div>
  <div class="form-group">
  	<label for="board_subject">제목</label>
  	<input name="board_subject" id="board_subject" type="text" maxlength="100"
  		   class="form-control" placeholder="제목을 입력하세요">
  </div>
  <div class="form-group">
  	<label for="board_content">내용</label>
  	<textarea name="board_content" id="board_content" 
		   rows="10" class="form-control" placeholder="내용을 입력하세요"></textarea>
  </div>
  <div class="form-group" style="text-align: center">
  	<button type=submit class="btn btn-primary">등록</button>
  	<button type=reset class="btn btn-danger">취소</button>
  </div>
  
 </form>
</div>
</div>
</div>

<%-- 게시글이 없는 경우 --%>
<c:if test="${listcount == 0 }">
	<font size=5>등록된 글이 없습니다.</font>
</c:if>


	
</div>
</body>
<script>
	var pagefile='<%=pagefile%>';
	var filelist = ["newitem", "bestitem", "useditem"];
	
	for(var index=0; index<filelist.length; index++){
		if(pagefile==filelist[index]){
			$('.nav-pills > .nav-item > .nav-link').eq(index).addClass('active');
		}else{
			$('.nav-pills > .nav-item > .nav-link').eq(index).removeClass('active');
		}
	}
</script>
<hr>
<jsp:include page="../other/footer.jsp"/>
</html>
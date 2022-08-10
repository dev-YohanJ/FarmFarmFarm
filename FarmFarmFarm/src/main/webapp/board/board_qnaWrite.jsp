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
	
	.rows{
		text-align: right;
	}
	
	.gray{
		color: gray
	}
	
</style>
<script src="js/list.js"></script>
<meta charset="UTF-8">
<title>문의하기 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>

<body>
<div class="container-fluid" style="margin-top: 10px; padding:30px">
  <div class="row">
    <div class="col-sm-2 bg-light">
      <aside>
        <jsp:include page = "board_left.jsp"/>
      </aside>
        </div>
        
        <div class="col-sm-8" style="margin-bottom:5rem">
        <h3 style="text-align:center">문의하기</h3>
 <div class="container">
 <form action="QnaAddAction.bo" method="post" enctype="multipart/form-data" name="qnaform">
  <div class="form-group">
  	<label for="qna_name">글쓴이</label>
  	<input name="qna_name" id="qna_name" value="${id }"	readOnly
  		   type="text" 	     class="form-control">
  </div>
  <div class="form-group">
  	<label for="qna_pass">비밀번호</label>
  	<input name="qna_pass" id="qna_pass" type="password" maxlength="30"
  		   class="form-control" placeholder="비밀번호를 입력하세요">
  </div>
  <div class="form-group">
  	<label for="qna_subject">제목</label>
  	<input name="qna_subject" id="qna_subject" type="text" maxlength="100"
  		   class="form-control" placeholder="제목을 입력하세요">
  </div>
  <div class="form-group">
  	<label for="qna_content">내용</label>
  	<textarea name="qna_content" id="qna_content" 
		   rows="10" class="form-control" placeholder="내용을 입력하세요"></textarea>
  </div>
  <div class="form-group" style="text-align: center">
  	<button type=submit class="btn btn-primary">등록</button>
  	<button type=reset class="btn btn-danger" onclick="history.go(-1)">취소</button>
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

<hr>
<jsp:include page="../main/footer.jsp"/>
</html>
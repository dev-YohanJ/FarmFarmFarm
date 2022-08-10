<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../main/header.jsp" /><hr>
<style>
select.form-control {
	width: auto;
	margin-bottom: 2em;
	display: inline-block;
}

.rows {
	text-align: right;
}

.gray {
	color: gray
}

body>div>table>thead>tr:nth-child(2)>th:nth-child(1) {
	width: 8%;
}

body>div>table>thead>tr:nth-child(2)>th:nth-child(2) {
	width: 50%;
}

body>div>table>thead>tr:nth-child(2)>th:nth-child(3) {
	width: 14%;
}

body>div>table>thead>tr:nth-child(2)>th:nth-child(4) {
	width: 17%;
}

body>div>table>thead>tr:nth-child(2)>th:nth-child(5) {
	width: 11%;
}
</style>
<script src="js/board_qnaWrite.js"></script>
<meta charset="UTF-8">
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>
<body>
	<div class="container-fluid" style="margin-top: 10px; padding: 30px">
		<div class="row">

			<div class="col-sm-2 bg-light">
				<aside>
					<jsp:include page="admin_left.jsp" />
				</aside>
			</div>

			<div class="col-sm-8" style="margin-bottom: 5rem">
				<h3 style="text-align: center">공지사항</h3>
				<section>
	
						<table class="table">
		<tr>
			<td><div>글쓴이</div></td>
			<td><div>${noticedata.notice_name}</div></td>
		</tr>
		<tr>
			<td><div>제목</div></td>
			<td><c:out value="${noticedata.notice_subject}"/></td>
		</tr>
		<tr>
			<td><div>내용</div></td>
			<td style="padding-right: 0px">
				<textarea class="form-control" 
						  rows="5" readOnly>${noticedata.notice_content}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" class="ok" style="text-align:'center'">
				<c:if test="${noticedata.notice_name == id || id == 'admin'}">
				</c:if>
				 <a href="NoticeList.mgr">
				 	<button class="btn btn-warning">확인</button>
				 </a>
			</td>
		</tr>
	</table>
					<%-- <c:if test="${listcount > 0 }"> end --%>
					<%-- 게시글이 없는 경우 --%>
					<c:if test="${listcount == 0 }">
						<font size=5>등록된 글이 없습니다.</font>
					</c:if>
				</section>
			</div>
			</div>
			</div>
</body>


<hr>
<jsp:include page="../main/footer.jsp" />
</html>
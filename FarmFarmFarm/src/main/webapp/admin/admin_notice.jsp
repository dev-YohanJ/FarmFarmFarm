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
<script src="js/admin_noticeWrite.js"></script>
<meta charset="UTF-8">
<title>관리자 공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>
<%
String pagefile = (String) request.getAttribute("pagefile");
%>
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
					<%-- 게시글이 있는 경우 --%>
					<c:if test="${listcount > 0 }">
						<table class="table" style="border-bottom: 1px solid black">
							<thead id="title">
								<tr>
									<th colspan="5" style="text-align: right">검색 <input
										type="search">
									</th>
								</tr>
								<tr>
									<th><div>번호</div></th>
									<th><div>제목</div></th>
									<th><div>날짜</div></th>
									<th><div>조회수</div></th>
									<th><div>수정/삭제</div></th>
								</tr>
							</thead>
							<tbody>
								<c:set var="num" value="${listcount-(page-1)*limit }" />
								<!-- 글 시작 번호  -->
								<c:forEach var="b" items="${noticelist }">
									<tr>
										<td>
											<%-- 번호 --%> <c:out value="${num }" />
											<%-- num 출력 --%> <c:set var="num" value="${num-1 }" />
											<%-- num=num-1; 의미 --%>
										</td>
										<td>
											<%-- 제목 --%>
											<div>
												<%-- 답변글 제목 앞에 여백 처리 부분 
   	 		  board_re_lev, board_num,
   	 		  board_subject, board_name, board_date,
   	 		  board_readcount : property 이름 --%>
												<c:if test="${b.notice_re_lev != 0 }">
													<!-- 답글인 경우 -->
													<c:forEach var="a" begin="0" end="${b.notice_re_lev*2 }"
														step="1">
   	 		&nbsp;
   	 		</c:forEach>
													<img src='image/line.gif'>
												</c:if>

												<c:if test="${b.notice_re_lev == 0 }">
													<%-- 원문인 경우 --%>
   	 		&nbsp;
   	 	</c:if>

												<a href="NoticeDetailAction.mgr?num=${b.notice_num }"> <c:if
														test="${b.notice_subject.length()>=20 }">
														<c:out value="${b.notice_subject.substring(0, 20) }..." />
													</c:if> <c:if test="${b.notice_subject.length()<20 }">
														<c:out value="${b.notice_subject }" />
													</c:if>
												</a>[${b.cnt}]
											</div>
										</td>
										<td><div>${b.notice_date }</div></td>
										<td><div>${b.notice_readcount }</div></td>
										<td>
											<a href="NoticeModifyView.mgr?num=${b.notice_num }">수정</a>
											<a href="NoticeDeleteAction.mgr?num=${b.notice_num }">삭제</a>
										<td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="center-block">
							<ul class="pagination justify-content-center">
								<c:if test="${page <= 1 }">
									<li class="page-item"><a class="page-link gray">이전&nbsp;</a>
									</li>
								</c:if>
								<c:if test="${page > 1 }">
									<li class="page-item"><a
										href="NoticeList.mgr?page=${page-1 }" class="page-link">이전&nbsp;</a>
									</li>
								</c:if>

								<c:forEach var="a" begin="${startpage }" end="${endpage }">
									<c:if test="${a == page }">
										<li class="page-item active"><a class="page-link">${a}</a>
										</li>
									</c:if>
									<c:if test="${a != page }">
										<li class="page-item"><a href="NoticeList.mgr?page=${a}"
											class="page-link">${a}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${page >= maxpage }">
									<li class="page_item"><a class="page-link gray">&nbsp;다음</a>
									</li>
								</c:if>
								<c:if test="${page < maxpage }">
									<li class="page-item"><a href="NoticeList.mgr?page=${page+1 }"
										class="page-link">&nbsp;다음</a></li>
								</c:if>
							</ul>
						</div>
					</c:if>
					<%-- <c:if test="${listcount > 0 }"> end --%>
					<%-- 게시글이 없는 경우 --%>
					<c:if test="${listcount == 0 }">
						<font size=5>등록된 글이 없습니다.</font>
					</c:if>
					<button type="button" class="btn bg-light float-right">등록하기</button>
				</section>
			</div>
			</div>
			</div>
</body>

<hr>
<jsp:include page="../main/footer.jsp" />
</html>
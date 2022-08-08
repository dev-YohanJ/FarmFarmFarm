<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
    
<!-- main contents -->
<main class=container>

<!-- Sidebar -->
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light left-bar">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-4">관리자 페이지</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="NoticeList.mgr" class="nav-link active" aria-current="page" style="background: #39A92E">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#notice"/></svg>
          공지사항
        </a>
      </li>
      <li>
        <a href="QnaList.mgr" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#qna"/></svg>
          문의 게시판
        </a>
      </li>
      <li>
        <a href="GoodsList.mgr" class="nav-link link-dark">
          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#goods"/></svg>
          상품관리
        </a>
      </li>
    </ul>
    <hr>
  </div>


</main>    
    
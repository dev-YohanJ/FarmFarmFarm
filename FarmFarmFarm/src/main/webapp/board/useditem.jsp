<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%--https://www.w3schools.com/bootstrap4/tryit.asp?filename=trybs_filters_table&stacked=h --%>
<div class="container mt-3">
  <h2>중고상품 목록입니다.</h2>
  <p>상품입력하세요.</p>  
  <input class="form-control" id="myInput" type="search" placeholder="Search..">
  <br>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>상품이름</th>
        <th>가격</th>
        <th>제조사</th>
      </tr>
    </thead>
    <tbody id="myTable">
      <tr>
        <td>노트북</td>
        <td>200,000</td>
        <td>컴퓨터 나라</td>
      </tr>
      <tr>
        <td>마우스</td>
        <td>10,000</td>
        <td>클릭의 나라</td>
      </tr>
      <tr>
        <td>우산</td>
        <td>1,500</td>
        <td>비오는 나라</td>
      </tr>
      <tr>
        <td>에어컨</td>
        <td>300,000</td>
        <td>시원한 나라</td>
      </tr>
    </tbody>
  </table>
  </div>
<script>
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").each(function() {
    	
    	console.log($(this).text());
    	console.log($(this).text().toLowerCase().indexOf(value) > -1)
    	
      //toogle(true) : 해당 객체가 보여집니다.
      //toogle(false) : 해당 객체가 보이지 않습니다.
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
</script>
</html>


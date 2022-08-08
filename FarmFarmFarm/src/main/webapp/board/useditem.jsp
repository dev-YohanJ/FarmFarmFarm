<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%--https://www.w3schools.com/bootstrap4/tryit.asp?filename=trybs_filters_table&stacked=h --%>
<div class="container mt-3">
  <h2>�߰��ǰ ����Դϴ�.</h2>
  <p>��ǰ�Է��ϼ���.</p>  
  <input class="form-control" id="myInput" type="search" placeholder="Search..">
  <br>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>��ǰ�̸�</th>
        <th>����</th>
        <th>������</th>
      </tr>
    </thead>
    <tbody id="myTable">
      <tr>
        <td>��Ʈ��</td>
        <td>200,000</td>
        <td>��ǻ�� ����</td>
      </tr>
      <tr>
        <td>���콺</td>
        <td>10,000</td>
        <td>Ŭ���� ����</td>
      </tr>
      <tr>
        <td>���</td>
        <td>1,500</td>
        <td>����� ����</td>
      </tr>
      <tr>
        <td>������</td>
        <td>300,000</td>
        <td>�ÿ��� ����</td>
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
    	
      //toogle(true) : �ش� ��ü�� �������ϴ�.
      //toogle(false) : �ش� ��ü�� ������ �ʽ��ϴ�.
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
</script>
</html>


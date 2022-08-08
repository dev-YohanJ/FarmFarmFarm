<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
  아이디를 입력 후 아이디 중복검사를 안해도 submit 되는 오류 발생
 -->
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<link href="${pageContext.request.contextPath}
/css/join2.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/member/jquery-3.6.0.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 

<script src="<%=request.getContextPath()%>/member/validate2.js"></script>


<body>


  <form name="myform" method="post" action="join_ok" 
         id="myform" >
  <div><img src="../image/farm.png" alt="image_farm" style ="text-align : center;"></div>
    <div class="container">
     <div><h3>회원 정보를 입력해주세요.</h3></div>
 
       <label for="id">ID</label>
       <div>
        <input type="text" placeholder="Enter id" name="id" id="id" >      
        
       </div>
       
       <label for="pass">Password</label>
       <input type="password" placeholder="비밀번호를 입력하세요." name="pass" id="pass" >
       <input type="password" placeholder="비밀번호를 재입력하세요." name="pass" id="pass" >
       
       		<!-- BIRTH -->
                <div>
                    <h3><label for="yy">생년월일</label></h3>

                    <div id="bir_wrap">
                    
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                                <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                            </span>
                        </div>

                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select id="mm">
                                    <option>월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>                                    
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </span>
                        </div>

                         <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select id="mm">
                                    <option>일</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>                                    
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="01">13</option>
                                    <option value="02">14</option>
                                    <option value="03">15</option>
                                    <option value="04">16</option>
                                    <option value="05">17</option>
                                    <option value="06">18</option>
                                    <option value="07">19</option>
                                    <option value="08">20</option>
                                    <option value="09">21</option>                                    
                                    <option value="10">22</option>
                                    <option value="11">23</option>
                                    <option value="12">24</option>
                                    <option value="12">25</option>
                                    <option value="12">26</option>
                                    <option value="12">27</option>
                                    <option value="12">28</option>
                                    <option value="12">29</option>
                                    <option value="12">30</option>
                                    <option value="12">31</option>
                                    
                                </select>
                            </span>
                        </div>

                    </div>
                    <span class="error_next_box"></span>    
                </div>

       
      
       <label for="email">E-Mail</label>      
       <input type="text" name="email" id="email"> @
       <input type="text" name="domain" id="domain">  
       <select name="sel" id="sel" >
           <option value="">직접입력</option>
           <option value="naver.com">naver.com</option>
           <option value="daum.net">daum.net</option>
           <option value="nate.com">nate.com</option>
           <option value="gmail.com">gmail.com</option>
       </select>
      
     
      
     
       
      <label for="post1">우편번호</label>
      <input type="text" size="5" maxLength="5" name="post1" id="post1" readOnly> 
      <input type="button" value="우편검색" id="postcode">
      
      <label for="address">주소</label>
      <input type="text" size="50" name="address" id="address">
      


    
      <div class="d-grid gap-2">
  	<button class="btn btn-primary" type="button">가입하기</button>
		</div>
    </div>
  </form>


</body>
</html>
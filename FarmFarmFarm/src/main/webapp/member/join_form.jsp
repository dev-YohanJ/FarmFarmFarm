<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  2022년 8월 8일 10시 50분 작성.
 팜팜팜 회원가입 폼 css는 스타일에 포함되어있으며 
 제이쿼리와 validate_join 두가지 파일이 필요함.
 -->
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<style>

body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

select, input[type=text], input[type=password], input[type="button"] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
	outline: none;
	height: 40px;
}

select {
	padding: 10px 15px 10px 15px;
	vertical-align: bottom;
}

legend {
	text-align: center;
	font-size: 40px;
	font-weight: bold
}

 #post1 {
	width: 70%
}



#id+input, #post1+input {
	width: 29%;
	background: #4CAF50;
	line-height: 10px;
	vertical-align: bottom;
}



#domain {
	width: 23%
}
#email
{
	width: 39%
}


#sel {
	width: 30%;
	background: lightgray
}

.container2 {
	border: 1px solid lightgray;
	padding: 1.5% 1%;
	word-spacing: 10px;
	margin-bottom: 20px;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

input[type=button]:hover {
	opacity: 0.8;
	cursor: pointer
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

.cancelbtn {
	padding: 14px 20px;
	background-color: #f44336;
}

.cancelbtn, .signupbtn {
	float: left;
	width: 50%;
}

.container {
	padding: 16px;
}

#myform {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	width: 550px;
}

label {
	display: block;
	font-weight: bold;
}

img { display: block; margin: 0px auto; }
#bir_wrap {
    display: table;
    width: 100%;
}

#bir_yy {
    display: table-cell;
    width: 147px;
}

#bir_mm {
    display: table-cell;
    width: 147px;
    vertical-align: middle;
}

#bir_dd {
    display: table-cell;
    width: 147px;
}

#bir_mm, #bir_dd {
    padding-left: 10px;
}


</style>
<script src="jquery-3.6.0.cha js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 

<script src="validate_join.js"></script>


<body>


  <form name="myform" method="post" action="join_ok" 
         id="myform" >
  <div><img src="farm.png" alt="image_farm" style ="text-align : center;"></div>
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
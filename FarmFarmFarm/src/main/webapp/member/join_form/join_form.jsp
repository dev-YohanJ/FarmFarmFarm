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
	margin: 1px 0 5px 0;
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




#id+input, #post1+input, #email+input {
	width: 29%;
	background: #4CAF50;
	line-height: 10px;
	vertical-align: bottom;
}


#email
{
	width: 70%
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
<script src="jquery-3.6.0.cha.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 

<script src="validate_join.js"></script>

<script>

$(document).ready(function () {
	
	var checkid=false;
	var checkmail=false;
	
	

$('#id').focusout(function(){
	let userId = $('#id').val();
	console.log(userId);
	$.ajax({
		url : "${pageContext.request.contextPath}/id_check",
		type : "post",
		data : {userId : userId},
		dataType : 'json',
		success : function(result){
				if(result == 1){
					$("#checkId").html('사용할 수 없는 아이디입니다.');
					$("#checkId").attr('color','red');
					checkid =false;
					return;
				}else if(result ==0){
					$("#checkId").html('사용할 수 있는 아이디입니다.');
					$("#checkId").attr('color','green');
					checkid =true;
					return;
				}
			},//success
			error : function(){
				alert('서버요청 실패');
			}
		}) //ajax
	})

	
	//비밀번호 비교하는 펑숀
	
	$('.pw').focusout(function(){
	let pass1 = $('#pass').val();
	let pass2 = $('#pass2').val();
	
	if(pass1 != '' || pass2 != ''){
		if(pass1==pass2){
			$('#checkPw').html('비밀번호가 일치합니다.');
			$('#checkPw').attr('color','green');
		}else{
			$('#checkPw').html('비밀번호가 일치 하지 않습니다. 다시 재입력해주세요.');
			$('#checkPw').attr('color','red');
			
		}
	}
	
})



	
	
	
	
	$("#postcode").click(function(){
		
		var post = document.getElementById("address2");
		post.type = "text";
		$('#address2').val('');
		
		
	})
	
		$("#emailsend").click(function(){
		var emailhidden = document.getElementById("emailhidden");
		document.getElementById('email').readOnly =true;
		emailhidden.type = "text";
		$('#emailhidden').val('');
		
	})
	
	
	$('#emailsend').click(function(){
		var receiver = document.getElementById("emailhidden").value;
		var sender = "ogdream@naver.com";
		var subject = "회원가입 이메일 인증"
		var content = "안녕하세요. 팜팜팜 주식회사 입니다. "
		
	//1.이메일 인증번호 버튼을 클릭한다.
	//2.인증받을 메일의 값을 받고 클릭에서 내가 값을 지정해준것을 서블릿으로 넘긴다.
	//3.서블릿에서 메일 발송이 이뤄지고 그 랜덤 숫자값을 세션? 혹은 ? 무언가로 저장한다.
	//4.그 값을 ajax로 가져온다.?
	
		
		$.ajax({
			url : "${pageContext.request.contextPath}/email_confirm",
			type : "post",
			data : {receiver:receiver, sender:sender, subject:subject, content:content},
			dataType : 'json',
			success : function(result){
				alert('성공성공');
				console.log('성공')
					
				},//success
				error : function(){
					alert('서버요청 실패');
				}
			}) //ajax
		
		
	})
	
	
	$("input:eq(6)").on('keyup',
			function(){
			$("#email_message").empty();
			//[A-Za-z0-9]와 동일한것이 \w입니다.
			//+는 1회 이상 반복을 의미하고 {1,}와 동일합니다
			//\w+는 [A-Za-z0-9_]를 1개이상사용하라는 의미입니다.
			var pattern = /^\w+@\w+[.]\w{3}$/;
			var email = $("input:eq(6)").val();
			
			if(!pattern.test(email)){
				$("#email_message").css('color','red').html("이메일 형식에 맞지 않아요");
				checkmail=false;
				//btn = document.getElementById('emailsend');
				//btn.disabled = 'disabled';
		
				return;
				
				
			}else{
				$("#email_message").css('color','green').html("이메일 형식에 맞아요. 이메일 인증을 진행해주세요.");
			
				//btn = document.getElementById('emailsend');
				//btn.disabled = 'false';
				checkmail=true;
				//버튼이 안먹힘.
			}
		});//이메일 키업이벤트 끝
		
		//문제가 이메일 위에서 if else 에서 비
		//function doAction(){
		//	
		//	if(checkmail){
		//		btn = document.getElementById('emailsend');
		//		btn.disabled = 'disabled';
		//	}
		//		
		//	
	//	}
		
	
	
	
	
})//다큐먼트 펑션 끝


</script>

<body>


  <form name="myform" method="post" action="join_ok" 
         id="myform" >
  <div><img src="farm.png" alt="image_farm" style ="text-align : center;"></div>
    <div class="container">
     <div><h3>회원 정보를 입력해주세요.</h3></div>
 
       <label for="id">ID</label>
       <div>
        <input type="text" placeholder="영문자 숫자로 5~12자로 아이디를 생성하세요" name="id" id="id" >      
        <font id = "checkId" size ="2"></font>  
        <span id = "message"></span> 
       </div>
       
       <label for="pass">Password</label>
       <input type="password" placeholder="비밀번호를 입력하세요." name="pass" id="pass" class="pw">
       <input type="password" placeholder="비밀번호를 재입력하세요." name="pass2" id="pass2" class="pw">
       <font id ="checkPw" size="2"></font>
       <label for="pass">이름</label>
        <input type="text" placeholder="이름을 입력하세요." name="personname" id="personname" >
         <label for="pass">휴대폰 번호</label>
        <input type="text" placeholder="휴대폰 번호를 입력하세요" name="phonenumber" id="phonenumber" >
         
          
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
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>                                    
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                    
                                </select>
                            </span>
                        </div>

                    </div>
                    <span class="error_next_box"></span>    
                </div>

       
      
      
      <label for="email">E-Mail</label>
      <input type="text"  name="email" id="email" placeholder="이메일을 입력하세요"> 
      <input type="button" value="인증번호전송" id="emailsend">
      <span id = "email_message"></span> 
      <input type="hidden" size="50" name="address" id="emailhidden" placeholder="이메일 인증번호를 입력하세요.">
      
     
      <div class="address">
      <label for="post1">주소</label>
      <input type="text" size="5" maxLength="5" name="post1" id="post1" readOnly> 
      <input type="button" value="우편검색" id="postcode">
      
      <label for="address"></label>
      <input type="text" size="50" name="address" id="address" readOnly>
      <input type="hidden" size="50" name="address" id="address2" placeholder="상세주소">
      
      </div>


    
      <div class="d-grid gap-2">
  	<button class="btn btn-primary" type="button">가입하기</button>
		</div>
    </div>
  </form>


</body>
</html>
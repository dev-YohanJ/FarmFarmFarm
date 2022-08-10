<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>쿠키를 이용한 화면 설정 예제</title>
<style>
img{ display : block; margin : auto;  top : 300px;}
a{
text-decoration :none;
color: green;
}
</style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="<%=request.getContextPath()%>/css/join.css" rel="stylesheet" type="text/css">

                    
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
<script>
$(function(){
	
	var checkid=false;
	var checkmail=false;
	
		$("input:eq(6)").on('keyup',
			function(){
			$("#email_message").empty();
			//[A-Za-z0-9]와 동일한것이 \w입니다.
			//+는 1회 이상 반복을 의미하고 {1,}와 동일합니다
			//\w+는 [A-Za-z0-9_]를 1개이상사용하라는 의미입니다.
			var pattern = /^\w+@\w+[.]\w{3}$/;
			var email = $("input:eq(6)").val();
			if(!pattern.test(email)){
				$("#email_message").css('color','red').html("이메일 형식에맞지 않아요");
				checkmail=false;
				
			}else{
				$("#email_message").css('color','green').html("이메일 형식에 맞아요");
				checkmail=true;
			}
		});//이메일 키업이벤트 끝
			

		$('form').submit(function(){
			if(!$.isNumeric($("input[name='age']").val())){
				alert("나이는 숫자를 입력하세요");
				$("input[name='age']").val('').focus();
				//val()	이렇게 하면 어떻게 되었더라?
				return false;
			}
			
			if(!checkid){
				alert("사용 가능한 id로 입력하세요");
				$("input:eq(0)").val('').focus();
				return false;
			}
		
			
			if(!checkemail){
				alert("이메일 형식을 확인하세요");
				$("input:eq(6)").focus();
				return false;
			}
		})// 폼 서브미트 끝.
		
	
		$("input:eq(0)").on('keyup',
		function(){
			
			$("#message").empty();//처음에 패턴에 적합하지 않은 경우 메세지 출력 후 적합한 데이터를 입력해도
			//계속 같은 데이터를 출력하므로 이벤트 시작할때마다 비워둡니다.????
			//[A-Za-z0-9_]의 의미가 \w
			var pattern = /^\w{5,12}$/;
			var id =$("input:eq(0)").val();
			if(!pattern.test(id)){
			
				$("#message").css('color','red').html("영문자 숫자_로 5~12자 가능합니다.");
				checkid=false;
				return;
			}
		
			$.ajax({
				url : "idcheck.net",
				//왜 이게 이상한것 같지? 요청할곳인데
				//이게 파일명으로 구체적으로 만들어져 있지 않아 어떤 형태인지 모르겠다
				//이것은 컨트롤러에서 구분되기만하지 구체적으로 이 파일은 체크넷입니다
				//라는것은 없고 memberidcheack.java만 보인다.
			
				data : {"id" : id},
				//// 서버에 요청 시 전송할 파라미터를 기입합니다. (key / value 형식의 객체)
					//내가 인터넷에 입력한값이 전달이 됨. 확인이 가능함.
				
				//result로 저장된것인데 그것이 반환형이 int
				//	int result = -1; //db에 해당값이 없습니다.
				//받은 데이터가 resp로 가는것은 알겠는데 위의 data는 뭐였지?
				//data???
				success : function(resp){ 
					if(resp == -1){//db에 해당id가 없는 경우
					$("#message").css('color','green').html('사용 가능한 아이디 입니다');
					checkid =true;
					//아이디를 맞게 틀리고 맞게 틀리고 하는 경우 html메세지가 늘어나야할것 같은데
					//왜 나온자리에 중복이없고 정상적일까?
						
				}else{//db에 id가 있는 경우(0)
				$('#message').css('color','blue').html("사용중인 아이디 입니다.");
				checkid=false;
				}
			},
				
		})//ajax끝
	});//id keyup end
});//펑션끝


</script>

	
</head>
<body>

	<form name = "joinform" action="joinProcess.net" method="post"> 
	<div><img src="../image/farm.png" alt="image_farm" style ="text-align : center;"></div>
	<hr>
	<b>아이디</b>
	<input type="text" name="id" placeholder="Enter id" required maxLength="12">
	<span id = "message"></span>
	
	
	<b>비밀번호</b>
	<input type="password" name="pass" placeholder="Enter password" required>
	
	<b>이름</b>
	<input type="text" name="name" maxLength ="5" placeholder="Enter name" required>

	<b>나이</b>
	<input type="text" name="age" maxLength ="2" placeholder="Enter age" required>
	
	<label for="1">
	<b>이메일주소</b>
	<input type="text" name="email" placeholder="Enter email" maxLength="30" required >
	<span id="email_message"></span>
	<input type="text" name="age" maxLength ="2" placeholder="Enter age" required>
	</label>
	<div class="d-grid gap-2">
  	<button class="btn btn-primary" type="button">가입하기</button>
		</div>
		
		<a href="#">아이디 혹은 비밀번호를 잊으셨습니까?</a>
        </form>
</body>
</html>

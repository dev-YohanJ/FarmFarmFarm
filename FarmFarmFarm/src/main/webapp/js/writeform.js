
$(document).ready(function(){
	


$("#upfile").change(function(){
	console.log($(this).val().split('\\'));
	//http://localhost:8088/Board_Ajax/BoardWrite.bo
	//(3) ['C:', 'fakepath', 'attach.png'] 콘솔창
	// '\\' 했다... C:\fakepath\attach.png 이것을 스플릿한거임...
	
	
	var inputfile = $(this).val().split('\\');
	$("#filevalue").text(inputfile[inputfile.length - 1]);
	
	
});


//submit버튼 클릭할때 이벤트 부분
$("form[name=boardform]").submit(function(){
	//펑션 잘안닫음.
	
	if($.trim($("#board_pass").val())==""){
		alert("비밀번호를 입력하세요");
		$("#board_pass").focus();
		return false;
		
	}
	
		if($.trim($("#board_subject").val())==""){
		alert("제목 입력하세요");
		$("#board_subject").focus();
		return false;
		
	}
		if($.trim($("#board_content").val())==""){
		alert("내용 입력하세요");
		$("#board_content").focus();
		return false;
		
	}
	
	
	
	
	
	
	
	
	
})//submit 부분




})//document.ready end;





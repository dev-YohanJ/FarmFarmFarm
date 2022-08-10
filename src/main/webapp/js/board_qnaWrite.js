function go(page) {
   var limit = $('#viewcount').val();
   var data = "limit=" + limit + "&state=ajax&page=" + page;
   ajax(data);
}

//총 2페이지 페이징 처리된 경우
//이전 1 2 다음
//현재 페이지가 1페이지인 경우 아래와 같은 페이징 코드가 필요
//<li class="page-item"><a class="page-link gray">이전&nasp;</a></li>
//<li class="page-item active""><a class="page-link">1</a></li>
//<li class="page-item"><a class="page-link" href="javascript:go(2)">2</a></li>
//<li class="page-item"><a class="page-link" href="javascript:go(2)>다음&nasp;</a></li>

//현재 페이지가 2페이지인 경우 아래와 같은 페이징 코드가 필요
//<li class="page-item"><a class="page-link href="javascript:go(1)">이전&nasp;</a></li>
//<li class="page-item"><a class="page-link" javascript:go(1)>1</a></li>
//<li class="page-item active"><a class="page-link"">2</a></li>
//<li class="page

function setPaging(href, digit){
   active="";
   gray="";
   if(href=="") { //href가 빈문자열인 경우
      if(isNanN(digit)){//이전&nbsp; 또는 다음&nbsp;
         gray=" gray";
      }else{
         active=" active";
      }
   }
   var output = "<li class='page-item" + active + "'>";
   var anchor = "<a class='page-link" + gray + "'" + href + ">"+ digit + "</a></li>";
   output += anchor;
   return output;
}

function ajax(sdata) {
   console.log(sdata)
   
   $.ajax({
      type : "POST",
      data : sdata,
      url : "QnaList.bo",
      dataType : "json",
      cache : false,
      success : function(data) {
         $("#viewcount").val(data.limit);
         $("table").find("font").text("글 개수 : " + data.listcount);
         
         if (data.listcount > 0) { // 줄갯수가 0보다 큰 경우
            $("tbody").remove();
            var num = data.listcount - (data.page -1) * data.limit;
            console.log(num)
            var output = "<tbody>";
            $(data.qnalist).each(
               function(index, item) {
                  output += '<tr><td>' + (num--) + "</td>"
                  blank_count = item.qna_re_lev * 2 + 1;
                  blank = '&nbsp;';
                  for (var i = 0; i < blank_count; i++) {
                     blank += '&nbsp;&nbsp;';
                  }
                  img="";
                  if (item.qna_re_lev > 0) {
                     img="<img src='img/line.gif'>";
                  }
                  
                  var subject=item.qna_subject;
                  if(subject.length>=20){
                     subject=subject.substr(0,20) + "...";//0부터 20개 부분 문자열 추출
                  }
                  
                  output += "<td><div>" + blank + img
                  output += '<a href="QnaDetailAction.bo?num=' + item.qna_num + '">'
                  output += subject.replace(/</g, '&lt;').replace(/>/g, '&gt;')
                          + '</a>[' + item.cnt + ']</div></td>'
                  output +=  '<td><div>' + item.qna_name+'</div></td>'
                  output +=  '<td><div>' + item.qna_date+'</div></td>'
                  output +=  '<td><div>' + item.qna_readcount
                        + '</div></td></tr>'
               })
         output += "</tbody>"
         
         console.log(output);
         
         $('table').append(output)//table 완성
         
         }//if(data.listcount)>0 end
         
      }, //success end
      error : function() {
         console.log('에러')
      }
   })// ajax end
} // function ajax end

$(function() {
   $("section button").click(function(){
      location.href="QnaWrite.bo";
   })
   
   $("#viewcount").change(function() {
	  console.log('viewcount')
      go(1);//보여줄 페이지를 1페이지로 설정합니다.
   });// change end
   
})
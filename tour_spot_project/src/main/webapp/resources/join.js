/**
 * 
 */
 //json 객체 전송
 //{"id":"2507995100","kakao_account":{"profile":{"nickname":"???","profile_image_url":"http://k.kakaocdn.net/dn/bc0AcC/btqLFKE17Il/gFp7gI5BJwWPvkK3LZNFG0/img_640x640.jpg"},"email":"yousd179@naver.com","has_email":true}}
//아이디 중복검사
$('#join_id').keyup(()=>{
    let test = getTypingText();
    checkID(test);
});


function getTypingText(){
   return $('#join_id').val();
}
$('')
function checkID(text){
	console.log(typeof text);
    $.ajax({
        method:"POST",
        url : '/tour_spot_project/join/check',
        data : {
			id : `${text}`
		}		
		}).done(e=>{
        console.log(e);
    })
}

$('.addr_search_button').on('click',function(event){
    event.preventDefault();
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
});
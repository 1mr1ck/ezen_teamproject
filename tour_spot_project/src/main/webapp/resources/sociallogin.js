/**
 * 
 */
function getToken(){
	location.href = "https://kauth.kakao.com/oauth/authorize?client_id=f17145af917afa076cf92e7f58096053&redirect_uri=http://localhost:8081/tour_spot_project/KakaoControllar&response_type=code";	
}
//<<page-5  클릭시 해당 페이지수 소환 page+5>>
// addLision(load(),function(),{once,true})<< 
// 테이블 다 불러와서 히든처리

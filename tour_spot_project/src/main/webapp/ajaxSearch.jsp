<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ajax이용 Search기능 Test</title>
	<script type="text/javascript">
		
		var xhr;
		
		function startAjax() {
			var address = document.getElementById("map_addr");
			
			if(address === "") {
				alert("주소를 입력해주세요.");
				return; // 함수 실행 중단
			}
			
			// XMLHttpRequest : ajax를 위한 javascript 객체
			xhr = new XMLHttpRequest();
			
			// callback함수 등록 (서버가 응답하면 실행될 함수를 등록)
			xhr.onreadystatechange = callback;
			
			// 요청 시, get방식으로 "FindAddrAjaxServlet"으로
			// address를 전송한다.
			xhr.open("get", "FindAddrAjaxServlet?userId=" + address.value);
			xhr.send(null); // post방식일 때, 사용하는 메서드
		}
		
		// 서버가 응답하면 실행되는 함수
		function callback() {
			// readyState = 4 : 응답 완료
			// status = 200 : 정상수행
			if (xhr.readyState == 4 && xhr.status == 200){
				var info = xhr.responseText;
				
				// span 영역에 결과값 보여주기
				document.getElementById("result").innerHTML = "<font color=blue>" + info + "</font>";
			} else if (xhr.readyState < 4) {
				document.getElementById("result").innerHTML = "<font color=green>" + "응답 대기 중" + "</font>";
			}
		}
	
	</script>
</head>
<body>
	
</body>
</html>

// const REDIRECT_URI = 'http://localhost:8080/tour_spot_project/login';

// //<!--9b047ab7a3479c0c116c4327b5374bcc-->
// function login(){
//     Kakao.init('9b047ab7a3479c0c116c4327b5374bcc');
//     Kakao.Auth.authorize({
//         redirectUri: `${REDIRECT_URI}`,
//         prompts: 'login',
//     });
// }

const body = document.body;
const kakaoLogin = body.querySelector('.kakaoLogin');

kakaoLogin.addEventListener('click',function(){
    Kakao.init('9b047ab7a3479c0c116c4327b5374bcc');
    
});
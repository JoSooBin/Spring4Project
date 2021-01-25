//jquery로 이벤트 추가하기: $(대상).on(이벤트종류,function() { } );
//agree
$('#okagree').on('click',function () {
    if(!$('#agree1').is(':checked'))
       alert('이용약관에 동의하세요');
    else if(!$('#agree2').is(':checked'))
        alert('개인정보 활용에 동의하세요');
    else
        location.href = '/join/checkme'; });//동의 함

$('#noagree').on('click',function () {
    location.href = '/index'; });//동의하지 않음

//checkme
$('#check2btn').on('click', function () {
    if($('#name2').val()=='') alert('이름을 입력하세요');
    else if($('#jumin1').val()=='') alert('주민번호 앞자리를 입력하세요');
    else if($('#jumin2').val()=='') alert('주민번호 뒷자리를 입력하세요');
    else if(!$('#usejm').is(':checked')) alert('주민등록번호 처리에 동의해주세요');
    else location.href='/join/joinme?name='+ $('#name2').val() + '&jumin1=' + $('#jumin1').val() + '&jumin2=' + $('#jumin2').val();
    //결과: /join/joinme?name=이름&jumin=주민번호
}); //실명확인하기

$('#cancel2btn').on('click', function () {
    if(confirm('정말로 취소하시겠습니까?'))
        location.href='/index';
}); //실명확인취소하기


//joinme
$('#joinbtn').on('click', function () {
    if($('#newuid').val()=="") alert('아이디를 입력하세요');
    else if($('#newpwd').val()=="") alert('비밀번호를 입력하세요');
    else if($('#repwd').val()=="") alert('비밀번호를 다시 한 번 입력하세요');
    else if($('#repwd').val() != $('#newpwd').val()) alert('비밀번호가 서로 일치하지 않아요');

    //else if($('#zip1').val()=="" || $('#zip2').val()=="" || $('#addr1').val()=="") alert('우편번호를 검색하세요');
    else if($('#addr2').val()=="") alert('상세주소를 입력하세요');

    //else if($('#email1').val()=="" || $('#email2').val()=="") alert('이메일을 입력하세요');
    else if($('#hp2').val()=="" || $('#hp3').val()=="") alert('전화번호를 입력하세요');

    else {
            //분리된 데이터 합치기
            $('#jumin').val($('#jumin1').val() + '-' + $('#jumin2').val())
            $('#zipcode').val($('#zip1').val() + '-' + $('#zip2').val())
            $('#email').val($('#email1').val() + '@' + $('#email2').val())
            $('#phone').val($('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val())

            $('#joinfrm').attr('action', '/join/joinme');
            $('#joinfrm').attr('method', 'post');
            $('#joinfrm').submit();
    }

}); //가입 하기

$('#cancelbtn').on('click', function () {
    if(confirm('정말로 취소하시겠습니까?'))
        location.href='/index';
}); //가입 취소하기
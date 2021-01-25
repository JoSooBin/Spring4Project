//jquery로 이벤트 추가하기: $(대상).on(이벤트종류,function() { } );
//agree
$('#okagree').on('click',function () {
    if(!$('#agree1').is(':checked'))
       alert('이용약관에 동의하세요');
    else if(!$('#agree2').is(':checked'))
        alert('개인정보 활용에 동의하세요');
    else
        location.href = '/join/checkme'; });//동의 함
$('#noagree').on('click',function () { location.href = '/index'; });//동의하지 않음
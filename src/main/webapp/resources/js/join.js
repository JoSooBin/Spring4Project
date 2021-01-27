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

    else if($('#zip1').val()=="" || $('#zip2').val()=="" || $('#addr1').val()=="") alert('우편번호를 검색하세요');
    else if($('#addr2').val()=="") alert('상세주소를 입력하세요');

    else if($('#email1').val()=="" || $('#email2').val()=="") alert('이메일을 입력하세요');
    else if($('#hp2').val()=="" || $('#hp3').val()=="") alert('전화번호를 입력하세요');
    else if( grecaptcha.getResponse() == "") alert("자동가입방지 확인 필요!");

    else {
            //alert(grecaptcha.getResponse());
            //구글 recaptcha 코드확인

            //분리된 데이터 합치기
            $('#jumin').val($('#jumin1').val() + '-' + $('#jumin2').val())
            $('#zipcode').val($('#zip1').val() + '-' + $('#zip2').val())
            $('#email').val($('#email1').val() + '@' + $('#email2').val())
            $('#phone').val($('#hp1').val() + '-' + $('#hp2').val() + '-' + $('#hp3').val())

            //recaptcha 코드 유효성 검사를 위한 변수값 설정
            $('#g-recaptcha').val(grecaptcha.getResponse() )

            $('#joinfrm').attr('action', '/join/joinme');
            $('#joinfrm').attr('method', 'post');
            $('#joinfrm').submit();
    }

}); //가입 하기

$('#cancelbtn').on('click', function () {
    if(confirm('정말로 취소하시겠습니까?'))
        location.href='/index';
}); //가입 취소하기


//우편번호 처리
$('#findbtn').on('click',function () {
    $.ajax({
        url: '/join/zipcode',
        type: 'GET',
        data: {dong: $('#dong').val()}
    })
        .done(function (data){
            //서버로 넘어온 데이터는 JSON형식이므로
            //출력시 Object로 보여짐
            //alert(data);
            let opts = "";
            $.each(data, function(){ //행 단위 반복처리
                let zip = "";
                $.each(this, function (k, v) { //열 단위 반복처리
                    if(v !== null) zip += v + " ";
                });
                opts += '<option>' + zip + '</option>';
            });
            //기존 option태그 제거
            $('#addrlist').find("option").remove();
            //새로만든 option 태그를 추가함
            $('#addrlist').append(opts);
        })
        .fail(function(xhr, status, error){
            alert(xhr.status, + "/" + error)

    });
});

//우편번호 보내기
$('#sendbtn').on('click', function (){
    let addr = $('#addrlist option:selected').val();

    if(addr == undefined) {
        alert('주소를 선택하세요!!!');
        return;
    }
    //주소를 선택하지 않고 버튼을 클릭하는 경우

   let addrs = addr.split(' ');  //선택한 주소를 공백으로 나눔

    //분리된 주소를 지정한 위치로 보냄
    //우편번호는 -로 분리해서 zip1, zip2에 보냄
    //우편번호 예시: 132-456
    $('#zip1').val(addrs[0].split('-')[0]);
    $('#zip2').val(addrs[0].split('-')[1]);

    //공백으로 분리한 나머지 주소 중 '시,구,동'을 addr1으로 보냄
    let addr1 = addrs[1] + ' ' + addrs[2] + ' ' + addrs[3];
    $('#addr1').val(addr1);

    //기존 검색 결과 제거
    $('#addrlist').find("option").remove();
    $('#dong').val('');

    //우편번호 검색창 닫음
    $('#zipmodal').modal('hide');
});

//우편번호 모달창 x 버튼 클릭 처리
$('#modalx').on('click', function (){

    //기존 검색 결과 제거
    $('#addrlist').find("option").remove();
    $('#dong').val('');
    //우편번호 검색창 닫음
    $('#zipmodal').modal('hide');
})


//이메일 처리
//option:select -> select 요소들 중 선택한 객체를 알아냄
//선택한 객체.text() : 태그 사이이의 문자열
//선택한 객체.val() : 태그의 value 속성 값을 의미
$('#email3').on('change', function(){
    let val = $('#email3 option:selected').text();

    if(val == '직접 입력하기')
        $('#email2').attr('readonly', false); //readonly 속성 해제
    else{
            $('#email2').attr('readonly', true); //readonly 속성 설정
            $('#email2').val(val);
    }
});

//아이디 중복체크
$('#newuid').on('blur',function(){checkuid(); });
$('#newuid').on('focus',function(){
    $('#uidmsg').text("7~16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다");
    $('#uidmsg').attr('style', 'color: red !important');    });

function checkuid(){
    let uid = $('#newuid').val().trim();
    if(uid == ''){
        $('#uidmsg').text("7~16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다");
        return;
    }

    $.ajax({ url: '/join/checkuid',
        type:'GET',
        data: { uid: uid } })
        //비동기 요청 설정

        .done(function (data){
            let msg = ' 사용 불가 아이디입니다!!';
            if (data.trim() == '0') {
                msg = ' 사용 가능 아이디 입니다!!';
                $('#uidmsg').attr('style', 'color: blue !important');
            }
            $('#uidmsg').text(msg);
        }) //비동기 요청 성공시

        .fail(function (xhr, status, error){
            alert(xhr.status,+ "/" + error);
        });//비동기 요청 실패시
}

//joinok
$('#go2index').on('click', function () {
    location.href = '/index';
});
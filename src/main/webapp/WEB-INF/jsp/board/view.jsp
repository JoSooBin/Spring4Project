<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%--줄바꿈 문자를 newChar변수에 저장--%>
<%--<% String newChar = "블라블라"; %>--%>
<%--<c: set var="newChar" value="블라블라" />--%>
<%--JSP 객체의 생존 기간 : scope--%>
<%--page : 현재페이지내에서만 객체 사용--%>
<%--requset : 이전 페이지(폼)에서 생성한 객체를 현재페이지(처리)에 요청을 통해 사용--%>
<%--session : 동일 브라우져내에서 공유할 수 있는 객체--%>
<%--application : 어플리케이션(프로젝트) 내에서 공유할 수 있는 객체 --%>
<c:set var="newChar" value="
" scope="application"/>


<div id = "main">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i>게시판</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-6 ">
            <button type="button" id="prevbtn" class="btn btn-light">
                <i class="bi bi-chevron-left bidragup"></i>이전게시물</button>

            <button type="button" id="nextbtn" class="btn btn-light">
                <i class="bi bi-chevron-right bidragup"></i>다음게시물</button>
        </div>
        <div class="col-6 text-right">
                <button type="button" id="newbd" class="btn btn-light">
                    <i class="bi bi-plus-circle-fill bidragup"></i>새글쓰기</button>
        </div>
    </div><!--버튼들-->

    <div class="row margin1050">
        <table class="table">
            <tr><th colspan="2" class="tblines2 tbbg1">
                <h2>${bd.title}</h2></th></tr><!--제목-->
            <tr class="tbbg2"><td>${bd.userid}</td>
                <td class="text-right">${bd.regdate} / ${bd.thumbs} / ${bd.views}</td></tr><!--작성자,작성일,조회수-->
            <tr><td colspan="2" class="tbbg3 tblines2">
                ${fn:replace(bd.contents, newChar, "<br>")}
            </td></tr><!--본문-->
        </table>
    </div><!--본문글-->

    <div class="row margin1050">
        <div class="col-6 ">
            <!--로그인 했고, 이 글이 내가 작성한 글이라면 버튼들이 보임-->
            <c:if test="${not empty UID and UID eq bd.userid}"><!--empty가 비어있지 않고 UID가 bd.userid와 같을 때-->
                <button type="button" id="upbdbtn" class="btn btn-warning">
                    <i class="bi bi-pencil-square bidragup"></i>수정하기</button>

                <button type="button" id="rmbdbtn" class="btn btn-danger">
                    <i class="bi bi-trash-fill bidragup"></i>삭제하기</button>
            </c:if>
        </div>
        <div class="col-6 text-right">
            <c:if test="${not empty UID }">
            <button type="button" id="thumbbtn" class="btn btn-success">
                <i class="bi bi-hand-thumbs-up bidragup"></i>추천하기
            </button>
            </c:if>

            <button type="button" id="listbdbtn" class="btn btn-dark">
                <i class="bi bi-card-list bidragup"></i>목록으로</button>
        </div>
    </div><!--버튼들-->

    <input type="hidden" id="bno" value="${param.bno}">
    <input type="hidden" id="cp" value="${param.cp}">
    <input type="hidden" id="userid" value="${bd.userid}">

    <div class="row margin1050" style="margin-top: 100px;">
        <h3><i class="bi bi-chat-square-dots-fill bidragup"></i>나도 한마디</h3>
        <table class="table tblines tbwide">
            <tr><td><h4>JSB</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-25 15:15:15</div>
                    <p>Donec in urna et mi lacinia fermentum ut et dui. Vivamus mattis, justo ut tristique facilisis, urna velit convallis sem, ut vestibulum diam dolor at mauris.</p>
                    <ul class="list-unstyled"><!--댓글의 댓글-->
                        <li>
                            <div class="cmtbg2"><sapn class="h4">JSB</sapn></div>
                            <span class="pushright">2021-01-30 16:16:16</span>
                            <p> Vestibulum suscipit, dolor vel aliquet egestas, erat ipsum aliquet neque, ut euismod arcu sapien id libero.
                            </p>
                        </li>
                    </ul>
                </td></tr>
            <tr><td><h4>JSB</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-25 15:15:15</div>
                    <p>Donec in urna et mi lacinia fermentum ut et dui. Vivamus mattis, justo ut tristique facilisis, urna velit convallis sem, ut vestibulum diam dolor at mauris.</p>
                </td></tr>
            <tr><td><h4>JSB</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-25 15:15:15</div>
                    <p>Donec in urna et mi lacinia fermentum ut et dui. Vivamus mattis, justo ut tristique facilisis, urna velit convallis sem, ut vestibulum diam dolor at mauris.</p>
                </td></tr>
            <tr><td><h4>JSB</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-25 15:15:15</div>
                    <p>Donec in urna et mi lacinia fermentum ut et dui. Vivamus mattis, justo ut tristique facilisis, urna velit convallis sem, ut vestibulum diam dolor at mauris.</p>
                </td></tr>
        </table>
    </div>



    <div class="row margin1050">
        <form id="replyfrm" class="card card-body bg-light ">
            <div class="form-group row justify-content-center">
                <label class="pushtop50 text-primary font-weight-bold" >로그인하세요</label>&nbsp;
                <textarea id="comment" row="5" class="form-control col-7"></textarea>&nbsp;
                <span><button id="bdcmtbtn" class="btn btn-dark pushtop50">
                        <i class="bi bi-chat-text-fill bidragup"></i> 댓글쓰기</button></span>
            </div>
        </form>
    </div><!--댓글폼-->
</div>
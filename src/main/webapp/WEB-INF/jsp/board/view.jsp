<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <button type="button" id="newbdbtn" class="btn btn-light">
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
                ${bd.contents}
            </td></tr><!--본문-->
        </table>
    </div><!--본문글-->

    <div class="row margin1050">
        <div class="col-6 ">
            <button type="button" id="updbtn" class="btn btn-warning">
                <i class="bi bi-pencil-square bidragup"></i>수정하기</button>

            <button type="button" id="rmbdbtn" class="btn btn-danger">
                <i class="bi bi-trash-fill bidragup"></i>삭제하기</button>
        </div>
        <div class="col-6 text-right">
            <button type="button" id="listbdbtn" class="btn btn-light">
                <i class="bi bi-card-list bidragup"></i>목록으로</button>
        </div>
    </div><!--버튼들-->

    <div class="row margin1050" style="margin-top: 100px;">
        <h3><i class="bi bi-square-dots-fill bidragup"></i>나도 한마디 </h3>
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
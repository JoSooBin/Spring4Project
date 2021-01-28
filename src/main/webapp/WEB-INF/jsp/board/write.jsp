<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id = "main">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i>게시판 </h3>
        <hr>
    </div>

    <form id="newbdfrm">
        <div class="row margin1050">
            <div class="col-6">
                <h4><i class="bi bi-plus-circle-fill bidragup"></i> 새글쓰기</h4>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="listbdbtn" class="btn btn-light"><i class="bi bi-card-list bidragup"></i>목록으로</button>

            </div>
        </div><!--상단버튼-->

        <div class="card card-body bg-light margin1050">
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">제목</label>
                <input type="text" id="title" name="title" class="form-control col-9">
            </div>
            <div class="form-group row">
                <label for="uid" class="col-form-label col-2 text-right">작성자</label>
                <input type="text" id="uid" name="userid" class="form-control col-9" readonly>
            </div>
            <div class="form-group row">
                <label for="contents" class="col-form-label col-2 text-right">본문내용</label>
                <textarea type="text" id="contents" name="contents" class="form-control col-9" rows="15"></textarea>
            </div>
            <div class="row">
                <label class="col-2 text-right">자동가입방지</label>
                <img src="../../img/google_recaptcha.gif" width="40%" height="40%" style="margin-left: -3px;">
            </div>
        </div><!--새글쓰기 폼-->

        <div class="row margin1050">
            <div class="col-12 text-center">
                <button type="button" id="newbdbtn" class="btn btn-primary"><i class="bi bi-check"></i>입력완료</button>
                <button type="button" id="cancelbtn" class="btn btn-danger"><i class="bi bi-x"></i> 취소하기</button>
            </div>
        </div>
    </form>

    <footer class="row margin30">
        <div class="col text-right fatdiv bg-light">
            <h6>Copyright &copy; Lorem Ipsum 2021. All Right Reserved. Created By Bootstrap4</h6>
        </div>
    </footer>
</div>
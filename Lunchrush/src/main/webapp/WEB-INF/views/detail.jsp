<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jonghwee
  Date: 2022/09/25
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>상세보기</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
    html, body{width: 100%; height: 100%; color: #198754; font-size: 14px; letter-spacing: -0.5px; font-family: 'Noto Sans', sans-serif;}
    .container-md{
        position: relative;
        display: grid;
        align-items: center;
        vertical-align: middle;
        margin-top: 20%;
        width: 70%;
        overflow: hidden;
    }
    .btnGroup{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .btn{
        margin: 10px;
    }
    .mb-3 {
        text-align: center;
    }
    table{
        margin: auto;
        border: #0e0f11;
    }
    img{
        max-width: 50%;
        height: auto;
        display: block;
    }
    h3{
        text-align: center;
        padding-bottom: 20px;
        color: #474a5c;
    }
    .form-control-plaintext-content{
        padding-top: 20px;
        color: #000000;
        text-align: left;
        /*font-size: 20px;*/
    }
</style>
<script type="text/javascript">
    $(function(){
        $("#updateBtn").on("click", function (){
            $("#tableForm").attr("action","${pageContext.request.contextPath}/updateForm");
            $("#tableForm").submit();
        })

        $("#deleteBtn").on("click",function (){
            let really = confirm("정말로 삭제하시겠습니까?");

            if(really){
                $("#tableForm").attr("action","${pageContext.request.contextPath}/delete");
                $("#tableForm").submit();
            }
        })
    })
</script>
<body>
<div class="container-md">
<section>
    <form method="post" id="tableForm" class="form" enctype="multipart/form-data">
        <table class="table table-sm">
            <input type=hidden name="boardNo" value="${lunchrush.boardNo}">
            <tr>
                <h3>< ${lunchrush.placeName} ></h3>
            </tr>
            <tr>
                <div class="mb-3 row">
                    <label for="date" class="col-sm-2 col-form-label">날짜</label>
                    <div class="col-sm-10">
                        <span class="form-control-plaintext" id="date">${lunchrush.date}</span>
                    </div>
                </div>
            </tr>
            <tr>
                <div class="mb-3 row">
                    <label for="placeName" class="col-sm-2 col-form-label">식당 이름</label>
                    <div class="col-sm-10">
                        <span class="form-control-plaintext" id="placeName">${lunchrush.placeName}</span>
                    </div>
                </div>
            </tr>
            <tr>
                <div class="mb-3 row">
                    <label for="address" class="col-sm-2 col-form-label">위치</label>
                    <div class="col-sm-10">
                        <span class="form-control-plaintext" id="address">${lunchrush.address}</span>
                    </div>
                </div>
            </tr>
            <tr>
                <div class="mb-3 row">
                    <label for="lunchLeader" class="col-sm-2 col-form-label">당번</label>
                    <div class="col-sm-10">
                        <span class="form-control-plaintext" id="lunchLeader">${lunchrush.lunchLeader}</span>
                    </div>
                </div>
            </tr>
            <tr>
                <div class="mb-3 row">
                    <label for="score" class="col-sm-2 col-form-label">점수</label>
                    <div class="col-sm-10">
                        <span class="form-control-plaintext" id="score">${lunchrush.score}</span>
                    </div>
                </div>
            </tr>
            <tr>
                <div class="mb-3 row">
                    <label for="content" class="col-sm-2 col-form-label">내용</label>
                    <div class="col-sm-10" id="content">
                        <c:if test="${lunchrush.image != null}" >
                            <img src="${pageContext.request.contextPath}/img/${lunchrush.image}" class="rounded float-start">
                        </c:if>
                        <div class="form-control-plaintext-content">${lunchrush.content}</div>
                    </div>
                </div>
            </tr>
            <div class="btnGroup">
                <input type="button" id="updateBtn" class="btn btn-outline-warning" value="수정하기">
                <input type="button" id="deleteBtn" class="btn btn-outline-danger" value="삭제하기">
                <input type="button" id="listBtn" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/list'" value="목록보기">
            </div>
        </table>
    </form>
</section>
</div>
</body>
</html>

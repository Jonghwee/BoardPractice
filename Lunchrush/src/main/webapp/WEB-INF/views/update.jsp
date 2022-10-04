<%--
  Created by IntelliJ IDEA.
  User: jonghwee
  Date: 2022/09/25
  Time: 11:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정하기</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
    html, body{width: 100%; height: 100%; color: #198754; font-size: 14px; letter-spacing: -0.5px; font-family: 'Noto Sans', sans-serif;}

    .container-md{
        margin-top: 20%;
    }
    table{
        justify-content: center;
        align-items: center;
    }
    .btn{
        margin: 10px;
    }
    .btnGroup{
        display: flex;
        align-items: center;
        justify-content: center;
    }
</style>
</head>
<script type="text/javascript">
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });

    $(function(){
        $('.datepicker').datepicker();
    })

    $("#formFileSm").change(function(){
        if(this.files && this.files[0]) {
            let reader = new FileReader;
            reader.onload = function(data) {
                $(".select_img img").attr("src", data.target.result).width(500);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });

</script>
<body>

<section class="container-md">
    <form action="${pageContext.request.contextPath}/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="boardNo" value="${lunchrush.boardNo}">
        <table class="table">


            <div class="mb-3 row">
                <label for="date" class="col-sm-2 col-form-label">날짜</label>
                <div class="col-sm-10"><input class="form-control datepicker" id="date" name="date" value="${lunchrush.date}" autocomplete="off"></div>
            </div>
            <div class="mb-3 row">
                <label for="inputPassword" class="col-sm-2 col-form-label">식당 이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputPassword" name="placeName" value="${lunchrush.placeName}">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="address" class="col-sm-2 col-form-label">위치</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="address" name="address" value="${lunchrush.address}">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="lunchLeader" class="col-sm-2 col-form-label">당번</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="lunchLeader" name="lunchLeader" value="${lunchrush.lunchLeader}">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="score" class="col-sm-2 col-form-label">점수</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="score" name="score" value="${lunchrush.score}">
                </div>
            </div>
            <div class="mb-3 row select_img">
                <label for="formFileSm" class="col-sm-2 col-form-label">이미지 첨부</label>
                <div class="col-sm-10 select_img">
                    <input class="form-control" id="formFileSm" name="file" type="file" value="${lunchrush.image}">
                    <input type="hidden" name="file" value="${lunchrush.image}" />
                </div>
            </div>

<%--            <div class="select_img">--%>
<%--                <img src="${goods.gdsImg}" />--%>
<%--                <input type="hidden" name="gdsImg" value="${goods.gdsImg}" />--%>
<%--                <input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" />--%>
<%--            </div>--%>

        </table>
        <div class="btnGroup">
            <input type="submit" class="btn btn-outline-warning" value="수정하기">
            <input type="button" class="btn btn-outline-secondary cancelBtn" onclick="location.href='${pageContext.request.contextPath}/read/${lunchrush.boardNo}'" value="취소하기">
        </div>
    </form>
</section>

</body>
</html>

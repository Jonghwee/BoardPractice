<%--
  Created by IntelliJ IDEA.
  User: jonghwee
  Date: 2022/09/25
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시물 작성</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<style type="text/css">
    html, body{width: 100%; height: 100%; color: #198754; font-size: 14px; letter-spacing: -0.5px; font-family: 'Noto Sans', sans-serif;}
    .container-md{
        position: relative;
        display: grid;
        align-items: center;
        vertical-align: middle;
        margin-top: 30%;
    }
    .btnGroup{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .btn{
        margin: 10px;
    }
    .mb-3{
        text-align: center;
    }
    h1{
        text-align: center;
        padding-bottom: 20px;
        color: #474a5c;
    }
</style>
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
</script>
<body>
<div class="container-md">
    <section class="formSection">

        <form method="post" id="tableForm" action="${pageContext.request.contextPath}/insert" enctype="multipart/form-data">
            <h1 class="h1">Lunchrush 등록하기</h1>
            <table>
                <div class="mb-3 row">
                    <label for="date" class="col-sm-2 col-form-label">날짜</label>
                    <div class="col-sm-10"><input class="form-control datepicker" id="date" name="date" autocomplete="off"></div>
                </div>

                <div class="mb-3 row">
                    <label for="placeName" class="col-sm-2 col-form-label">식당 이름</label>
                    <div class="col-sm-10"><input type="text" class="form-control" id="placeName" name="placeName" placeholder="식당 이름을 입력해주세요"></div>
                </div>
                <div class="mb-3 row">
                    <label for="lunchLeader" class="col-sm-2 col-form-label">오늘의 당번</label>
                    <div class="col-sm-10"><input type="text" class="form-control" id="lunchLeader" name="lunchLeader" placeholder="메뉴를 선정한 사람을 입력해주세요"></div>
                </div>
                <div class="mb-3 row">
                    <label for="score" class="col-sm-2 col-form-label">평점</label>
                    <div class="col-sm-10"><input type="text" class="form-control" id="score" name="score" placeholder="0.0"></div>
                </div>
                <div class="mb-3 row">
                    <label for="address" class="col-sm-2 col-form-label">주소</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="address" id="address"></div>
                </div>
                <div class="mb-3 row">
                    <label for="content" class="col-sm-2 col-form-label">한줄평</label>
                    <div class="col-sm-10"><input type="text" class="form-control" name="content" id="content" placeholder="#밥한그릇뚝딱"></div>
                </div>
                <div class="mb-3 row">
                    <label for="formFileSm" class="col-sm-2 col-form-label">이미지 첨부</label>
                    <div class="col-sm-10"><input class="form-control" id="formFileSm" name="file" type="file"></div>
                </div>
            </table>
            <div class="row">
                <div class="btnGroup">
                    <input type=submit class="btn btn-outline-success" value=등록하기>
                    <input type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/list'" value="목록으로">
                </div>
            </div>
        </form>
    </section>
</div>
</body>
</html>

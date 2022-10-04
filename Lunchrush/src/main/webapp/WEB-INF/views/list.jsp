<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<head>
    <style type="text/css">
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }
        th, td, span{
            text-align: center;
        }
        section.notice {
            padding: 80px 0;
        }

        .page-title {
            margin-bottom: 60px;
        }
        .page-title h3 {
            font-size: 28px;
            color: #333333;
            font-weight: 400;
            text-align: center;
        }
        .page-title h5 {
            font-size: 18px;
            color: #333333;
            font-weight: 400;
            text-align: center;
        }

        .table {
            font-size: 13px;
            width: 100%;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .table a {
            color: #333;
            display: inline-block;
            line-height: 1.4;
            word-break: break-all;
            vertical-align: middle;
        }
        .table a:hover {
            text-decoration: underline;
        }
        .table th {
            text-align: center;
        }

        .table .th-num {
            width: 100px;
            text-align: center;
        }

        .table .th-date {
            width: 200px;
        }

        .table th, .table td {
            padding: 14px 0;
        }

        .table tbody td {
            border-top: 1px solid #e7e7e7;
            text-align: center;
        }

        .table tbody th {
            padding-left: 28px;
            padding-right: 14px;
            border-top: 1px solid #e7e7e7;
            text-align: left;
        }

        .table tbody th p{
            display: none;
        }

        .insertBtn{
            display: grid;
            align-items: center;
            justify-content: right;
            padding: 10px;
        }
        .noContent{
            align-items: center;
        }

    </style>

</head>
<body>
    <section class="notice">
        <div class="page-title">
            <div class="container">
                <h5>DX DEV3</h5>
                <h3>Lunchrush</h3>
            </div>
        </div>

        <!-- board list area -->
        <div id="board-list">
            <div class="container">

                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col" class="th-num">번호</th>
                        <th scope="col" class="th-title">식당 이름</th>
                        <th scope="col" class="th-score">점수</th>
                        <th scope="col" class="th-leader">당번</th>
                        <th scope="col" class="th-date">날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty requestScope.list}">
                            <tr>
                                <td colspan="5" >
                                    <span class="noContent">게시물이 없습니다.</span>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.list}" var="lunch">
                                <tr>
                                    <td>${lunch.boardNo}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/read/${lunch.boardNo}">${lunch.placeName}</a>
                                        <c:if test="${lunch.image != null}">
                                            <i class="bi bi-image">
                                        </c:if>
                                    </td>
                                    <td>${lunch.score}</td>
                                    <td>${lunch.lunchLeader}</td>
                                    <td>${lunch.date}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    <div class="insertBtn">
                        <button id="insertBtn" class="btn btn-outline-success" onclick="location.href='${pageContext.request.contextPath}/write'">등록하기</button>
                    </div>
                    </tbody>

                </table>
            </div>
        </div>

    </section>
</body>
</html>
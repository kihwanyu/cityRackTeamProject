<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>스마트택배 배송조회</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/common/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/common/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/common/css/tracking-cyan.css"/>
</head>
<body>
<div class="container-fluid">
    <div class="panel-body">
        <div class="col-md-12 header-title">스마트택배 배송조회</div>
        <div class="col-md-12">
            <div class="form-group row">
                <label for="invoice" class="col-xs-2 label-style">운송장번호</label>
                <div id="invoice" class="col-xs-8 info-style">123456789012</div>
            </div>
            <div class="form-group row">
                <label for="to" class="col-xs-2 label-style">받는 사람</label>
                <div id="to" class="col-xs-8 info-style">홍길동</div>
            </div>
            <div class="form-group row">
                <label for="from" class="col-xs-2 label-style">보낸 사람</label>
                <div id="from" class="col-xs-8 info-style">김철수</div>
            </div>
            <div class="form-group row">
                <label for="adress" class="col-xs-2 label-style">수령 주소</label>
                <div id="adress" class="col-xs-8 info-style">서울시 중구 남대문로가</div>
            </div>
        </div>
    </div>

    <div class="col-sm-12">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>시간</th>
                <th>현재 위치</th>
                <th>배송 상태</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>2017-04-07 11:11:11</td>
                <td>고객</td>
                <td>인수자등록</td>
            </tr>
            <tr>
              <td>2017-04-07 11:11:11</td>
              <td>성북직영</td>
              <td>집히처리</td>
            </tr>
            <tr>
              <td>2017-04-07 11:11:11</td>
              <td>대전HUB</td>
              <td>간선상차</td>
            </tr>
            <tr>
              <td>2017-04-07 11:11:11</td>
              <td>남서울터미널</td>
              <td>배달전</td>
            </tr>
            <tr>
                <td>2017-04-07 11:11:11</td>
                <td>서울 남대문</td>
                <td>배달출발</td>
            </tr>
            <tr>
                <td>2017-04-07 11:11:11</td>
                <td>서울 남대문</td>
                <td>배달완료</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<script src="/static/component/bootstrap-3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
final String key = "YyRiuyUtvT4spSoo6YyFkQ";
final int companyCode = 04;
String invoice = (String.valueOf(request.getParameter("invoice")));
%>       

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<div class="container-fluid">
    <div class="panel-body">
        <div class="col-md-12 header-title">스마트택배 배송조회</div>
        <div class="col-md-12">
            <div class="form-group row">
                <label for="invoice" class="col-xs-2 label-style">운송장번호</label>
                <div id="invoice" class="col-xs-8 info-style"></div>
            </div>
            <div class="form-group row">
                <label for="receiverName" class="col-xs-2 label-style">받는 사람</label>
                <div id="receiverName" class="col-xs-8 info-style"></div>
            </div>
            <div class="form-group row">
                <label for="senderName" class="col-xs-2 label-style">보낸 사람</label>
                <div id="senderName" class="col-xs-8 info-style"></div>
            </div>
            <div class="form-group row">
                <label for="receiverAddr" class="col-xs-2 label-style">수령 주소</label>
                <div id="receiverAddr" class="col-xs-8 info-style"></div>
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
            <tbody id="tbody">
            
            </tbody>
        </table>
    </div>
</div>

<script src="/static/component/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script>
$(function(){
	var myKey = '<%= key%>';
    var t_code = <%= companyCode%>
    var t_invoice = <%= invoice%>;
    
    $.ajax({  
        type:"GET",
        dataType : "json",
        url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
        success:function(data){
            var invoice = "";
            var receiverName = "";
            var senderName = "";
            var receiverAddr = "";
            
            if(data.status == false){
                invoice = ('<p>'+data.msg+'</p>');
            }else{
                invoice += ('<p>'+data.invoiceNo+'</p>')      
                receiverName = ('<p>'+data.receiverName+'</p>');
                senderName = ('<p>'+data.senderName+'</p>');
                receiverAddr = ('<p>'+data.receiverAddr+'</p>');
            }
             
             
            $('#invoice').append(invoice);
            $('#receiverName').append(receiverName);
            $('#senderName').append(senderName);
            $('#receiverAddr').append(receiverAddr);
            
            var trackingDetails = data.trackingDetails;
            
            
            $.each(trackingDetails, function(key, value){
                var $tbody = $('#tbody');
                var $tr = $('<tr>');
            	var $time = $('<td>' + value.timeString + '</td>');
            	var $where = $('<td>' + value.where + '</td>');
            	var $detail = $('<td>' + value.kind + '</td>');
            	
            	$tr.append($time);
            	$tr.append($where);
            	$tr.append($detail);
            	$tbody.append($tr);
            	
            });
            
            
            
            
        }
    });
});
</script>

</body>
</html>

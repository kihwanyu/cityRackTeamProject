<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
final String key = "YyRiuyUtvT4spSoo6YyFkQ";
final int companyCode = 04;
String invoice = (String.valueOf(request.getParameter("invoice")));
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div id="myPtag"></div>
<div id="myPtag2"></div>

<script>
$(document).ready(function(){
        // 배송정보와 배송추적 tracking-api
        $(function() {
           /*  var t_code = $('#tekbeCompnayList option:selected').attr('value');
            var t_invoice = $('#invoiceNumberText').val(); */
            var myKey = '<%= key%>';
            var t_code = <%= companyCode%>
            var t_invoice = <%= invoice%>;
            console.log(myKey);
            console.log(t_code);
            console.log(t_invoice);
            
            $.ajax({  
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                    console.log(data);
                    var myInvoiceData = "";
                    if(data.status == false){
                        myInvoiceData += ('<p>'+data.msg+'<p>');
                    }else{
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"발송자"+'</td>');                  
                        myInvoiceData += ('<th>'+data.senderName+'</td>');                  
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"제품정보"+'</td>');                   
                        myInvoiceData += ('<th>'+data.itemName+'</td>');                    
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                   
                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                   
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                   
                        myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                    
                        myInvoiceData += ('</tr>');                                       
                    }
                     
                     
                    $("#myPtag").html(myInvoiceData)
                     
                    var trackingDetails = data.trackingDetails;
                     
                     
                    var myTracking="";
                    var header ="";
                    header += ('<tr>');               
                    header += ('<th>'+"시간"+'</th>');
                    header += ('<th>'+"장소"+'</th>');
                    header += ('<th>'+"유형"+'</th>');
                    header += ('<th>'+"전화번호"+'</th>');                  
                    header += ('</tr>');     
                     
                    $.each(trackingDetails,function(key,value) {
                        myTracking += ('<tr>');               
                        myTracking += ('<td>'+value.timeString+'</td>');
                        myTracking += ('<td>'+value.where+'</td>');
                        myTracking += ('<td>'+value.kind+'</td>');
                        myTracking += ('<td>'+value.telno+'</td>');                     
                        myTracking += ('</tr>');                                  
                    });
                     
                    $("#myPtag2").html(header+myTracking);
                     
                }
            });
        });
         
});
</script>
</body>
</html>
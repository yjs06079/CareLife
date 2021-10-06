/**
 * 
*/

$('#cancel').click(function(){
	
    console.log()
	cancelPay();
}); 
 
function cancelPay() {
	

	var boCancel = document.getElementById('boCancel').value;
	var boPayment = document.getElementById('boPayment').value;
	var cancleName = document.getElementById('cancleName').value;
	var cancleBank = document.getElementById('cancleBank').value;
	var cancleAccount = document.getElementById('cancleAccount').value;
	var canclePhone = document.getElementById('canclePhone').value;
	
    jQuery.ajax({
      "url": "/carelife/usermain/bookingcancelpay", // 예: http://www.myservice.com/payments/cancel
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
       					imp_uid: boCancel, // 예: ORD20180131-0000011
      					cancel_request_amount: boPayment, // 환불금액
				        reason: "돌봄서비스 예약취소", // 환불사유
				        refund_holder:cancleName, // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
				        refund_bank: "88", // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
				        refund_account: cancleAccount, // [가상계좌 환불시 필수입력] 환불 수령계좌 번호*/
						refund_tel:canclePhone
      }),
      "dataType": "json"      
 
    }).done(function(result) { // 환불 성공시 로직 
      alert("환불 성공");
    }).fail(function(error) { // 환불 실패시 로직
      alert("환불 실패");
    });
  };



  
   

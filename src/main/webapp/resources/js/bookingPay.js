/**
 * 
*/



  function payment(){

        let hour = document.getElementById('boHour').value;
		let pay = document.getElementById('boPayment');
	


       if(hour == 0){   
      pay.value =10000;
  
        
     }else if (hour == 1){
   	pay.value =20000;
        
     }else if (hour == 2){
    pay.value =30000;
        
     }else if (hour == 3){
     pay.value =40000;
     }
     

  console.log(hour)
  console.log(pay.value)
}

payment();
    



 

   function importPay(){
	
  
	var boAddr = document.getElementById('boAddr').value;
	var boDate = document.getElementById('boDate').value;
	var boTime = document.getElementById('boTime').value;
	var boHour = document.getElementById('boHour').value;
	var boRoadName = document.getElementById('boRoadName').value;
	var boPayment = document.getElementById('boPayment').value;
	var pname = document.getElementById('pname').value;
	var pno = document.getElementById('pno').value;
	var pphone = document.getElementById('pphone').value;
	var boRoadNameDetail = document.getElementById('boRoadNameDetail').value;
	var boRemarks = document.getElementById('boRemarks').value;
	var boPayment = document.getElementById('boPayment').value;
	var boCancel = document.getElementById('boCancel').value;
	
	
        IMP.init('imp13670706'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
 
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '슬기로운 돌봄생활',
            amount : boPayment,
            buyer_email : 'a@aa',
            buyer_name : pname,
            buyer_tel : pphone,
            buyer_addr : boRoadNameDetail,
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
				
				document.getElementById('boCancel').value = rsp.imp_uid;

                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/carelife/usermain/bookingcompletion", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid,
                        merchant_uid : rsp.merchant_uid,
                        //기타 필요한 데이터가 있으면 추가 전달
                        boAddr:boAddr,
						boDate:boDate,
						boTime:boTime,
						boHour:boHour,
						boRoadName:boRoadName,
						boPayment:boPayment,
						pname:pname,
						pno:pno,
						pphone:pphone,
						boRoadNameDetail:boRoadNameDetail,
						boRemarks:boRemarks,
						boCancel:rsp.imp_uid,
						boPayment:boPayment
						

                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;


                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });

                             

            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="/carelife/usermain/bookinginfo";
                alert(msg);
            }
        });
        

 
    };

importPay();

    
     
   
     
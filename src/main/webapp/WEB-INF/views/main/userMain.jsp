<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/plugin/slick/slick.css"/>
<style>
	#kakao {
		width: 100%;
		height: 100px;
		background-color: #fef01b;
		text-align: center;
	}
	
	#kakao img {
		width: 20%;
		height: 100%;
	}
	
	#kakao a {
		font-size: 20px;
		color: black;
	}

	#certify {
		text-align: center;
	}
	
	.banner, .first-slide, .second-slide, .third-slide {
		height: 320px;
		width: 100%;
	}
	
	.circle {
	   width: 250px;
	   height: 250px;
	   border-radius: 70%;
	   overflow: hidden;
	   display: inline-block;
	}
	
	.card-header {
	   width: 100%;
	   text-align: center;
	}
	
	.card-title {
	   font-weight: bold;
	   text-align: center;
	}
	
	.card-text {
	   color: #e8774e;
	   font-weight: bold;
	}
	
	.review {
		margin-bottom: 40px;
	}
	
	.row {
		margin-bottom: 40px;
	}
	
	.col-4 {
		margin-top: 40px;
	}
</style>
</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>
	
	
		<!-- 메인 이미지 -->
		<div>
			<img alt="usermain" src="${pageContext.servletContext.contextPath}/resources/images/userMain.png">
		</div>
		
		<!-- 카카오톡 플러스 친구 -->
		<div id="kakao">
			<a href="http://pf.kakao.com/_Edjps/chat">
				<img alt="kakao" src="${pageContext.servletContext.contextPath}/resources/images/kakao.gif">
			</a>
			<a href="http://pf.kakao.com/_Edjps/chat"><b>카카오톡</b> 플친 추가하고 <b>무료상담</b> 받기</a>
		</div>
		
		<div class="container">	
		<!-- 메인 소개 -->
		<div class="row">
			<div class="col-4">
				<div class="card" style="width: 300px; border: 0px">
					<div class="card-header" style="height: 280px; background-color: white; border: 0px">
						<div class="circle">
							<img src="${pageContext.servletContext.contextPath}/resources/images/baby1.png">
						</div>
					</div>
					<div class="card-body">
						<h3 class="card-title">원하는 시간대에<br>안정적인 정기 등하원</h3>
						<p class="card-text"> 슬기로운 돌봄생활은 부모님이 원하시는 요일과 시간대에, 마음 편히 일하실 수 있도록  등하원 서비스를 제공합니다.</p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card" style="width: 300px; border: 0px">
					<div class="card-header" style="height: 280px; background-color: white; border: 0px">
                        <div class="circle">
                           <img src="${pageContext.servletContext.contextPath}/resources/images/baby2.png">
                        </div>
					</div>
					<div class="card-body">
                        <h3 class="card-title">사랑과 정성으로 아이를 <br>기다려주는 선생님</h3>
                        <p class="card-text">선생님들은 자녀를 키워본 양육경험, 삶의 연륜에서 나오는 여유와 인내심으로 아이를 기다려주고, 지지해 줍니다.</p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card" style="width: 300px; border: 0px">
					<div class="card-header" style="height: 280px; background-color: white; border: 0px">
                        <div class="circle">
                           <img src="${pageContext.servletContext.contextPath}/resources/images/baby3.png">
                        </div>
					</div>
					<div class="card-body">
                        <h3 class="card-title">365일, 원하는 시간, 원하는 장소에서 가입비 없이 시간당 결제</h3>
                        <p class="card-text">만 1세부터 초등학생까지 혼자 둘 수 없는 나이, 육아파트너 돌봄선생님이 365일 함께 합니다.</p>
					</div>
				</div>
			</div>
		 </div>
      
		<!-- 이용 후기 -->
		<div class="review">
			<div class="autoplay">
				<div>
					<img alt="review1" src="${pageContext.servletContext.contextPath}/resources/images/review1.png">
				</div>
			    <div>
					<img alt="review2" src="${pageContext.servletContext.contextPath}/resources/images/review2.png">
				</div>
				<div>
					<img alt="review3" src="${pageContext.servletContext.contextPath}/resources/images/review3.png">
				</div>
				<div>
					<img alt="review4" src="${pageContext.servletContext.contextPath}/resources/images/review4.png">
				</div>
				<div>
					<img alt="review5" src="${pageContext.servletContext.contextPath}/resources/images/review5.png">
				</div>
				<div>
					<img alt="review6" src="${pageContext.servletContext.contextPath}/resources/images/review6.png">
				</div>
			</div>
  		</div>
  </div>
	    <!-- 배너 -->
	    <div class="banner">
	    	<section class="slider_section">
	    	<div id="main_slider" class="carousel slide banner-main" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="first-slide" src="${pageContext.servletContext.contextPath}/resources/images/banner1.png" alt="First slide">
						<div class="container">
							<div class="carousel-caption relative"></div>
						</div>
					</div>
					<div class="carousel-item">
						<img class="second-slide" src="${pageContext.servletContext.contextPath}/resources/images/banner2.png" alt="Second slide">
						<div class="container">
							<div class="carousel-caption relative"></div>
						</div>
					</div>
					<div class="carousel-item">
						<img class="third-slide" src="${pageContext.servletContext.contextPath}/resources/images/banner3.png" alt="Third slide">
						<div class="container">
							<div class="carousel-caption relative"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
	    </div>
    
    
	<%@ include file="../includes/footer.jsp"%>
	
	<script>
		$(document).ready(function(){
			$('.autoplay').slick({
				slidesToShow: 3, //한 화면에 보일 슬라이드 개수
				slidesToScroll: 1, //한번에 슬라이드 되는 개수
				autoplaySpeed: 1500, //한 슬라이드에 머무르는 시간
				autoplay : true, //자동 스크롤
				arrows : false
			});
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>슬기로운 돌봄생활</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="${pageContext.servletContext.contextPath}/resources/${pageContext.servletContext.contextPath}/resources/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="${pageContext.servletContext.contextPath}/resources/images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader --> 
      <!-- header -->
      <header style="height: 230px">
         <!-- header inner -->
         <div class="header">
            <div class="head_top">
               <div style="text-align: right; position: relative; top: 25px;">
                   <a href="/carelife/hello" style="margin-right: 20px;">메인 화면으로 돌아가기</a>
               </div>
               <div class="container">
                  <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                       <div class="top-box">
                        <ul class="sociel_link">
                        	<li><a></a></li>
                        </ul>
                    </div>
                   </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="row">
               <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                  <div class="full">
                     <div class="center-desk">
                        <div class="logo"><a href="/carelife/adminmain"><img src="${pageContext.servletContext.contextPath}/resources/images/mainLogo.png" alt="logo" 
                        style="width: 225px; height: 100px; padding-bottom: 30px" /></a> </div>
                     </div>
                  </div>
               </div>
               <div class="col-xl-7 col-lg-7 col-md-9 col-sm-9" style="padding-right: 150px">
                  <div class="menu-area">
                     <div class="limit-box">
                        <nav class="main-menu">
                           <ul class="menu-area-main" style="float: left">
                              <li><a href="/carelife/adminmain/bookinglist" style="font-size: 20px; font-weight: bolder">예약 조회</a></li>
                              <li><a href="/carelife/adminmain/employeelist" style="font-size: 20px; font-weight: bolder">구인 관리</a></li>
                              <li><a href="https://center-pf.kakao.com/_Edjps/dashboard" style="font-size: 20px; font-weight: bolder">챗봇 관리</a></li>
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- end header inner --> 
      </header>
   </body>
</html>
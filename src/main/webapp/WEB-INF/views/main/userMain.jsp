<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../includes/userHeader.jsp"%>
		
		     <section class="slider_section">
         <div id="main_slider" class="carousel slide banner-main" data-ride="carousel">

            <div class="carousel-inner">
               <div class="carousel-item active">
                  <img class="first-slide" src="${pageContext.servletContext.contextPath}/resources/images/돌봄4.png" style="text-align : center; width: 1920px;  height: 657px; "alt="First slide">
                  <div class="container">
                     <div class="carousel-caption relative">
                      
                        

                 
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <img class="second-slide" src="${pageContext.servletContext.contextPath}/resources/images/돌봄2.png"  style="text-align : center; width: 1920px;  height: 657px; alt="Second slide">
                  <div class="container">
                     <div class="carousel-caption relative">
                      
          
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <img class="third-slide" src="${pageContext.servletContext.contextPath}/resources/images/돌봄3.png"  style="text-align : center;width: 1920px;  height: 657px; alt="Third slide">
                  <div class="container">
                     <div class="carousel-caption relative">
                
   
                    
                     </div>
                  </div>
               </div>

            </div>
            <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
            <i class='fa fa-angle-right'></i>
            </a>
            <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
            <i class='fa fa-angle-left'></i>
            </a>
            
         </div>

      </section>
      
      
        <img class="third-slide" src="${pageContext.servletContext.contextPath}/resources/images/인증.png"  style="text-align : center;width: 400;  height: 400px; alt="인증기관">
      
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
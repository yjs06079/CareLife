<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 돌봄생활</title>
</head>
<body>
	<script>
		if(${result} > 0 && ${result2} > 0) {
			alert("합격 처리 되었습니다.");
			location.href = "/carelife/adminmain/employeelist";
		
		} else {
			alert("오류 발생 : 다시 시도해주세요.")
			location.href = "/carelife/adminmain/employeelist/detail/${eno}";
		}
	</script>
</body>
</html>
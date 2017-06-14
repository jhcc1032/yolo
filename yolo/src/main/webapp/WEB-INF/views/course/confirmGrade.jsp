<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<meta  charset="UTF-8">
<title>개인 성적 정보 열람</title>
<style type="text/css">
tr th{
	text-align: center;
}

tr td{
	text-align: center;
}
</style>
</head>
<body>
<div class="form-group has-error" >
	<h3 style="text-align: center;"> ${name}(${id})님의 성적 정보 열람</h3>
	<table class="table table-striped table-hover">
		<tr>
		<th>과목 이름</th> <th>성적</th> <th>순위</th> 
		</tr>
		<c:forEach var="scorelist" items="${scorelist}">
			<tr>
				<td> ${scorelist.ctitle}</td> 
				<td> ${scorelist.score}</td>
				<td> ${scorelist.rank}</td>
			</tr>
		</c:forEach>
	</table>
</div>


</body>
</html>
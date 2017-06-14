<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
tr th {
	color: #b94a48;
	text-align: center;
}
tr td {
	text-align: center;
}
button {
	align : right;
}

.classoption{
	text-align: center;
}

 #List {
	width : 400px;
	margin-left: 200px;
} 

#currentClassInform {
	width : 100%;
	display: inline-block;
}
</style>
<body>
	<div>
		<!-- 수강정보 보여줄곳 -->
		<!-- 수강정보 보여줄곳 -->
		<!-- 수강정보 보여줄곳 -->
		<!-- 수강정보 보여줄곳 -->
		<h1>현재 수강정보</h1>
				<div id="currentClassInform">
					<h3 align=center>현재 수강 정보</h3>
					<table class="table table-striped table-hover ">
						<tr id="thead">
							<th>교육과정</th>
							<th>과정코드</th>
							<th>교육기간</th>
							<th>배점(week)</th>
							<th>개설날짜</th>
						</tr>

						<c:forEach var="courseList" items="${courseList}">
							<tr>
								<td>${courseList.ctitle}</td>
								<td>${courseList.ccode}</td>
								<td>${courseList.chour}</td>
								<td>${courseList.cscore}</td>
								<td>${courseList.createdate}</td>
							</tr>
						</c:forEach>
					</table>
				<div>
					<h3 align=center>현재 수강 진행률</h3>

					<c:forEach var="courseList" items="${courseList}">
						<h5>${courseList.ctitle}${courseList.progressPercentage}</h5>
						<div class="progress progress-striped active">
							<div id="progress" class="progress-bar"
								style="width: ${courseList.progressPercentage}"></div>
						</div>
					</c:forEach>
				</div>
				<!-- 수강정보 보여줄곳 end-->
				<!-- 수강정보 보여줄곳 end-->
				<!-- 수강정보 보여줄곳 end-->
				<!-- 수강정보 보여줄곳 end-->
	</div>
</body>
</html>
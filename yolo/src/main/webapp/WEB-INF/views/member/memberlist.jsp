<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="pageBean" class="com.yolo.model.domain.PageBean"
	scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든회원정보</title>
<style type="text/css">
#table {
	padding-top: 300px;
}

th, td {
	text-align: center;
}

#drop {
	margin-left: 660px;
}

#memberlist {
	margin-left: 30px;
}

body {
	margin: 0 auto;
}
</style>

</head>
<body>
	<div id="memberlist">
		<form id="frm">
			<div id="drop">
				<ul class="nav nav-pills">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" aria-expanded="false"> 선택 <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="allMemberList.do">모두</a></li>
							<li><a href="allMemberList.do?key=auth&word=2">강사</a></li>
							<li><a href="allMemberList.do?key=auth&word=1">교육생</a></li>
						</ul></li>
				</ul>
			</div>
			<table class="table table-striped table-hover ">
				<thead>
					<tr class="warning">

						<th>이름</th>
						<th>아이디</th>
						<th>사번</th>
						<th>직군</th>
						<th>이메일</th>
						<th>권한</th>
						<th>수정</th>
						<th>강퇴</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="member" items="${list}">
						<tr>
							<td>${member.name }</td>
							<td>${member.id }</td>
							<td>${member.empno }</td>
							<td>${member.mgroup }</td>
							<td>${member.email }</td>
							<td><c:choose>
									<c:when test="${member.auth == '1'}">
										교육생
									</c:when>
									<c:when test="${member.auth == '2'}">
										강사
									</c:when>
									<c:when test="${member.auth == '3'}">
										관리자
									</c:when>
								</c:choose></td>
							<td><a href="update.do?id=${member.id}"
								class="btn btn-warning">수정</a></td>
							<td><a href="kick.do?id=${member.id}" class="btn btn-danger">KICK</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>
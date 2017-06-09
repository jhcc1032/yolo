<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="pageBean" class="com.yolo.model.domain.PageBean"
	scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/yolo/resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
#table {
	padding-top: 300px;
}

.btn-group {
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
			<div class="btn-group">
				<a href="allMemberList.do" class="btn btn-primary">모두</a> <a href="#"
					class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="allMemberList.do?key=auth&word=2">강사</a></li>
					<li><a href="allMemberList.do?key=auth&word=1">교육생</a></li>
				</ul>
			</div>
			<table class="table table-striped table-hover ">
				<thead>
					<tr>

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
							<td>${member.auth }</td>
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
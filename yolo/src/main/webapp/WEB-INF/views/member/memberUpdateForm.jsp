<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function button_event() {
		

		if (confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "delete.do";
			return true;
		} else {
			return false;
		}
	}

	function goupdatePage() {
		location.href = "memberUpdateForm.do";
	}
</script>
<style type="text/css">
th {
	text-align: center;
}
</style>
</head>
<body>

	<%
		String id = (String) session.getAttribute("id");
	%>
	<table class="table table-striped table-hover ">
		<tr class="info">
			<th>아이디</th>
			<td>${member.id}</td>
		</tr>
		<tr class="success">
			<th>비밀번호</th>
			<td>${member.password}</td>
		</tr>
		<tr class="danger">
			<th>이 름</th>
			<td>${member.name}</td>
		</tr>
		<tr class="warning">
			<th>권 한</th>
			<td>${member.mgroup}</td>
		</tr>
		<tr class="success">
			<th>입사일자</th>
			<td>${member.enteryear}</td>
		</tr>
		<tr class="danger">
			<th>사 번</th>
			<td>${member.empno}</td>
		</tr>
		<tr class="warning">
			<th>email</th>
			<td>${member.email}</td>
		</tr>
		<tr align="right">
			<td colspan="2"><button class="btn btn-primary"
					onclick="goupdatePage()">수정</button>
				<button class="btn btn-default" onclick="return button_event()"
					value="탈퇴">회원탈퇴</button></td>
		</tr>
		
</body>
</html>

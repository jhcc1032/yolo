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
			return true;
		} else {
			return false;
		}
	}

function goupdatePage() {
	location.href="memberUpdateForm.do";
	
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
	
	<%-- <table class="table table-striped table-hover ">
		<tr class="info"><th> 아이디  </th> <td> ${member.id}</td></tr>
		<tr class="success"><th> 비밀번호  </th> <td> ${member.password}</td></tr>
		<tr class="danger"><th> 이  름  </th> <td> ${member.name}</td></tr>
		<tr class="warning"><th> 권 한  </th> <td> ${member.mgroup}</td></tr>
		<tr class="success"><th> 입사일자  </th> <td>${member.enteryear}</td></tr>
		<tr class="danger"><th> 사 번  </th> <td> ${member.empno}</td></tr>
		<tr class="warning"><th> email  </th> <td>${member.email} </td></tr>
		<tr align="right">
		<td colspan="2"><button class="btn btn-primary" onclick="goupdatePage()" >수정</button> 		
		<button class="btn btn-default"  onclick="return button_event()" value="탈퇴">회원탈퇴</button></td>
		</tr> 
		<!-- 
		<tr class="success"><td> <a href ="memberUpdateForm.do" >회원 정보 수정</a> </td></tr>
		<tr class="danger"><td> <a href ="delete.do" onclick="return button_event()">회원탈퇴</a> </td></tr> -->
	</table> --%>
	
	<table class="table table-striped table-hover ">
		<thead>
			<tr class="warning">
				<th colspan="2"><h3>회원정보</h3></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>아이디</td>
				<td>${member.id}</td>
			</tr>
			<tr>
				<td>이 름</td>
				<td>${member.name}</td>
			</tr>
			<tr>
				<td>직군</td>
				<td>${member.mgroup}</td>
			</tr>
			<tr>
				<td>입사일자</td>
				<td>${member.enteryear}</td>
			</tr>
			<tr>
				<td>사번</td>
				<td>${member.empno}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.email}</td>
			</tr>
		</tbody>
	</table>
	<a href="memberUpdateForm.do" class="btn btn-primary btn-sm">수정</a>
	<a href="pwcheck.do" class="btn btn-primary btn-sm">수정</a>
	<a href="delete.do" class="btn btn-primary btn-sm" onclick="return button_event()">탈퇴</a>
</body>
</html>

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
<style type="text/css">
#table {
	padding-top: 300px;
}
</style>
<script type="text/javascript">
	function selectEvent(selectObj) {
		pageBean.getKey("auth");
		pageBean.setWord(selectObj.value);
		frm.action = "allMemberList.do";
		frm.submit();
	}
	$(function() {
		$('#word').change(function(){
			
			var key = pageBean.getKey("auth");
			var word = pageBean.setWord(this.value);
			$.get( "allMemberList.do?key="+key+"&word="+word);
			
			
			/* frm.action = "allMemberList.do?key="+key+"&word="+word;
			frm.submit(); */
		});
	

	});
	
	function deleteMember() {
		var name = document.getElementById("butt").getAttribute('name');
		alert(name);
		


	}
</script>
</head>
<body>
	<form id="frm">
		<select name="word" id="word">
			<option value="">모두</option>
			<option value="1">강사</option>
			<option value="2">교육생</option>
		</select>

		<table id="table">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>사번</th>
				<th>직군</th>
				<th>입사일자</th>
				<th>이메일</th>
				<th>권한</th>
				<th>수정</th>
				<th>강퇴</th>
			</tr>
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.name }</td>
					<td>${member.id }</td>
					<td>${member.empno }</td>
					<td>${member.mgroup }</td>
					<td>${member.enteryear }</td>
					<td>${member.email }</td>
					<td>${member.auth }</td>
					<td><a href="update.do?id=${member.id}">수정</a></td>
					<td><a href="kick.do?id=${member.id}">kick!!</a></td>
				</tr>
			</c:forEach>

		</table>
	</form>
</body>
</html>
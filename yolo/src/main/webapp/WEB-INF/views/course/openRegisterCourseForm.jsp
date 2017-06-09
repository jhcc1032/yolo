<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청</title>
</head>
<body>
	<!-- 수강신청 페이지 -->
	<form class="form-horizontal" action="courseRegister.do" method="get" id="coursefrm">

		<select id="List" name="selected_value">
				<c:forEach var="classList" items="${classList}">
					<option value="${classList.ccode}">${classList.ctitle}</option>
				</c:forEach> 
		</select>
		

		<table align='center'>
			<tr>
				<td class='tbasic'>과목코드</td>
				<td class='tbasic'>${selectedClass.createcode}</td>
			</tr>
			<tr>
				<td class='tbasic'>과목이름</td>
				<td class='tbasic'>${selectedClass.createdate} </td>
			</tr>
			<tr>
				<td class='tbasic'>과목시간</td>
				<td class='tbasic'>${selectedClass.ccode} </td>
			</tr>
			
			<tr>
				<td><button type="register" value="select">선택</button></td>
			</tr>

		</table>

	</form>
</body>
</html>
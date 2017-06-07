<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="register.do" >
	<table id="class_register" align='center'>
		<tr>
			<td class="caption" colspan='2'>과목 등록(개설)</td>
		</tr>
		<tr>
			<td class='tbasic'>과목 코드</td>
			<td class='tbasic'>과목명</td>
			<td class='tbasic'>수업 시간</td>
			<td class='tbasic'>학점</td>
			<td class='tbasic'>개설 코드</td>
		</tr>
		<tr>
			<td class='tbasic'><input type='text' name='empno' id='empno'></td>
		</tr>
		<tr>
			<td colspan='2' align='center' class='tfoot tspacial'><input
				type="submit" value='등록'> <input type="reset" value='취소'>
			</td>
		</tr>
	</table>
</form>
	<table id="class_view" align='center'>
		<tr>
			<td class="caption" colspan='2'>개설 과목</td>
		</tr>
		<tr>
			<td class='tbasic'>과목 코드</td>
			<td class='tbasic'>과목명</td>
			<td class='tbasic'>수업 시간</td>
			<td class='tbasic'>학점</td>
			<td class='tbasic'>개설 코드</td>
			<td class='tbasic'>개설 날짜</td>
		</tr>
		<tr>
			<c:forEach var="classinfo" items="${classinfo}">
				<td>${classinfo.code}</td>
				<td>${classinfo.title}</td>
				<td>${classinfo.total_time}</td>
				<td>${classinfo.credit}</td>
				<td>${classinfo.open_code}</td>
				<td>${classinfo.open_date}</td>
			</c:forEach>
		</tr>
	</table>
</body>
</html>
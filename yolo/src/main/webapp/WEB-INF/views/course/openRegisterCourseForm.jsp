
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청</title>
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

/* #List {
	width : 400px;
}	 */

#currentClassInform {
	width : 100%;
	display: inline-block;
}
.form-control{
	width: 500px;
	margin-left: 150px;
	text-align: center;
}
</style>
</head>

<script type="text/javascript">

//select 선택시 동적 출력
function itemChange() {
	 var selected_value =  $("#List").val();
	 location.href="openRegisterCourseForm.do?selected_value=" + selected_value;	
} 

</script>

<body>
	<div class="form-group has-error">
	<form class="form-horizontal" action="openRegisterCourseForm.do" method="get" id="coursefrm">

		<h3 align = center >수강 가능 과목</h3>
		<select id="List" class="form-control" name="selected_value" onchange="itemChange()" >
			<option> 수강할 과목을 선택하세요 </option>
			<c:forEach var="classList" items="${classList}">
				<option  value="${classList.ccode}">${classList.ctitle}</option>
			</c:forEach> 
		</select>
			
			
		<h3 align = center >과목 정보</h3>
		<table class="table table-striped table-hover">
			<tr >
				<th class='tbasic' width = "30%" >과목이름</th>
				<td class='tbasic'>${selectedClass.ctitle} </td>
			</tr>
			<tr>
				<th class='tbasic'  >수업시간</th>
				<td class='tbasic'>${selectedClass.chour} 시간</td>
			</tr>
			<tr>
				<th class='tbasic'>배점(학점 (weeks))</th>
				<td class='tbasic'>${selectedClass.cscore} 학점(weeks) </td>
			</tr>
			<tr>
				<th class='tbasic' >과목 개설날짜</th>
				<td class='tbasic'>${selectedOpenClass.createdate} </td>
			</tr>
		</table>
			
		</form>
	</div>
<div class="form-group has-error">
	<form action="registerCourse.do" method="get" id="registerCourse">
		<!-- 수강신청 -->
		<input type="hidden" name=createcode value="${selectedOpenClass.createcode}">
		
		<span style="float:right">
		<button  class="btn btn-primary" value="register"  >수강신청</button>
		</span>
	</form>
</div > 


<div id = "currentClassInform">
<h3 align = center >현재 수강 정보</h3>
	<table class="table table-striped table-hover " >
	<tr id = "thead">
		 <th> 과목 이름 </th>	
		 <th> 과목 번호 </th> 
		 <th> 수업 시간 </th>
		 <th> 배 점 </th> 
		 <th> 삭제 </th>
	</tr>
		
	<c:forEach var="courseList" items="${courseList}">
		<tr>	
			<td> ${courseList.ctitle} </td>
			<td> ${courseList.ccode} </td>
			<td> ${courseList.chour} </td>
			<td> ${courseList.cscore} </td>
			<td> <a href = "courseDelete.do?coursecode=${courseList.coursecode}" > 삭제 </a>
		</tr>
	</c:forEach>
	 
	</table>
</div>
</body>
</html>
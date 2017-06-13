
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
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

/* #progress {
	width: 90%;
} 
 */
</style>
</head>

<script type="text/javascript" >

//select 선택시 동적 출력
function itemChange() {
	var selected_value =  $("#List").val();
	 location.href="openRegisterCourseForm.do?selected_value=" + selected_value;	
} 

</script>

<body>
	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#registerclass " data-toggle="tab">수강 신청</a></li>
		<li><a href="#currentclassinfo" data-toggle="tab">현재 수강 정보</a></li>
	</ul>
	
	<div id="myTabContent" class="tab-content">	
		
		<!-- 수강 신청 tab -->
		<!-- 수강 신청 tab -->
		<!-- 수강 신청 tab -->
		<div class="tab-pane fade active in" id="registerclass">
		
			<form class="form-horizontal" action="openRegisterCourseForm.do" method="get" id="coursefrm">
				<div class="form-group has-error" style="margin-left: 0px;">
					<h3 align = center >수강 가능 과목</h3>	
					<select id="List" class="form-control" name="selected_value" onchange="itemChange()" >
					<option class="classoption"> 수강할 과목을 선택하세요 </option>
						<c:forEach var="classList" items="${classList}">
							<option class="classoption" value="${classList.ccode}">${classList.ctitle}</option>
						</c:forEach> 
					</select>
				</div>
				<div>
					<table class="table table-striped table-hover" style="width:630px;">
						<tr >
							<th class='tbasic'>과목이름</th>
							<td class='tbasic'> <a href = "createClassDetailedView.do?createcode=${selectedOpenClass.createcode}" >${selectedClass.ctitle} </a></td>
						</tr>
						<tr>
							<th class='tbasic'>수업시간</th>
							<td class='tbasic'>${selectedClass.chour} 시간</td>
						</tr>
						<tr>
							<th class='tbasic'>배점(학점 (weeks))</th>
							<td class='tbasic'>${selectedClass.cscore} 학점(weeks) </td>
						</tr>
						<tr>
							<th class='tbasic'>과목 개설날짜</th>
							<td class='tbasic'>${selectedOpenClass.createdate} </td>
						</tr>
					</table>
				</div>
			</form>
		
			<div class="form-group has-error">
				<form action="registerCourse.do" method="get" id="registerCourse">
					<!-- 수강신청 -->
					<input type="hidden" name=createcode value="${selectedOpenClass.createcode}">
					
					<span style="float:right">
					<button  class="btn btn-primary" value="register">수강신청</button>
					</span>
				</form>
			</div > 
		
		
			<div id = "currentClassInform">
			<h3 align = center >현재 수강 신청정보</h3>		
				<table class="table table-striped table-hover "  >
					<tr id = "thead">
						<th>교육과정</th>	
						<th>과정코드</th> 
						<th>교육기간</th>
						<th>배점(week)</th>
						<th>개설날짜</th>
						<th> 삭제 </th>
					</tr>		
					<c:forEach var="courseList" items="${courseList}">
						<tr>	
							<td> ${courseList.ctitle} </td>
							<td> ${courseList.ccode} </td>
							<td> ${courseList.chour} </td>
							<td> ${courseList.cscore} </td>
							<td> ${courseList.createdate} </td>
							<td> <a href = "courseDelete.do?coursecode=${courseList.coursecode}" class="btn btn-primary"> 삭제 </a>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<div class="tab-pane fade" id="currentclassinfo" >
			<form method ="get" >
				<div id = "currentClassInform">
					<h3 align = center >현재 수강 정보</h3>
					<table class="table table-striped table-hover " >
					<tr id = "thead">
						 <th>교육과정</th>	
						 <th>과정코드</th> 
						 <th>교육기간</th>
						 <th>배점(week)</th>
						 <th>개설날짜</th>
					</tr>
					
					<c:forEach var="courseList" items="${courseList}">
					<tr>	
						<td> ${courseList.ctitle} </td>
						<td> ${courseList.ccode} </td>
						<td> ${courseList.chour} </td>
						<td> ${courseList.cscore} </td>
						<td> ${courseList.createdate} </td>
					</tr>
					</c:forEach>
					</table>
				</div>
				<div>
					<h3 align = center >현재 수강 진행률</h3>
					
					<c:forEach var="courseList" items="${courseList}">
						<h5> ${courseList.ctitle} ${courseList.progressPercentage}</h5>									
						<div class="progress progress-striped active" >
		  					<div id="progress" class="progress-bar" style="width: ${courseList.progressPercentage}"> </div>
						</div>
					</c:forEach>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
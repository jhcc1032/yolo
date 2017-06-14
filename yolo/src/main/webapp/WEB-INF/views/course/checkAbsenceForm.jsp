
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
	location.href="searchMyStudent.do?ctitle=" + selected_value;	
} 
function checkall(){
	$("input:checkbox").prop("checked", true);
}
function disableall(){
	$("input:checkbox").prop("checked", false);
}
function function_click() {  
    var str = "";  
    $("input:checkbox[name='studentList']:checked").each(function (index) {  
        str += $(this).val() + ",";  
    });  
  	alert(str);
  	location.href="searchMyStudent.do";
}  
</script>

<body>
	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#checkabsence " data-toggle="tab">출석 정보</a></li>
	</ul>
	
	<div id="myTabContent" class="tab-content">	
		
		<!-- 출석체크 tab -->
		<!-- 출석체크 tab -->
		<!-- 출석체크 tab -->
		<div class="tab-pane fade active in" id="checkabsence">	
			<div class="form-group has-error" style="margin-left: 0px;">
				<h3 align = center >강사님께서 강의중인 교육과정입니다</h3>	
				<select id="List" class="form-control" name="selected_value" onchange="itemChange()" >
				<option class="classoption">교육과정을 선택하세요</option>
					<c:forEach var="classtitle" items="${classList}">
						<option class="classoption" value="${classtitle}">${classtitle}</option>
					</c:forEach> 
				</select>
			</div>
			<form class="form-horizontal" action="updateMyStudentAbsence.do" method="POST">
				<div>
					<table class="table table-striped table-hover ">
						<thead id="thead">
							<tr style="color: #b94a48;">
								<th>교육과정</th>
								<th>수강생</th>
								<th>결석</th>
								<th>지각</th>	
							</tr>
						</thead>
						<tbody>
							<c:forEach var="studentList" items="${studentList}">
								<tr id="dplist" class="active">
									<td>${ctitle}<input type="hidden" name="atitle" id="atitle" value="${ctitle}"></td>
									<td>${studentList}</a></td>
									<td><input type="checkbox" name="absenceList" id="absenceList" value="${studentList}"></td>
									<td><input type="checkbox" name="latenessList" id="latenessList" value="${studentList}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="margin-left: 50px; position: relative;">
					<input type="button" name="all" class="btn btn-primary" value="전체 선택" onclick="checkall()"><br/>
					<input type="button" name="all" class="btn btn-primary" value="전체 해제" onclick="disableall()"><br/>
					<input type="submit" class="btn btn-primary">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
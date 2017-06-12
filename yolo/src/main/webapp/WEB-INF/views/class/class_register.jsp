<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#dplist {
	text-align: center;
}
#thead tr th {
	text-align: center;
}
.frame {
	width: 270px;
	display: inline-block;
}
</style>


<script type="text/javascript">
// modal open
function openModal(){
	$('#delete_modal').modal('show');
}
</script>

</head>
<body>
	<!--  					-->
	<!--  					-->
	<!--  					-->
	<!-- 과목 등록 & 조회 	-->
	<!--  					-->
	<!--  					-->
	<!--  					-->
	
	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home " data-toggle="tab">ClassCheck (과목 조회)</a></li>
		<li><a href="#cregister" data-toggle="tab">Register Class (과목등록)</a></li>
	</ul>
	
	<!-- tab안에 들어가는 내용 -->
	<div id="myTabContent" class="tab-content">	
		<!--  					-->
		<!--  					-->
		<!--  					-->
		<!-- 과목 조회 tab		-->
		<!--  					-->
		<!--  					-->
		<!--  					-->
		<div class="tab-pane fade active in" id="home">
			<form method="get" action="classCheck.do">
				<div style="overflow: scroll; height: 550px;">
					<table class="table table-striped table-hover ">
						<thead id="thead">
							<tr style="color: #b94a48;">
								<th>#</th>
								<th>과목코드</th>
								<th>과목 명</th>
								<th>총 수업 시간(hour)</th>
								<th>학점(weeks)</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${classlist}">
								<tr id="dplist" class="active">
									<td><a href="#">#</a></td>
									<td><a href="#">${list.ccode}</a></a></td>
									<td><a href="#">${list.ctitle}</a></td>
									<td><a href="#">${list.chour}</a></td>
									<td><a href="#">${list.cscore}</a></td>
									<td><a href="classUpdateForm.do?ccode=${list.ccode}">Edit</a></td>
									<td><a href="classDelete.do?ccode=${list.ccode}">Delete</a></td>	
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="form-group">
					<div class="col-lg-10">
						<button type="submit" class="btn btn-primary">Check</button>
					</div>
				</div>
			</form>
		</div>
		
		<!--  					-->
		<!--  					-->
		<!--  					-->
		<!-- 과목 등록 tab		-->
		<!--  					-->
		<!--  					-->
		<!--  					-->
		<div class="tab-pane fade" id="cregister">
			<form method="get" action="register.do" style="border: 10px; border-color: orange;">
				<div class="col-lg-10" style="overflow: scroll; height: 550px;">			
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">교육과정 분류</label> 
						<select class="form-control" name='ccode' id='ccode'>
							<option>전체</option>
							<option value="0">전산(00000)</option>
							<option value="10000">사무(10000)</option>
							<option value="20000">통신(20000)</option>
							<option value="30000">기타(30000)</option>
						</select>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">교육과정</label> 
						<input type="text" class="form-control" name='ctitle' id='ctitle'>
					</div>	
					<div class="form-group has-error frame" style="width: 100px;">
						<label class="control-label" for="inputError">교육기간(h)</label> 
							<select
								class="form-control" name='chour' id='chour'>
								<option>8</option>
								<option>16</option>
								<option>24</option>
								<option>32</option>
								<option>40</option>
								<option>48</option>
								<option>56</option>
								<option>64</option>
								<option>72</option>
								<option>80</option>
								<option>120</option>
								<option>160</option>		
							</select>
					</div>
					<div class="form-group has-error frame" style="width: 100px;">
						<label class="control-label" for="inputError">과정배점</label> 
						<select
							class="form-control" name='cscore' id='cscore'>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
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
</style>
<script type="text/javascript">

// modal open
function openModal(){
	$('#delete_modal').modal('show');
}

function calldelete(ccode){
	location.href = "classDelete.do?"+ccode;
}

</script>
</head>
<body>
	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home " data-toggle="tab">ClassCheck (과목 조회)</a></li>
		<li><a href="#cregister" data-toggle="tab">Register Class (과목등록)</a></li>
	</ul>
	
	<!-- tab안에 들어가는 내용 -->
	<div id="myTabContent" class="tab-content">	
		<!-- 등록 과목 조회 부분 -->
		<div class="tab-pane fade active in" id="home">
			<form method="get" action="classCheck.do">
				<div style="overflow: scroll; height: 550px;">
					<table class="table table-striped table-hover ">
						<thead id="thead">
							<tr style="color: #b94a48;">
								<th>#</th>
								<th>Class Code<br />(과목코드)
								</th>
								<th>Class Name<br />(과목 명)
								</th>
								<th>Class Hour<br />(총 수업 시간 (hour))
								</th>
								<th>Class 배점<br />(학점 (weeks))
								</th>
								<th>Edit</th>
								<th>Delete</th>
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
									<%-- <td><a href="classDelete.do?ccode=${list.ccode}">Delete</a></td> --%>
									<td><a href="#" onclick="openModal()">Delete</a></td>
										<!-- modal 호출 -->
										<div class="modal" id="delete_modal">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
														<h3 class="modal-title">Caution</h3>
													</div>
													<div class="modal-body">
														<p style="font-size: 20px;">Are you sure you want to delete this data?</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
														<button type="button" class="btn btn-primary" >Delete</button>
													</div>
												</div>
											</div>
										</div>
									</td>		
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
		
		<!-- 과목 등록 부분 -->
		<div class="tab-pane fade" id="cregister">
			<form method="get" action="register.do">
				<div class="form-group has-error">
					<label class="control-label" for="inputError">Class Code
						(과목 코드)</label> <input type="text" class="form-control" name='ccode'
						id='ccode'>
				</div>
				<div class="form-group has-error">
					<label class="control-label" for="inputError">Class Name
						(과목 명)</label> <input type="text" class="form-control" name='ctitle'
						id='ctitle'>
				</div>
				<div class="form-group has-error">
					<label class="control-label" for="inputError">Class Hour(과목 총 수업시간:hour)</label> 
					<select class="form-control" name='chour' id='chour'>
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
				<div class="form-group has-error">
					<label class="control-label" for="inputError">Class Credit
						(과목 배점:weeks)</label> <select class="form-control" name='cscore'
						id='cscore'>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>
				<div class="form-group">
					<div class="col-lg-10">
						<button type="reset" class="btn btn-default">Cancel</button>
						<button type="submit" class="btn btn-primary" onclick="calldelete(${list.code})">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
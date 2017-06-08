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

</script>
</head>
<body>
	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home " data-toggle="tab">Open Class Check(개설 조회)</a></li>
		<li><a href="#openclass" data-toggle="tab">Open Class (과목 개설)</a></li>
	</ul>
	
	<!-- tab안에 들어가는 내용 -->
	<div id="myTabContent" class="tab-content">	
	
		<!-- 개설 과목 조회 부분 -->
		<div class="tab-pane fade active in" id="home">
			<form method="get" action="openClassCheck.do">
				<div style="overflow: scroll; height: 550px;">
					<table class="table table-striped table-hover ">
						<thead id="thead">
							<tr style="color: #b94a48;">
								<th>#</th>
								<th>Class Code<br />(과목코드)
								</th>
								<th>Open Code<br />(개설 코드)
								</th>
								<th>Open Date<br />(개설 날짜)
								</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="openclasslist" items="${openclasslist}">
								<tr id="dplist" class="active">
									<td><a href="#">#</a></td>
									<td><a href="#">${openclasslist.ccode}</a></td>
									<td><a href="#">${openclasslist.createcode}</a></td>
									<td><a href="#">${openclasslist.createdate}</a></td>
									<td><a href="#">Edit</a></td>
									<td><a href="#">Delete</a></td>	
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
		
		<!-- 과목 개설 부분 -->
		<div class="tab-pane fade" id="openclass" >
			<form method="get" action="openClassRegister.do">
				<div class="form-group has-error">
					<label class="control-label" for="inputError">Class Code (과목 코드)</label> 
					<input type="text" class="form-control" name='ccode' id='ccode'>
					<%-- <label class="control-label" for="inputError">Class Code (과목 코드)</label> 
					<select class="form-control" name='chour' id='chour'>
						<c:forEach>
							<option>8</option>
						</c:forEach>
					</select> --%>	
				</div>
				<div class="form-group has-error">
					<label class="control-label" for="inputError">Open Code (개설 코드)</label> 
					<input type="text" class="form-control" name='createcode' id='createcode'>
				</div>
				<div class="form-group has-error">
					<label class="control-label" for="inputError">Open Date (개설 날짜)</label> 
					<input type="text" class="form-control" name='createdate' id='createdate'>
				</div>
				<div class="form-group">
					<div class="col-lg-10">
						<button type="reset" class="btn btn-default">Cancel</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
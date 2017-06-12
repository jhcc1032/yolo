<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<link href="/yolo/resources/css/jquery-ui.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="/yolo/resources/js/jquery.min.js">
	$(function() {
		$("#createdate").datepicker({

		});
	});
</script>
<script type="text/javascript" src="/yolo/resources/js/jquery-ui.min.js">
	$(function() {
		$("#createdate").datepicker({

		});
	});
</script>
<script>
	$(function() {
		$("#createdate").datepicker({
			//numberOfMonths: [2,2],
			changeMonth : true,
			changeYear : true,
			//showButtonPanel: true,
			nextText : '다음 달',
			prevText : '이전 달',
			//currentText: '오늘 날짜', 
			closeText : '닫기',
			dateFormat : "yy-mm-dd"
		});
	});
</script>
<script type="text/javascript">
	// modal open
	function openModal() {
		$('.modal').modal('show');
	}
</script>
</head>
<body>

	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home " data-toggle="tab">Open
				Class Check(개설 조회)</a></li>
		<li><a href="#openclass" data-toggle="tab">Open Class (과목 개설)</a></li>
	</ul>

	<!-- tab안에 들어가는 내용 -->
	<div id="myTabContent" class="tab-content">
		<!--  							-->
		<!--  							-->
		<!--  							-->
		<!-- 개설과목 조회 tab			-->
		<!--  							-->
		<!--  							-->
		<!--  							-->
		<div class="tab-pane fade active in" id="home">
			<form method="get" action="openClassCheck.do">
				<div style="overflow: scroll; height: 550px;">
					<table class="table table-striped table-hover ">
						<thead id="thead">
							<tr style="color: #b94a48;">
								<th>#</th>
								<th>개설코드</th>
								<th>과목코드(과목명)</th>	
								<th>교육기관</th>
								<th>교육유형</th>
								<th>강사명</th>			
								<th>개설날짜</th>
								<th>자세히보기</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="openclasslist" items="${openclasslist}">
								<tr id="dplist" class="active">
									<td><a href="#">#</a></td>
									<td><a href="#">${openclasslist.createcode}</a></td>
									<td><a href="#">${openclasslist.ccode}</a></td>
									<td><a href="#">${openclasslist.cinstitution}</a></td>
									<td><a href="#">${openclasslist.ctype}</a></td>
									<td><a href="#">${openclasslist.cinstructor}</a></td>					
									<td><a href="#">${openclasslist.createdate}</a></td>
									<td><a href="openClassDetailedView.do?createcode=${openclasslist.createcode}">자세히보기</a></td>
									<td><a href="openClassupdateForm.do?createcode=${openclasslist.createcode}">수정</a></td>
									<td><a href="openClassDelete.do?createcode=${openclasslist.createcode}">삭제</a></td>
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

		<!--  							-->
		<!--  							-->
		<!--  							-->
		<!-- 등록되어있는 과목 개설 tab	-->
		<!--  							-->
		<!--  							-->
		<!--  							-->
		<div class="tab-pane fade" id="openclass">
			<form method="get" action="openClassRegister.do">
				<div class="col-lg-10" >
					<div class="form-group has-error">
						<label class="control-label" for="inputError">교육유형</label>
						<div>
							<div class="radio">
								<label> 
									<input type="radio" name="ctype" id="ctype" value="전체" checked="option1">전체
								</label> 
								<label> 
									<input type="radio" name="ctype" id="ctype" value="인턴">인턴교육
								</label>
								<label> 
									<input type="radio" name="ctype" id="ctype" value="직원">직원교육
								</label>
							</div>
						</div>
					</div>
					<div class="form-group has-error" style="width: 270px;">
						<label class="control-label" for="inputError">과목 코드</label> 
							<select class="form-control" name='ccode' id='ccode'>
							<!--  이곳에 등록된 과목코드를 추출해서 select창에 보여줄 수 있어야 함. -->
							<c:choose>
								<c:when test="${!empty classinfo}">
									<c:forEach var="list" items="${classinfo}">
										<option value="${list.ccode}">${list.ccode}
											(${list.ctitle})</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option>등록된 과목이 존재하지 않습니다. 먼저 과목을 등록하세요.</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">개설 날짜</label> 
						<input type="text" class="form-control" name='createdate' id='createdate'>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">교육기관</label> 
						<input type="text" class="form-control" name='cinstitution' id='cinstitution' value="한전KDN">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">강사</label> 
						<input type="text" class="form-control" name='cinstructor' id='cintructor'>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">교재</label> 
						<input type="text" class="form-control" name='cbook' id='cbook'>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">평가형식</label>
						<div>
							<textarea class="form-control" rows="3" id="cevaluation" name="cevaluation"></textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">과정소개</label>
						<div>
							<textarea class="form-control" rows="3" id="cintroduction" name="cintroduction"></textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">학습목표</label>
						<div>
							<textarea class="form-control" rows="3" id="cgoal" name="cgoal"></textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">과정목차</label>
						<div>
							<textarea class="form-control" rows="3" id="clist" name="clist"></textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">강사소개</label>
						<div>
							<textarea class="form-control" rows="3" id="cinstintro"
								name="cinstintro"></textarea>
						</div>
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
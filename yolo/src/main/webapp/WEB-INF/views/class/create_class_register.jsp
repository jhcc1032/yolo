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

<link href="/yolo/resources/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/yolo/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/yolo/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript">
	// 충돌 방지
	$.noConflict();
	jQuery( document ).ready(function($){
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
	});

	// modal open
	function openModal(createcode){
		$('#createclasscode').val(createcode);
		$('.modal').modal('show');
	}
</script>

</head>
<body>

	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home " data-toggle="tab">교육과정 조회</a></li>
		<li><a href="#openclass" data-toggle="tab">교육과정 개설</a></li>
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
			<form method="get" action="createClassCheck.do">
				<div style="overflow: scroll; height: 550px;">
					<table class="table table-striped table-hover ">
						<thead id="thead">
							<tr style="color: #b94a48;">
								<th>#</th>
								<th>교육과정명</th>	
								<!-- <th>교육기관</th> -->
								<th>교육유형</th>
								<th>강사명</th>			
								<th>개설날짜</th>
								<th>상세보기</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="classtotallist" items="${classtotalinfo}">
								<tr id="dplist" class="active">
									<td><a href="#">#</a></td>
									<td><a href="#">${classtotallist.ctitle}</a></td>
									<%-- <td><a href="#">${classtotallist.cinstitution}</a></td> --%>
									<td><a href="#">${classtotallist.ctype}</a></td>
									<td><a href="#">${classtotallist.cinstructor}</a></td>					
									<td><a href="#">${classtotallist.createdate}</a></td>
									<td><a href="createClassDetailedView.do?createcode=${classtotallist.createcode}" class="btn btn-primary">상세</a></td>
									<td><a href="createClassUpdateForm.do?createcode=${classtotallist.createcode}" class="btn btn-primary">수정</a></td>
									<td><a href="#" onclick="openModal(${classtotallist.createcode})" class="btn btn-primary">삭제</a></td>
									<!-- <td><a data-toggle="modal" href="#createclassdeletemodal" class="btn btn-primary">삭제</a></td> -->
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
			<form method="get" action="createClassRegister.do">
				<div class="col-lg-10" >
					<div class="form-group has-error">
						<label class="control-label" for="inputError">교육유형</label>
						<div>
							<div class="radio">
								<label> 
									<input type="radio" name="ctype" id="ctype" value="전체" checked="checked">전체
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
					<div class="form-group has-error" style="width: 400px;">
						<label class="control-label" for="inputError">교육과정(코드)</label> 
							<select class="form-control" name='ccode' id='ccode'>
							<!--  이곳에 등록된 과목코드를 추출해서 select창에 보여줄 수 있어야 함. -->
							<c:choose>
								<c:when test="${!empty classinfo}">
									<c:forEach var="list" items="${classinfo}">
										<option value="${list.ccode}">
											${list.ctitle}(${list.ccode})</option>
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
						<input type="text" class="form-control" name='createdate' id='createdate' >
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
	
	<!-- 모달 창  -->
	<!-- 모달 창  -->
	<!-- 모달 창  -->
	<!-- 모달 창  -->
	<!-- 모달 창  -->
	<!-- 모달 창  -->
	<div class="modal" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h2 class="modal-title">정말 삭제하시겠습니까?</h2>
				</div>
				<form method="get" action="createClassDelete.do">
					<input type="hidden" id="createclasscode" name="createcode" />
					<div class="modal-body">
						<p>개설된 교육과정을 삭제합니다.</p>	
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">삭제</button>
					</div>
				</form>	
			</div>
		</div>
	</div>
</body>
</html>
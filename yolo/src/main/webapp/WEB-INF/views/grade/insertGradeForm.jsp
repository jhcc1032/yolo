<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목별 수강생</title>
<script type="text/javascript">
	$(function() {
		$("#addQuiz").click(addQuizForm);
	});
	var count = 1; //file form index
	var id;
	function addQuizForm() {
		var html = "<div id='quiz_"+id+count+"'><div class='form-group'><label for='quizup' class='col-lg-2 control-label'>Quiz "
				+ count + "</label><div class='col-lg-10'>"
		html += "<input type='text' class='form-control' name='quizup_"+count+"' id='quizup_"+count+"' /></div></div></div>";
		$("#quizUpForm").append(html);

		count++;
	}

	function openmodal(mid) {
		id = mid;
		$(this).removeData();
		$("#quizmodal").modal();

	}

	function quizScore() {
		var score = 0;
		for (var i = 1; i < count; i++) {
			score += parseInt($("#quizup_" + i).val());
		}
		$("#quiz_" + id).val(score);

	}
	function removeForm() {
		count--;
		var item = document.getElementById('quiz_' + id + count);
		if (item != null) {

			item.parentNode.removeChild(item);
		}
	}
</script>


<style type="text/css">
.form-control {
	width: 60px;
	height: 25px;
	padding-left: 10px;
}

.form-group {
	padding-left: 25px;
}

th {
	text-align: center;
}

td {
	text-align: center;
}
</style>
</head>

<body>
	<form action="insertGrade.do" method="post">

		<div id="drop">
			<ul class="nav nav-pills">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> 과목선택 <span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<c:forEach var="subjects" items="${slist}">
							<li><a
								href="insertGradeForm.do?createcode=${subjects.createcode }&cscore=${subjects.cscore}">${subjects.ctitle}</a></li>
						</c:forEach>
					</ul></li>
			</ul>
		</div>

		<div>
			<table class="table table-striped table-hover">
				<thead>
					<tr class="warning">
						<th>아이디</th>
						<th>이름</th>
						<th>퀴즈</th>
						<th>과제</th>
						<th>시험</th>
						<th>태도</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="mlist" items="${mlist}">
						<tr>
							<td>${mlist.id }</td>
							<td>${mlist.name }</td>
							<td><div class="form-group">
									<div class="col-lg-10">
										<input type="text" class="form-control" id="quiz_${mlist.id }"
											name="quiz" /> <a href="#"
											onclick="openmodal('${mlist.id}')" data-toggle="modal"
											class="btn btn-primary btn-sm">입력</a>
									</div>
								</div></td>
							<td><div class="form-group">
									<div class="col-lg-10">
										<input type="text" class="form-control" id="homework"
											name="homework">
									</div>
								</div></td>
							<td><div class="form-group">
									<div class="col-lg-10">
										<input type="text" class="form-control" id="exam" name="exam">
									</div>
								</div></td>
							<td><div class="form-group">
									<div class="col-lg-10">
										<input type="text" class="form-control" id="attitude"
											name="attitude" value="20">
									</div>
								</div></td>

						</tr>

					</c:forEach>

				</tbody>

			</table>

			<div class="modal" id="quizmodal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Quiz Score</h4>
						</div>


						<div class="modal-body">

							<a href="#addQuiz" id="addQuiz" class="btn btn-primary btn-sm">퀴즈추가</a>
							<a href='#' class='btn btn-default' id="deletequiz"
								onclick="removeForm()">삭제</a>

							<form id="frm">
								<table>
									<tr height="50">
										<td colspan="2" id="quizUpForm"></td>
									</tr>
								</table>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary"
								onclick="quizScore()" data-dismiss="modal">Save</button>
						</div>

					</div>
				</div>
			</div>

		</div>
	</form>
</body>
</html>
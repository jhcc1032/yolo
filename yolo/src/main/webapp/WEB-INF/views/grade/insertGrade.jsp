<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#addQuiz").click(addQuizForm);
		$("#addHw").click(addHwForm);
	});

	var qzcount = 1; //file form index
	var hwcount = 1; //file form index

	var tmp = 0;
	var cscore = 0;
	var param = 'cscore';
	var url = location.href;
	var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

	var id;

	function addQuizForm() {

		var html = "<div id='quiz_"+qzcount+"'><div class='form-group'><label for='quizup' class='col-lg-2 control-label'>Quiz "
				+ qzcount + "</label><div class='col-lg-10'>"
		html += "<input type='text' class='form-control' name='quizup_"+qzcount+"' id='quizup_"+qzcount+"' /></div></div></div>";
		$("#quizUpForm").append(html);

		qzcount++;
	}
	function addHwForm() {
		var html = "<div id='hw_"+hwcount+"'><div class='form-group'><label for='hwup' class='col-lg-2 control-label'>HW "
				+ hwcount + "</label><div class='col-lg-10'>"
		html += "<input type='text' class='form-control' name='hwup_"+hwcount+"' id='hwup_"+hwcount+"' /></div></div></div>";
		$("#hwUpForm").append(html);

		hwcount++;
	}

	function openquizmodal(mid) {
		id = mid;
		$("#quizmodal").modal();

	}

	function openhwmodal(mid) {
		id = mid;
		$("#hwmodal").modal();

	}

	function quizScore() {

		var score = 0;

		for (var i = 0; i < parameters.length; i++) {
			var varName = parameters[i].split('=')[0];
			if (varName.toUpperCase() == param.toUpperCase()) {
				tmp = parameters[i].split('=')[1];
				cscore = decodeURIComponent(tmp);
			}
		}

		for (var i = 1; i < qzcount; i++) {
			score += parseInt($("#quizup_" + i).val());
		}

		var avg = ((((parseInt(score) * 0.01))) * ((((parseInt(cscore)) * 10)) / (parseInt(qzcount - 1))));
		if (cscore == 2 || cscore == '2#addQuiz' || cscore == '2#addHw'
				|| cscore == '2#')
			avg = avg / 2;

		$("#quiz_" + id).val(score);
		$("#quizscore_" + id).val(avg.toFixed(2));

	}
	function hwScore() {
		var score = 0;
		for (var i = 0; i < parameters.length; i++) {
			var varName = parameters[i].split('=')[0];
			if (varName.toUpperCase() == param.toUpperCase()) {
				tmp = parameters[i].split('=')[1];
				cscore = decodeURIComponent(tmp);
			}
		}

		for (var i = 1; i < hwcount; i++) {
			score += parseInt($("#hwup_" + i).val());
		}

		var avg = ((((parseInt(score) * 0.01))) * ((((parseInt(cscore)) * 10)) / (parseInt(hwcount - 1))));

		if (cscore == 2 || cscore == '2#addQuiz' || cscore == '2#addHw'
				|| cscore == '2#')
			avg = avg / 2;

		$("#hw_" + id).val(score);
		$("#hwscore_" + id).val(avg.toFixed(2));

	}
	function removeqzForm() {
		if (qzcount > 1) {
			qzcount--;
		}

		var item = document.getElementById('quiz_' + qzcount);
		if (item != null) {

			item.parentNode.removeChild(item);
		}
	}
	function removehwForm() {
		if (hwcount > 1) {
			hwcount--;
		}
		var item = document.getElementById('hw_' + hwcount);
		if (item != null) {

			item.parentNode.removeChild(item);
		}
	}

	function calTotal(mid, createcode) {
		id = mid;
		var quiz = document.getElementById('quizscore_' + id).value;
		var hw = document.getElementById('hwscore_' + id).value;
		var exam = document.getElementById('exam_' + id).value;
		var atti = document.getElementById('attitude_' + id).value;

		var total = ((parseInt(quiz * 100) + parseInt(hw * 100) + parseInt(exam * 100)) / 100 + parseInt(atti))
				.toFixed(2);

		location.href = "insertScore.do?createcode=" + createcode + "&id=" + id
				+ "&score=" + total + "&cscore=" + cscore;

	}
</script>
<style type="text/css">
.input-group{
	width: 150px;
}

.form-control {
	width: 100px;
}
</style>
</head>
<body>

	<table class="table table-striped table-hover">

		<tr>
			<th>퀴즈</th>
			<td><div class="form-group">
					<div class="input-group">
						<input type="text" id="quizscore_${userid }"
							class="form-control" disabled=""> <span class="input-group-btn">
							<a href="#" onclick="openquizmodal('${userid}')"
							data-toggle="modal" class="btn btn-default">입력</a>
						</span>
					</div>
				</div></td>
			<%-- <td><input class="form-control" id="quizscore_${userid }"
				type="text" disabled=""></td>
			<td><a href="#" onclick="openquizmodal('${userid}')"
				data-toggle="modal" class="btn btn-primary btn-sm">입력</a></td> --%>
		</tr>


		<tr>
			<th>과제</th>

			<td><div class="form-group">
					<div class="input-group">
						<input type="text" id="hwscore_${userid }"
							class="form-control" disabled=""> <span class="input-group-btn">
							<a href="#" onclick="openhwmodal('${userid}')"
							data-toggle="modal" class="btn btn-default">입력</a>
						</span>
					</div>
				</div></td>
			<%-- <td><input class="form-control" id="hwscore_${userid }"
				type="text" disabled=""></td>
			<td><a href="#" onclick="openhwmodal('${userid}')"
				data-toggle="modal" class="btn btn-primary btn-sm">입력</a></td> --%>
		</tr>

		<tr>
			<th>시험</th>

			<td><input type="text" class="form-control" id="exam_${userid }"
				name="exam"></td>
		</tr>


		<tr>
			<th>태도</th>

			<td><input type="text" class="form-control"
				id="attitude_${userid }" name="attitude" value="20"></td>
		</tr>
		<tr>
			<td colspan="3"><a href="#"
				onclick="calTotal('${userid}' ,'${createcode }')"
				data-toggle="modal" class="btn btn-primary">전송</a></td>
		</tr>
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
						onclick="removeqzForm()">삭제</a>


					<table>
						<tr height="50">
							<td colspan="2" id="quizUpForm"></td>
						</tr>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="quizScore()"
						data-dismiss="modal">Save</button>
				</div>

			</div>
		</div>
	</div>

	<div class="modal" id="hwmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">HomeWork Score</h4>
				</div>


				<div class="modal-body">

					<a href="#addHw" id="addHw" class="btn btn-primary btn-sm">과제추가</a>
					<a href='#' class='btn btn-default' id="deletehw"
						onclick="removehwForm()">삭제</a>


					<table>
						<tr height="50">
							<td colspan="2" id="hwUpForm"></td>
						</tr>
					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="hwScore()"
						data-dismiss="modal">Save</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
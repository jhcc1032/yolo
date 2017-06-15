<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.frame {
	width: 350px;
	display: inline-block;
}
</style>

</head>
<body>
	<form>

		<div class="form-group has-error frame">
			<select class="form-control" name='mlist' id='mlist'
				onchange="location.href=this.value">
				<option>과목선택</option>
				<c:choose>
					<c:when test="${role == '관리자'}">
						<c:forEach var="subjects" items="${slist}">

							<c:choose>
								<c:when test="${createcode == subjects.createcode }">
									<option
										value="totalScoreInfo.do?cscore=${subjects.cscore}&createcode=${subjects.createcode }&ctitle=${subjects.ctitle }"
										selected="selected">${subjects.ctitle}</option>
								</c:when>
								<c:otherwise>
									<option
										value="totalScoreInfo.do?cscore=${subjects.cscore}&createcode=${subjects.createcode }&ctitle=${subjects.ctitle }">${subjects.ctitle}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:when test="${role == '강사'}">
						<c:forEach var="subjects" items="${slist}">
							<c:choose>
								<c:when test="${createcode == subjects.createcode }">
									<option
										value="gradeStatisticsForm.do?cscore=${subjects.cscore}&createcode=${subjects.createcode }&ctitle=${subjects.ctitle }"
										selected="selected">${subjects.ctitle}</option>
								</c:when>
								<c:otherwise>
									<option
										value="gradeStatisticsForm.do?cscore=${subjects.cscore}&createcode=${subjects.createcode }&ctitle=${subjects.ctitle }">${subjects.ctitle}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
				</c:choose>
			</select>
		</div>

		<div>
			<table class="table table-striped table-hover">
				<thead>
					<tr class="warning">
						<th>아이디</th>
						<th>이름</th>
						<th>입력여부</th>
						<th>총점</th>
						<th>석차</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="mlist" items="${list}">
						<tr>
							<td>${mlist.id }</td>
							<td>${mlist.name }</td>
							<c:choose>
								<c:when test="${mlist.score != null && mlist.score != 0 }">
									<td>완료</td>
									<td>${mlist.score}</td>

								</c:when>
								<c:otherwise>
									<td>미입력</td>
									<td>${mlist.score }</td>
								</c:otherwise>
							</c:choose>
							<td>${mlist.rank }</td>

						</tr>

					</c:forEach>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">평균</td>
						<td colspan="2">${avg }</td>
					</tr>
				</tfoot>

			</table>

		</div>
	</form>
</body>
</html>
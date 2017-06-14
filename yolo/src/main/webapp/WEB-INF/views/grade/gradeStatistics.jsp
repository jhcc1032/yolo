<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>

		<div id="drop">
			<ul class="nav nav-pills">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> 과목선택 <span
						class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<c:forEach var="subjects" items="${slist}">
						<li><a href="totalScoreInfo.do?cscore=${subjects.cscore}&createcode=${subjects.createcode }&ctitle=${subjects.ctitle }">${subjects.ctitle}</a></li>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</div>
		<span>${ctitle}</span>

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

			</table>

		</div>
	</form>
</body>
</html>
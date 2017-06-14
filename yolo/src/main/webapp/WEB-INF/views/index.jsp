
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KDN Board Project</title>

<link href="/yolo/resources/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="/yolo/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />

<style type="text/css">
body {
	margin: 0 auto;
	width: 1000px;
	padding: 22px 0;
	background: #F0F0F0;
}

#head {

}

#private ul {
	margin: 0 auto;
	width: 150px;
	list-style: none;
}

#private  ul li {
	float: left;
}

#private  ul li a {
	display: block;
	margin-right: 20px;
	width: 140px;
	font-size: 14px;
	line-height: 44px;
	text-align: center;
	text-decoration: none;
	color: #ffffff;
}

#content {
	width: 100%;
	display: table;
	height: 700px;
}

#menu {
	display: table-cell;
	width: 20%;
	background-color: white;
	border: #006600 1px solid;
	height: 700px;
}


#menu  ul li {
	float: left;
}

#menu a {
	display: block;
	margin-right: 20px;
	width: 140px;
	font-size: 14px;
	line-height: 44px;
	text-align: center;
	text-decoration: none;
	color: #777;
}

#mainContent {
	display: table-cell;
	width: 80%;
	margin: 0 auto;
	padding-right: 22px;
}

footer {
	margin: 0 auto;
	width:100%;
	height: 100px;
	color: white;
	background-color: #e95420;
	border-radius: 6px;
}
#logo{
	display: inline;
}


#welcome{
	float: right;
	padding-top:20px;
}
.nav navbar-nav li {
	padding-left: 10px;
	padding-right: 10px;
}
</style>

<script type="text/javascript" src="/yolo/resources/js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="/yolo/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="/yolo/resources/js/npm.js"></script>
<script type="text/javascript" src="/yolo/resources/js/progress.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
	<div id="head">
		<div id="logo"><a href="home.do"><img src="/yolo/resources/images/logo.gif"
			style="height: 40px"></a></div>
		<div id="welcome">
			<c:choose>
					<c:when test="${empty id}">
						로그인 해주세요
					</c:when>
					<c:otherwise>
						${id}(${role})님 환영합니다.
					</c:otherwise>
				</c:choose>
		</div>
		<div class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<a href="home.do" class="navbar-brand">HOME</a>
				</div>
				<div class="navbar-collapse collapse" id="navbar-main">
					<ul class="nav navbar-nav">
						<li><a href="listNoticeBoard.do">공지사항</a></li>
						<li><a href="listHomeworkBoard.do">과제게시판</a></li>
						<li><a href="listQnaBoard.do">Q&A게시판</a></li>
					</ul>
									
				</div>
				
			</div>	
		</div>
	</div>
	<article id="content">
		<aside class="sidemenu">
			<div class="panel panel-danger" style="text-align: center;">		
				<c:choose>
					<c:when test="${empty id}">
						<div class="panel-heading">
							<h2 class="panel-title">안녕하세요</h2>
						</div>		
						<div class="panel-body"><a href="loginform.do" class="list-group-item">로그인</a></div>
						<div class="panel-body"><a href="insertMemberForm.do" class="list-group-item">회원가입</a></div>
					</c:when>
					<c:otherwise>
					<c:choose>
						<c:when test="${role == '인턴'}">
							<div class="panel-heading"><h2 class="panel-title">안녕하세요^^</h2></div>
							<div class="panel-heading"><h2 class="panel-title">${name} 인턴 님</h2></div>
							<div class="panel-body"><a href="openRegisterCourseForm.do">수강신청</a></div>
							<div class="panel-body"><a href="#">성적열람</a></div>
						</c:when>
						<c:when test="${role == '강사'}">
							<div class="panel-heading"><h2 class="panel-title">안녕하세요^^</h2></div>
							<div class="panel-heading"><h2 class="panel-title">${name} 강사 님</h2></div>	
							<div class="panel-body"><a href="insertGradeForm.do?createcode=0&cscore=0">성적입력</a></div>
						</c:when>
						<c:when test="${role == '관리자'}">
							<div class="panel-heading"><h2 class="panel-title">안녕하세요^^</h2></div>
							<div class="panel-heading"><h2 class="panel-title">${name} 관리자 님</h2></div>
							<div class="panel-body"><a href="allMemberList.do">모든회원정보</a></div>
							<div class="panel-body"><a href="registerForm.do">교육과정 등록</a></div>
							<div class="panel-body"><a href="createClassForm.do">교육과정 개설</a></div>
							<div class="panel-body"><a href="insertGradeForm.do">성적입력</a></div>
							<div class="panel-body"><a href="#">통계</a></div>
						</c:when>
					</c:choose>
					<div class="panel-body"><a href="pwcheck.do">회원정보 수정</a></div>
					<div class="panel-body"><a href="myPage.do">마이페이지</a></div>
					<div class="panel-body"><a href="logout.do">로그아웃</a></div>
					</c:otherwise>
				</c:choose>
			</div>
		</aside>
		<article id="mainContent">
			<c:choose>
				<c:when test="${!empty content}">
					<jsp:include page="${content}" />
				</c:when>
				<c:otherwise>
					<jsp:include page="home.jsp"/>
				</c:otherwise>
			</c:choose>
		</article>
	</article>
	<footer id="copyright" style="margin-top: 10px;">
		<table align="center">
			<jsp:include page="copyright.jsp"/>
		</table>
	</footer>
</body>
</html>





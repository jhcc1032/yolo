<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KDN Board Project</title>

<link href="/yolo/resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
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
	background-color: green;
	display: table-cell;
	width: 80%;
	margin: 0 auto;
	padding-right: 22px;
}

footer {
	margin: 0 auto;
	width:100%;
	height: 100px;
	background: #555;
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
		<div id="logo"><a href="#"><img src="/yolo/resources/images/logo.gif"
			style="height: 40px"></a></div>
		<div id="welcome">
			<c:choose>
					<c:when test="${empty id}">
						환영합니다.
					</c:when>
					<c:otherwise>
						${id}님 환영합니다.
					</c:otherwise>
				</c:choose>
		</div>
		<div class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<a href="/" class="navbar-brand">YOLO</a>
				</div>
				<div class="navbar-collapse collapse" id="navbar-main">
					<ul class="nav navbar-nav">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">과제게시판</a></li>
						<li><a href="#">Q&A게시판</a></li>
					</ul>
									
				</div>
				
			</div>
		</div>
	</div>
	<article id="content">
		<aside>
			<nav id="menu">
				<c:choose>
					<c:when test="${empty id}">
						<a href="loginform.do">로그인</a>		
						<a href="insertMemberForm.do">회원가입</a>
					</c:when>
					<c:otherwise>
						<a href="logout.do">로그아웃</a><
						<a href="memberUpdateForm.do">회원정보수정</a>
						<a href="myPage.do">myPage</a><
					</c:otherwise>
				</c:choose>
			</nav>
		</aside>
		<article id="mainContent">
			<c:choose>
				<c:when test="${!empty content}">
					<jsp:include page="${content}" />
				</c:when>
				<c:otherwise>
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown">
							<i class="icon-th-large"></i>
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>1</li>
							<li>2</li>
							<li>3</li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</article>
	</article>
	<footer id="copyright">
		<table align="center">
			<tr>
				<td>(우)520-350 전라남도 나주시 빛가람로 661 대표전화: 061-931-6614<br />
					한전KDN(주) All rights reserved
				</td>
			</tr>
		</table>
	</footer>
</body>
</html>





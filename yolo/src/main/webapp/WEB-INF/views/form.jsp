<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KDN Board Project</title>
<link href="css/basic.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<div id="head">
   <article id="logo"><img src="images/logo.gif"/></article>
   <nav id="private">
   	<ul>
		<c:choose>
		   <c:when test="${empty id}">
			<li><a href="loginform.do">로그인</a></li>
		   </c:when>
		   <c:otherwise>
		     <li><a href="logout.do">로그아웃</a></li>
		     <li><a href="memberUpdateForm.do">회원정보수정</a></li>
		     <li><a href="myPage.do">myPage</a></li>
		   </c:otherwise>
		</c:choose>
	</ul>
	</nav>
</div>
<article id="content"> 
	<aside>
		<nav id="menu">		
		 <a href="insertMemberForm.do">회원가입</a><br/>
		 <a href="listBoard.do">게시판</a>
		</nav>
	</aside>
	<article  id="mainContent">
		
	</article>
</article>		
<footer id="copyright">
<jsp:include page="copyright.jsp"/>
</footer>	
</body>
</html>





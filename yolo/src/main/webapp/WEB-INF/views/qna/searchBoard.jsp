<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" type="text/css" href="css/basic.css"  />
<script type="text/javascript">
	function init(){
		var writeBoard = document.getElementById("writeBoard");
		writeBoard.style.display="none";
		var viewBoard = document.getElementById("viewBoard");
		viewBoard.style.display="";
	}
	function updateForm(){
		var writeBoard = document.getElementById("writeBoard");
		writeBoard.style.display="";
		document.getElementById("viewBoard").style.display="none";
		document.getElementById("replys").style.display="none";
	}
	function updateBoard(){
		var frm = document.getElementById("updatefrm");
		frm.action="updateQnaBoard.do";
		frm.submit();
	}
	function deleteBoard(){
		var frm = document.getElementById("frm");
		frm.action="deleteQnaBoard.do";
		frm.submit();
	}
	function listBoard(){
		location.href="listHomeworkBoard.do?<%=request.getQueryString()%>";
	}
	function resetBoard(){
		var frm = document.getElementById("updatefrm");
		frm.title.value="";
		frm.content.value="";
	}
</script>
<style type="text/css">
	
	#replys{
		height: 500px;
		overflow: scroll;
	}
	
	#viewBoard {
		width: 80%;
		align: center;
		margin-left: 80px;
	}
	#replys {
		width: 80%;
		align: center;
		margin-left: 80px;
	}
</style>
</head>
<body onload="init()">
   <c:if test="${msg != null }"> 
    	<script type="text/javascript">  alert('${msg}');</script>
    </c:if>
	<div class="main" id="viewBoard" style="display:none;padding-left:20px">
	 	<form id="frm"  >
	 	    <input type ="hidden" name="no"  id="no" value="${board.no }" />
	 	    <input type ="hidden" name="query"  id="query" />
			<table class="table table-striped" >
				<tbody>
					<tr><td style="width:100px;"><h4><label for="title">Title</label></h4></td>
					    <td colspan="3"><h4>${board.title}</h4></td>
					</tr>
					<tr>
						<th style="text-align:cetner">Writer</th>
						<td>${board.id}</td>
						<th style="width:100px;">Date</th>
						<td>${board.regdate}</td>
					</tr>
					<tr><td colspan="4" height="50" ></td></tr>
					<tr><td colspan="4" height="250">
						${board.contents }							
						</td></tr>
				</tbody>
				<tfoot>
					<tr><td colspan="4" align="center">
						<input type="button" value="List" onclick="listBoard()" class="btn btn-default btn-sm" />
						<c:if test="${board.id == id || role =='관리자'}">
							<input type="button" onclick="updateForm()" value="Modify" class="btn btn-primary btn-sm" />
							<input type="button" value="Delete" onclick="deleteBoard()" class="btn btn-default btn-sm" />
						</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<br/><br/>
	
	<div id="replys">
		<form method="post" action="insertQnaBoardReply.do" enctype="multipart/form-data" >
			<input type="hidden" name="no" id="no" value="${board.no}" />
			<input type="hidden" name="writer" id="writer" value="<%= session.getAttribute("id") %>" />
			<input type="hidden" name="returnurl" value="<%=request.getQueryString()%>" />
			<table align="center" class="table table-striped">
					<tr>
						<td style="width:300px"><span style="font-weight:bold">Writer</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= session.getAttribute("id") %></td>
					
						<th style="width:100px">Date</th>
						<%
							Calendar cal = Calendar.getInstance();
						%>
						<td><%= cal.get(Calendar.MONTH)+1 %>-<%= cal.get(Calendar.DATE) %></td>
					</tr>
					<tr>
						<td id="replyTextArea" align="center" colspan="4" >
					    	<textarea class="form-control"name="contents" id="contents" rows="3"></textarea>
						</td>
					</tr>
					<tr><td colspan="3" align="center">
						<input type="submit" value="작성" class="btn btn-primary btn-sm" />
						<input type="reset" value="취소" class="btn btn-default btn-sm" />
					</td></tr>
			</table>
		</form>
		<div id="replylist">
		<c:forEach var="reply" items="${board.replys}">
			<div class="list-group">
	    		<h5 class="list-group-item-heading" style="font-weight:bold">${reply.writer}</h5>
		    	<p class="list-group-item-text">${reply.contents}</p>
		    	<span class="list-group-item-text">${reply.regdate}</span>
				<br/>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="main" id="writeBoard" style="display:none">
	 	<form  id="updatefrm" class="form-horizontal" method="get" action="updateQnaBoard.do">
	 	    <input type ="hidden" name="no"  id="no"  value="${board.no}"/>
	 	    <input type ="hidden" name="id"  id="id"  value="${board.id}"/>
	 	    <input type="hidden" name="returnurl" id="returnurl" value="<%=request.getQueryString()%>"/>
			
			<legend style="text-align:center">Modify Q&A Board</legend>
			<div class="form-group">
				<label for="inputTitle" class="col-lg-2 control-label">Title</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="title" name="title"
						value="${board.title}">
				</div>
			</div>
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Contents</label>
				<div class="col-lg-10">
					<textarea name="contents" id="contents" class="form-control"
						rows="3" id="textArea">${board.contents}</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<!-- <a href="#" onclick="updateBoard()"> Modfiy </a> -->
					<input type="submit" value="Modify" class="btn btn-primary btn-sm" />
					<input type="button" value="Reset" onclick="resetBoard()" class="btn btn-default btn-sm" />
					<input type="button" value="List" onclick="listBoard()" class="btn btn-default btn-sm" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>
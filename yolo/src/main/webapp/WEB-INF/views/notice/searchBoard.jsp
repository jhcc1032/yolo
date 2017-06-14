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
	}
	function updateBoard(){
		var frm = document.getElementById("updatefrm");
		frm.action="updateNoticeBoard.do";
		frm.submit();
	}
	function deleteBoard(){
		var frm = document.getElementById("frm");
		frm.action="deleteNoticeBoard.do";
		frm.submit();
	}
	function listBoard(){
		location.href="listNoticeBoard.do?<%=request.getQueryString()%>";
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
					<c:if test="${ not empty board.files }">
						<tr>
							<th style="text-align:cetner">Upload File</th>
							<td colspan="3">
								<c:forEach var="file" items="${ board.files }">
									<a href="filedown.do?sfilename=${file.sfileName}&rfilename=${file.rfileName}">${file.rfileName}</a><br />
								</c:forEach>
							</td>
						</tr>					
					</c:if>
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
	<div class="main" id="writeBoard" style="display:none">
	 	<form  id="updatefrm" class="form-horizontal" method="get" action="updateNoticeBoard.do">
	 	    <input type ="hidden" name="no"  id="no"  value="${board.no}"/>
	 	    <input type ="hidden" name="id"  id="id"  value="${board.id}"/>
	 	    <input type="hidden" name="returnurl" id="returnurl" value="<%=request.getQueryString()%>"/>
			
			<legend style="text-align:center">Modify Homework Board</legend>
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
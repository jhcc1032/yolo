<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" type="text/css" href="css/basic.css"  />
<script type="text/javascript">

	function init(dueDate){
		console.log(dueDate);
		var date = new Date(dueDate);
		var today = new Date();
		console.log(date);
		console.log(today);

	 	if(today > date) {
			document.getElementById("submitarea").innerHTML = "과제 제출 기한이 지났습니다.";
			document.getElementById("replys").style.display="none";
		}
		
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
		frm.action="updateHomeworkBoard.do";
		frm.submit();
	}
	function deleteBoard(){
		var frm = document.getElementById("frm");
		frm.action="deleteHomeworkBoard.do";
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
	$(function(){
		$("#addFile").click(addFileForm);
	});
	var count=0; //file form index
	function addFileForm(){
		var html="<div id='item_"+count+"'>"
		html+="<input type='file' name='fileup' class='btn btn-default btn-xs' /><br/>";
		html+="<input type='button' class='btn btn-danger btn-xs' value='삭제' onclick='removeForm("+count+")'/>";
		count++;
		//html=$("#content").html()+html;
		//$("#content").html(html);
		$("#fileUpForm").append(html);
	}
	function removeForm(count){
		var item = document.getElementById('item_'+count);
		if(item !=null) item.parentNode.removeChild(item);
	}

	
</script>
<style type="text/css">
	
	#replys{
		height: 500px;
		overflow: scroll;
	}
</style>
</head>
<body onload="init(${board.dueDate})">
    <c:if test="${msg != null }"> 
    	<script type="text/javascript">  alert('${msg}');</script>
    </c:if>
	<div class="main" id="viewBoard" style="display:none">
	 	<form id="frm"  >
	 	    <input type ="hidden" name="no"  id="no" value="${board.no }" />
	 	    <input type ="hidden" name="query"  id="query" />
			<table class="table table-striped" >
				<tbody>
					<tr><td style="width:100px;"><h4><label for="title">Title</label></h4></td>
					    <td colspan="3"><h4>${board.title}</h4></td>
					</tr>
					<tr>
						<td style="text-align:cetner">Writer</td>
						<td>${board.id}</td>
						<td style="width:100px;">Date</td>
						<td>${board.regdate}</td>
					</tr>
					<c:if test="${ not empty board.files }">
						<tr>
							<td style="text-align:cetner">Upload File</td>
							<td colspan="3">
								<c:forEach var="file" items="${ board.files }">
									<a href="filedown.do?sfilename=${file.sfileName}&rfilename=${file.rfileName}">${file.rfileName}</a><br />
								</c:forEach>
							</td>
						</tr>					
					</c:if>
					<tr><td colspan="4" height="50" ></td></tr>
					<tr><td colspan="4" height="400">
						${board.contents }							
						</td></tr>
				</tbody>
				<tfoot>
					<tr><td colspan="4" align="center">
						<a href="#" onclick="listBoard('frm')">List</a>
						<c:if test="${board.id == id }">
							<a href="#" onclick="updateForm()">Modify</a>
							<a href="#" onclick="deleteBoard()">Delete</a>
						</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<br/><br/>
	
	<div id="replys">
		<h4 align="center" id="submitarea">Submit Area (Due to ${board.dueDate})</h4>
		<br/><br/>
		<form method="post" action="insertHomeworkBoardReply.do" enctype="multipart/form-data" >
			<input type="hidden" name="no" id="no" value="${board.no}" />
			<input type="hidden" name="id" id="id" value="<%= session.getAttribute("id") %>" />
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
					<tr>
						<td colspan="2"><input type="button" name="addFile" id="addFile" value="Add File" class="btn btn-primary btn-xs"/></td>
					</tr>
						<td id="fileUpForm"></td>
					<tr><td colspan="3" align="center">
						<input type="submit" value="작성" class="btn btn-primary btn-sm" />
						<input type="reset" value="취소" class="btn btn-default btn-sm" />
					</td></tr>
			</table>
		</form>
		<div id="replylist">
		<%-- <table align="center" class="table table-striped">
			<c:forEach var="reply" items="${board.replys}">
				<tr>
					<th>${reply.writer}</th>
				</tr>
				<tr>
					<td>${reply.contents}</td>							
				</tr>
					<c:if test="${not empty role}">
						<c:if test="${role != '교육생' }">
							<c:if test="${ not empty reply.files}">
								<tr>
									<td>Uploaded File</td>
									<td>
										<c:forEach var="file" items="${ reply.files }">
											<a href="filedown.do?sfilename=${file.sfileName}&rfilename=${file.rfileName}">${file.rfileName}</a><br />
										</c:forEach>
									</td>
								</tr>
							</c:if>
						</c:if>
					</c:if>
						
					<c:if test="${reply.writer == id }">
						<c:if test="${ not empty reply.files}">
							<tr>
								<td>Uploaded File</td>
								<td>
									<c:forEach var="file" items="${ reply.files }">
										<a href="filedown.do?sfilename=${file.sfileName}&rfilename=${file.rfileName}">${file.rfileName}</a><br />
									</c:forEach>
								</td>
							</tr>
						</c:if>
					</c:if>
			</c:forEach>
			
		</table> --%>
		<c:forEach var="reply" items="${board.replys}">
			<div class="list-group">
	    		<h5 class="list-group-item-heading" style="font-weight:bold">${reply.writer}</h5>
		    	<p class="list-group-item-text">${reply.contents}</p>
		    	<c:if test="${reply.writer == id }">
					<c:if test="${ not empty reply.files}">
						<c:forEach var="file" items="${ reply.files }">
							<p style="text-align:right;padding-right:30px">Files: <a href="filedown.do?sfilename=${file.sfileName}&rfilename=${file.rfileName}">${file.rfileName}</a></p>
						</c:forEach>
					</c:if>
				</c:if>
				<br/>
			</div>
		
		
		</c:forEach>
		</div>
	</div>
	<div class="main" id="writeBoard" style="display:none">
	 	<form  id="updatefrm" class="form-horizontal">
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
					<a href="#" onclick="updateBoard()"> Modfiy </a> 
					<a href="#" onclick="resetBoard()"> Reset</a> 
					<a href="#" onclick="listBoard()"> List </a>
				</div>
			</div>
		</form>
	</div>
	
	
</body>
</html>
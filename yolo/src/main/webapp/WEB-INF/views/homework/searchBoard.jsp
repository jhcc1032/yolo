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
	var count=0;   //file form index
	function addFileForm(){
		var html="<div id='item_"+count+"'>"
		html+="<input type='file' name='fileup' />";
		html+="<input type='button' value='삭제' onclick='removeForm("+count+")'/></div>";
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
</head>
<body onload="init()">
    <c:if test="${msg != null }"> 
    	<script type="text/javascript">  alert('${msg}');</script>
    </c:if>
	<div class="main" id="viewBoard" style="display:none">
	 	<form id="frm"  >
	 	    <input type ="hidden" name="no"  id="no" value="${board.no }" />
	 	    <input type ="hidden" name="query"  id="query" />
			<table border="1" align="center" width="250px">
				<tbody>
					<tr><td><label for="title">제목</label></td>
					    <td>${board.title}</td>
					</tr>
					<c:if test="${ not empty board.files }">
						<tr>
							<td>업로드 파일</td>
							<td>
								<c:forEach var="file" items="${ board.files }">
									<a href="filedown.do?sfilename=${file.sfileName}&rfilename=${file.rfileName}">${file.rfileName}</a><br />
								</c:forEach>
							</td>
						</tr>					
					</c:if>
					<tr><td colspan="2">내용 &nbsp;&nbsp;글쓴이:${board.id}
										&nbsp;&nbsp; 게시일:${board.regdate}</td></tr>
					<tr><td colspan="2"  valign="top" height="200">
						<pre>${board.contents }</pre>							
						</td></tr>
				</tbody>
				<tfoot>
					<tr><td colspan="2" align="center">
						<a href="#" onclick="listBoard('frm')">목록</a>
						<c:if test="${board.id == id }">
							<a href="#" onclick="updateForm()">수정</a>
							<a href="#" onclick="deleteBoard()">삭제</a>
						</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<br/><br/>
	<h4 align="center">과제</h4>
	<div id="replys">
		<form method="post" action="insertHomeworkBoardReply.do" enctype="multipart/form-data" >
			<input type="hidden" name="no" id="no" value="${board.no}" />
			<input type="hidden" name="id" id="id" value="<%= session.getAttribute("id") %>" />
			<input type="hidden" name="returnurl" value="<%=request.getQueryString()%>" />
			<table align="center" width="250" border="1">
					<tr height="50"><td>작성자</td>
					    <td><%= session.getAttribute("id") %></td>
					</tr>
					<tr><td colspan="2"><label for="contents">내용</label></td></tr>
					<tr><td colspan="2" align="center">
					    <textarea name="contents" id="contents" cols="30" rows="3"></textarea>
					</td></tr>
					<tr><td colspan="2"><input type="button" name="addFile" id="addFile" value="파일 추가"/></td></tr>
					<tr height="25" ><td colspan="2" id="fileUpForm"></td></tr>
					<tr><td colspan="2" align="center">
						<input type="submit" value="작성"/>
						<input type="reset" value="취소"/>
					</td></tr>
			</table>
		</form>
		<table border="1" align="center" width="250px">
			<c:forEach var="reply" items="${ board.replys }">
				<tr><td colspan="2">&nbsp;글쓴이:${reply.writer}&nbsp;&nbsp; 게시일:${reply.regdate}</td></tr>
				<tr><td colspan="2"  valign="top"  height="80px">
					<pre>${reply.contents}</pre>							
					</td>
				</tr>
				<c:if test="${ not empty reply.files }">
					<tr>
						<td>업로드 파일</td>
						<td>
							<c:forEach var="file" items="${ reply.files }">
								<a href="filedown.do?sfilename=${file.sfileName}&rfilename=${file.rfileName}">${file.rfileName}</a><br />
							</c:forEach>
						</td>
					</tr>					
				</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="main" id="writeBoard" style="display:none">
	 	<form  id="updatefrm">
	 	    <input type ="hidden" name="no"  id="no"  value="${board.no}"/>
	 	    <input type ="hidden" name="id"  id="id"  value="${board.id}"/>
	 	    <input type="hidden" name="returnurl" id="returnurl" value="<%=request.getQueryString()%>"/>
			<table border="1" align="center">
				<caption>게시글 작성</caption>
				<tbody>
					<tr><td><label for="title">제목</label></td>
					    <td><input type="text" name="title" id="title" value="${board.title}"/></td>
					</tr>
					<tr><td colspan="2">내용</td></tr>
					<tr><td colspan="2">
						<textarea name="content" id="content" cols="30" rows="10">
							${board.contents}
						</textarea>
						</td></tr>
				</tbody>
				<tfoot>
					<tr><td colspan="2" align="center">
						<a href="#" onclick="updateBoard()"> 수정 </a> 
						<a href="#" onclick="resetBoard()"> 다시 쓰기</a> 
						<a href="#" onclick="listBoard()">목 록</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.yolo.model.domain.*"  %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:useBean 	id="pageBean"         class="com.yolo.model.domain.PageBean" 
				scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//조건 검색, 페이지 번호로 게시글 요청을 위한 메서드  
	function pagelist(cpage){
		//input 양식의 hidden으로 선언된 page에 요청된 페이지 정보 셋팅 
		document.getElementById("pageNo").value=cpage;
		var frm = document.getElementById("frm");
		frm.action="listQnaBoard.do";
		frm.submit();
	}
	//게시글 번호나 타이틀을 클릭하면 해당 게시글 요청을 위한 메서드 
	function getBoard(no){
		//input 양식의 hidden으로 선언된 no(게시글 번호)에 요청된 게시글 번호를 셋팅
		document.getElementById("no").value = no;
		var frm = document.getElementById("frm");
		frm.action="searchQnaBoard.do";
		frm.submit();
	}
	function writeboard() {
		location.href="insertQnaBoardForm.do"
	}
</script>
<style type="text/css">
	
	#key{
		float: right;
	}
	#inputbox{
		float: left;
	}
</style>
</head>
<body>
	<div class="main">
		<form id="frm">
			<input type="hidden" id="pageNo" name="pageNo" value="1" /> <input
				type="hidden" id="no" name="no" value="${board.no}" />
			<table align="center" class="table table-striped table-hover">
				<tr align="center">
					<th colspan="4" style="text-align:center"><h2 style="padding-left:50px">Q&A Board</h2></th>
				</tr>
				<tr align="center">
					<td style="padding-left:30px">
					 	<select name="key" id="key" class="form-control" style="width:100px;" >
									<option value="all">-----all-----</option>
									<option value="id" <%=pageBean.getKey("id")%>>id</option>
									<option value="title" <%=pageBean.getKey("title")%>>title</option>
									<option value="contents" <%=pageBean.getKey("contents")%>>contents</option>
						</select>				
					</td>
					<td colspan="3" height="100" align="center">
						<div class="form-group" id="inputbox">
						  <div class="input-group">
						    <input type="text" class="form-control" id="word" name="word" value="${pageBean.word}">
						    <span class="input-group-btn">
						      <button class="btn btn-default" type="button" onclick="pagelist(1)">search</button>
						    </span>
						    <span class="input-group-btn" style="padding-left:100px">
						      <button class="btn btn-default" type="button" onclick="writeboard()" >write</button>
						    </span>
						  </div>
						</div>
					<%-- <input type="text" id="word" name="word" value="${pageBean.word}" />
						<a href="#" onclick="pagelist(1)">검색</a> &nbsp;&nbsp;&nbsp; <a
						href="insertHomeworkBoardForm.do">글쓰기</a> --%>
					</td>
					
				</tr>
				<tr align="center">
					<th width="100" style="text-align:center;">No</th>
					<th width="150">Title</th>
					<th width="50" style="text-align:right;">Writer</th>
					<th width="100" style="text-align:center;">RegDate</th>
					<c:forEach var="board" items="${list}">
						<tr>
							<td style="text-align:center;">${board.roNum}</td>
							<td>
								<a href="#" onclick="getBoard(${board.no})">${board.title} (${board.replyCnt})</a>
							</td>
							<td style="text-align:right;">${board.id}</td>
							<td style="text-align:center;">${board.regdate}</td>
						</tr>
					</c:forEach>
				</tr>
			</table>
			<div class="bottom">
				<center>${pageBean.pagelink }</center>
			</div>
		</form>
	</div>
	
</body>
</html>














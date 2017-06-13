<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#addFile").click(addFileForm);
	});
	var count = 0; //file form index
	function addFileForm() {
		var html = "<div class='form-group'><div class='col-lg-10' id='item_"+count+"'>"
		html += "<input type='file'  class='form-control' name='fileup' />";
		html += "<input type='button' class='form-control' value='삭제' onclick='removeForm(" + count
				+ ")'/></div></div>";
		count++;
		//html=$("#content").html()+html;
		//$("#content").html(html);
		$("#fileUpForm").append(html);
	}
	function removeForm(count) {
		var item = document.getElementById('item_' + count);
		if (item != null)
			item.parentNode.removeChild(item);
	}
</script>
</head>
<body>
	<form method="post" action="insertHomeworkBoard.do"
		enctype="multipart/form-data" class="form-horizontal">
		<%-- <table align="center" width="300">
			<tr><th colspan="2"> 게시글 작성 </th></tr>
			<tr height="50"><td><label for="title">제목</label></td>
			    <td><input type="text" name="title" id="title"/></td>
			</tr>
			<tr height="50"><td><label for="title">아이디</label></td>
			    <td><input type="hidden" name="id" id="id" value="<%= session.getAttribute("id") %>"/><%= session.getAttribute("id") %></td>
			</tr>
			<tr height="50"><td><label for="title">비밀번호</label></td>
			    <td><input type="text" name="pw" id="pw"/></td>
			</tr>
			<tr height="50" ><td>업로드할 파일</td>
			    <td>
			    	<input type="button" name="addFile" id="addFile" value="파일 추가"/>
			    </td>
			</tr>
			<tr height="50" ><td colspan="2" id="fileUpForm"> </td>
			</tr>
			<tr><td colspan="2"><label for="contents">내용</label></td></tr>
			<tr><td colspan="2" align="center">
			    <textarea name="contents" id="contents" cols="30" rows="5"></textarea>
			</td></tr>
			<tr><td colspan="2" align="center">
				<input type="submit" value="작성"/>
				<input type="reset" value="취소"/>
			</td></tr>
	</table> --%>
		<fieldset>
			<legend>Write Homework Board</legend>
			<div class="form-group">
				<label for="inputTitle" class="col-lg-2 control-label">Title</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="Title">
				</div>
			</div>
			<div class="form-group">
				<label for="inputId" class="col-lg-2 control-label">ID</label>
				<div class="col-lg-10" style="padding-top:8px">
					<input type="hidden" class="form-control" id="id" name="id"
						value="<%=session.getAttribute("id")%>" />
					<span style="padding-top:5px;"><%=session.getAttribute("id")%></span>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">Password</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="inputFile" class="col-lg-2 control-label">File
					Upload</label>
				<div class="col-lg-10">
					<input type="button" class="form-control" name="addFile"
						id="addFile" value="Add File" />
					<div id="fileUpForm"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Contents</label>
				<div class="col-lg-10">
					<textarea name="contents" id="contents" class="form-control"
						rows="3" id="textArea"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="reset" class="btn btn-default">Cancel</button>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
	</form>
</body>
</html>
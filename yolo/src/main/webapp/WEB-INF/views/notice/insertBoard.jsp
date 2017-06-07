<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript">
$(function(){
	$("#addFile").click(addFileForm);
});
var count=0;   //file form index
function addFileForm(){
	var html="<div id='item_"+count+"'>"
	html+="<input type='file' name='fileup"+count+"' />";
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
<body>
<form method="post" action="insertBoard.do" enctype="multipart/form-data" >
	<table align="center" width="300">
			<tr><th colspan="2"> 게시글 작성 </th></tr>
			<tr height="50"><td><label for="title">제목</label></td>
			    <td><input type="text" name="title" id="title"/></td>
			</tr>
			<tr height="50"><td><label for="title">아이디</label></td>
			    <td><input type="text" name="id" id="id"/></td>
			</tr>
			<tr height="50" ><td><label for="fileup">업로드할 파일</label></td>
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
	</table>
</form>
</body>
</html>
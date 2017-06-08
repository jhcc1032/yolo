<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<link href="../css/basic.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function button_event(){
	if(confirm("정말 수정하시겠습니까?") == true){
		document.frm.submit();
	}else{
		return;
	}
}

</script>
</head>

<body>
<form method="post" action="updateMember.do" id="frm" name="frm">
<table  align='center' >
	<tr><td class="caption" colspan='2'>회원정보수정</td></tr>
	
	
	<tr><td class='tbasic'>아 이 디</td>
	    <td class='tbasic'><input type='hidden' name='id' value='${member.id}'>${member.id}</td>
	</tr>
	<tr><td class='tbasic'>이 름</td>
	    <td class='tbasic'><input type='text' name='name'  id='name'></td>
	</tr>
	
	<tr><td class='tbasic'>비밀번호</td>
	    <td class='tbasic'><input type='password' name='password'  id='password'></td>
	</tr>
	
	<tr><td class='tbasic'>이메일</td>
	    <td class='tbasic'><input type='text' name='email'  id='email'>
	</tr>
	<tr><td class='tbasic'>권한</td>
	    <td class='tbasic'><input type="radio" name='auth'  value='2'>강사 &nbsp;
	    					<input type="radio" name='auth'  value='1'>교육생
	</tr>
	<tr><td class='tbasic'>직군</td>
	    <td class='tbasic'><select name="mgroup">
	    		<option value="사무">사무</option>
	    		<option value="전기/통신">전기/통신</option>
	    		<option value="전산">전산</option>
	    		<option value="정보보호">정보보호</option>
	    			</select>
	</tr>
	<tr>
	   <td colspan='2' align='center' class='tfoot tspacial'>
	     <input type="button" onclick="Javascript:button_event();" value='수정'>
		 <input type="reset" value='취소'>
	   </td>
	</tr>
</table>
</form>
</body>
</html>







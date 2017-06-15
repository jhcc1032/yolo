<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style type="text/css">

.form-control {
	width: 380px;

}
</style>
</head>
<body>
	<form class="form-horizontal" action="memberUpdateForm.do"
		id="frm" name="frm">
		<h4>비밀번호를 입력해주세요</h4>
		<fieldset id="field">
			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="inputPassword"
						name="password" placeholder="비밀번호">
				</div>
				
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-primary" value='전송'>확인</button>
					<button type="reset" class="btn btn-default" value='취소'>취소</button>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>
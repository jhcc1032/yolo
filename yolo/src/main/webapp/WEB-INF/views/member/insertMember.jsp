<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<link href="/yolo/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	
	h1 {
	text-align: center;
	}
	#select {
	
	text-align: left;
	}
	
</style>
</head>
<body>
	<form class="form-horizontal" method="post" action="insertMember.do">
		<fieldset>
			<h1>회원가입</h1>
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">사
					&nbsp;번</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="empno" name="empno"
						placeholder="사번">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이
					&nbsp;름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="name" name="name"
						placeholder="이름">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">아 이 디</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="아이디">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="비밀번호">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="email" id="email"
						placeholder="이메일">
				</div>
			</div>

			<div class="form-group">
				<label for="select" class="col-lg-2 control-label">직군</label>
				<div class="col-lg-10">
					<select class="form-control" id="select" name="mgroup">
						<option value="사무">사무</option>
						<option value="전기/통신">전기/통신</option>
						<option value="전산">전산</option>
						<option value="정보보호">정보보호</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-2 control-label">권한</label>
				<div class="col-lg-10">
					<div class="radio">
						<label> <input type="radio" name="auth"
							id="optionsRadios1" value="2"> 강사
						</label>
						<label> <input type="radio" name="auth"
							id="optionsRadios2" value="1"> 교육생
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-primary" value='전송'>전송</button>
					<button type="reset" class="btn btn-default" value='취소'>취소</button>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>







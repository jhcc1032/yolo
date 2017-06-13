<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="form-horizontal" action="auth.do" method="post" id="frm">
		<input type="hidden" id="no" name="no" value="${no}" />
		<table class="table table-striped table-hover " >

			<legend style="font-weight: bold;margin-left:150px;">과제 게시판 로그인</legend>
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label ">아 이 디</label>
				<div class="col-lg-10">
					<input type="text" style="width: 40%;" class="form-control" id="id"
						name="id" value="" placeholder="id">
				</div>
			</div>



			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<input type="password" style="width: 40%;" class="form-control"
						name="password" id="password" placeholder="Password">
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-primary" value="전송">전송</button>
					<button type="reset" class="btn btn-default" value="취소">취소</button>
				</div>
			</div>
		</table>
	</form>
</body>
</html>
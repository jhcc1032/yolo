<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<link href="../css/basic.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function button_event() {
		if (confirm("정말 수정하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}

	$(
			function() {
				$("#mgroup option[value='${member.mgroup}']").attr('selected',
						'selected');
				$("input:radio[name=auth]:input[value='${member.auth}']").attr(
						"checked", true);

			})
</script>
<style type="text/css">
h1 {
	text-align: center;
}

.form-control {
	width: 300px;
}

#field {
	margin: 0 auto;
}
</style>
</head>

<body>

	<form class="form-horizontal" method="post" action="updateMember.do"
		id="frm" name="frm">
		<h1>회원정보수정</h1>
		<fieldset id="field">

			<div class="form-group">

				<label for="inputEmail" class="col-lg-2 control-label">사
					&nbsp;번</label>
				<div class="col-lg-10">
					<input type="hidden" class="form-control" id="inputEmail" name="empno"
						value='${member.empno }'>${member.empno }
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">아 이 디</label>
				<div class="col-lg-10">
					<input type="hidden" class="form-control" id="inputEmail" name="id"
						value='${member.id}'>${member.id}
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이
					&nbsp;름</label>
				<div class="col-lg-10">
					<input type="hidden" class="form-control" id="inputEmail" name="name"
						value='${member.name }'>${member.name }
				</div>
			</div>




			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="inputPassword"
						name="password" placeholder="비밀번호">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="inputEmail" name="email"
						value='${member.email }'>
				</div>
			</div>

			<div class="form-group">
				<label for="mgroup" class="col-lg-2 control-label">직군</label>
				<div class="col-lg-10">
					<select class="form-control" id="mgroup" name="mgroup">
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
					</div>
					<div class="radio">
						<label> <input type="radio" name="auth"
							id="optionsRadios2" value="1"> 교육생
						</label>
					</div>
				</div>
			</div>


			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-primary" value='전송'
						onclick="return button_event();">수정</button>
					<button type="reset" class="btn btn-default" value='취소'>취소</button>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>







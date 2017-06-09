<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function cancel(){
	location.href="registerForm.do";
}

</script>
</head>

<body>
	<!--  							-->
	<!--  							-->
	<!--  							-->
	<!-- 과목 수정(업데이트) tab	-->
	<!--  							-->
	<!--  							-->
	<!--  							-->
	<form method="get" action="classUpdate.do">
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Class Code(과목코드)</label> 
			<input type="text" class="form-control" name='ccode' id='ccode' value='${classinfo.ccode}' readonly="readonly">
		</div>
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Class Name(과목명) </label> 
			<input type="text" class="form-control" name='ctitle' id='ctitle' value='${classinfo.ctitle}'>
		</div>
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Class Hour (과목총 수업시간:hour)</label> 
			<select class="form-control" name='chour' id='chour'>
				<option>8</option>
				<option>16</option>
				<option>24</option>
				<option>32</option>
				<option>40</option>
				<option>48</option>
				<option>56</option>
				<option>64</option>
				<option>72</option>
				<option>80</option>
				<option>120</option>
				<option>160</option>
			</select>
		</div>
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Class Credit(과목 배점:weeks)</label> 
			<select class="form-control" name='cscore' id='cscore'>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
			</select>
		</div>
		<div class="form-group">
			<div class="col-lg-10">
				<button type="reset" class="btn btn-default" onclick="cancel()">Cancel</button>
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form method="get" action="classOpen.do">
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Class Code (과목 코드)</label> 
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
			<label class="control-label" for="inputError">Open Code (개설 코드)</label> 
			<input type="text" class="form-control" name='createcode' id='createcode'>
		</div>
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Open Date (개설 날짜)</label> 
			<input type="text" class="form-control" name='createdate' id='createdate'>
		</div>
		<div class="form-group">
			<div class="col-lg-10">
				<button type="reset" class="btn btn-default">Cancel</button>
				<button type="submit" class="btn btn-primary">Open Class</button>
			</div>
		</div>
	</form>
</body>
</html>
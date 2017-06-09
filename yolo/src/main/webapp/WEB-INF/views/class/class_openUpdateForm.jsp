<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/yolo/resources/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/yolo/resources/js/jquery.min.js">
$(function() {
    $( "#createdate" ).datepicker({

    });
});
</script>
<script type="text/javascript" src="/yolo/resources/js/jquery-ui.min.js">
$(function() {
    $( "#createdate" ).datepicker({

    });
});
</script>
<script>
$(function() {
    $( "#createdate" ).datepicker({
    	//numberOfMonths: [2,2],
    	changeMonth: true, 
        changeYear: true,
        //showButtonPanel: true,
        nextText: '다음 달',
        prevText: '이전 달',          
        //currentText: '오늘 날짜', 
        closeText: '닫기',
        dateFormat: "yy-mm-dd"   
    });
});
</script>

<script type="text/javascript">
function cancel(){
	location.href="openClassForm.do";
}
</script>
</head>
<body>
	<form method="get" action="openClassupdate.do">
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Class Code (과목 코드)</label> 
			<input type="text" class="form-control" name='ccode' id='ccode' value="${openclassinfo.ccode}" readonly="readonly">
		</div>
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Class Code (과목 명)</label> 
			<input type="text" class="form-control" value="${classtitle}" readonly="readonly">
		</div>
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Open Code (개설 코드)</label> 
			<input type="text" class="form-control" name='createcode' id='createcode' value="${openclassinfo.createcode}" readonly="readonly">
		</div>
		<div class="form-group has-error">
			<label class="control-label" for="inputError">Open Date (개설 날짜)</label> 
			<input type="text" class="form-control" name='createdate' id='createdate'>
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
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

<style type="text/css">
#dplist {
	text-align: center;
}

#thead tr th {
	text-align: center;
}

.frame {
	width: 270px;
	display: inline-block;
}
</style>


<script type="text/javascript">
function cancel(){
	location.href="openClassForm.do";
}
</script>
</head>
<body>
	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home " data-toggle="tab">교육정보 수정</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
			<form method="get" action="openClassupdate.do">
				<div class="col-lg-10" >
					<div class="form-group has-error" style="visibility: hidden; position: absolute;"> 
						<input type="hidden" class="form-control" name='createcode' id='createcode' value="${openclassinfo.createcode}">
					</div>
					<div class="form-group has-error">
						<label class="control-label" for="inputError">교육유형</label>
						<div>
							<div class="radio">
								<label> 
									<input type="radio" name="ctype" id="ctype" value="전체" checked="${openclassinfo.ctype}">전체
								</label> 
								<label> 
									<input type="radio" name="ctype" id="ctype" value="인턴">인턴 교육
								</label>
								<label> 
									<input type="radio" name="ctype" id="ctype" value="직원">직원 교육
								</label>
							</div>
						</div>
					</div>
					<div class="form-group has-error" style="width: 270px;">
						<label class="control-label" for="inputError">과목 코드</label> 
						<select class="form-control" name='ccode' id='ccode'>
							<!--  이곳에 등록된 과목코드를 추출해서 select창에 보여줄 수 있어야 함. -->
							<c:choose>
								<c:when test="${!empty classinfo}">
									<c:forEach var="list" items="${classinfo}">
										<option value="${list.ccode}">${list.ccode}
											(${list.ctitle})</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option>등록된 과목이 존재하지 않습니다. 먼저 과목을 등록하세요.</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">개설 날짜</label> 
						<input type="text" class="form-control" name='createdate' id='createdate' value="${openclassinfo.createdate}">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">교육기관</label> 
						<input type="text" class="form-control" name='cinstitution' id='cinstitution' value="${openclassinfo.cinstitution}">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">강사</label> 
						<input type="text" class="form-control" name='cinstructor' id='cintructor' value="${openclassinfo.cinstructor}">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">교재</label> 
						<input type="text" class="form-control" name='cbook' id='cbook' value="${openclassinfo.cbook}">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">평가형식</label>
						<div>
							<textarea class="form-control" rows="3" id="cevaluation" name="cevaluation">${openclassinfo.cevaluation}</textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">과정소개</label>
						<div>
							<textarea class="form-control" rows="3" id="cintroduction" name="cintroduction">${openclassinfo.cintroduction}</textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">학습목표</label>
						<div>
							<textarea class="form-control" rows="3" id="cgoal" name="cgoal">${openclassinfo.cgoal}</textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">과정목차</label>
						<div>
							<textarea class="form-control" rows="3" id="clist" name="clist">${openclassinfo.clist}</textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">강사소개</label>
						<div>
							<textarea class="form-control" rows="3" id="cinstintro" name="cinstintro">${openclassinfo.cinstintro}</textarea>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
			</form>
		</div>
</body>
</html>
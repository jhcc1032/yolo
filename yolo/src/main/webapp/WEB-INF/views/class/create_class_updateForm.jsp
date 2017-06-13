<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/yolo/resources/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/yolo/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/yolo/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript">
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

</head>
<body>
	<!-- 개설과목 업데이트 파트 -->
	<!-- 개설과목 업데이트 파트 -->
	<!-- 개설과목 업데이트 파트 -->
	<!-- 개설과목 업데이트 파트 -->
	<!-- 개설과목 업데이트 파트 -->
	<!-- 개설과목 업데이트 파트 -->
	<!-- 개설과목 업데이트 파트 -->
	

	<ul class="nav nav-tabs">
		<li class="active"><a href="#home " data-toggle="tab">교육과정 수정</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
			<form method="get" action="createClassUpdate.do">
				<div class="col-lg-10" >
					<div class="form-group has-error" style="visibility: hidden; position: absolute;"> 
						<input type="hidden" class="form-control" name='createcode' id='createcode' value="${createclassinfo.createcode}">
					</div>
					<div class="form-group has-error">
						<label class="control-label" for="inputError">교육유형</label>
						<div>
							<div class="radio">
								<c:choose>
									<c:when test="${createclassinfo.ctype=='직원'}">
										<label> <input type="radio" name="ctype" id="ctype" value="전체">전체</label>
										<label> <input type="radio" name="ctype" id="ctype" value="인턴">인턴교육</label>
										<label> <input type="radio" name="ctype" id="ctype" value="직원" checked="checked">직원교육</label>
									</c:when>
									<c:when test="${createclassinfo.ctype=='인턴'}">
										<label> <input type="radio" name="ctype" id="ctype" value="전체" >전체</label>
										<label> <input type="radio" name="ctype" id="ctype" value="인턴" checked="checked">인턴교육</label>
										<label> <input type="radio" name="ctype" id="ctype" value="직원">직원교육</label>
									</c:when>	
									<c:otherwise>
										<label> <input type="radio" name="ctype" id="ctype" value="전체" checked="checked">전체</label>
										<label> <input type="radio" name="ctype" id="ctype" value="인턴">인턴교육</label>
										<label> <input type="radio" name="ctype" id="ctype" value="직원">직원교육</label>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<%-- <div class="form-group has-error" style="width: 270px;">
						<label class="control-label" for="inputError">교육과정명</label> 
						<select class="form-control" name='ccode' id='ccode'>
							<!--  이곳에 등록된 과목코드를 추출해서 select창에 보여줄 수 있어야 함. -->
							<c:choose>
								<c:when test="${!empty classinfo}">
									<c:forEach var="list" items="${classinfo}">
										<option value="${list.ccode}">${list.ccode}(${list.ctitle})</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option>등록된 과목이 존재하지 않습니다. 먼저 과목을 등록하세요.</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div> --%>
					<div class="form-group has-error">
						<label class="control-label" for="inputError">과목코드</label> 
						<input type="text" class="form-control" name='ccode' id='ccode' value='${createclassinfo.ccode}' readonly="readonly">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">개설날짜</label> 
						<input type="text" class="form-control" name='createdate' id='createdate' value="${createclassinfo.createdate}">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">교육기관</label> 
						<input type="text" class="form-control" name='cinstitution' id='cinstitution' value="${createclassinfo.cinstitution}">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">강사</label> 
						<input type="text" class="form-control" name='cinstructor' id='cintructor' value="${createclassinfo.cinstructor}">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">교재</label> 
						<input type="text" class="form-control" name='cbook' id='cbook' value="${createclassinfo.cbook}">
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">평가형식</label>
						<div>
							<textarea class="form-control" rows="3" id="cevaluation" name="cevaluation">${createclassinfo.cevaluation}</textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">과정소개</label>
						<div>
							<textarea class="form-control" rows="3" id="cintroduction" name="cintroduction">${createclassinfo.cintroduction}</textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">학습목표</label>
						<div>
							<textarea class="form-control" rows="3" id="cgoal" name="cgoal">${createclassinfo.cgoal}</textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">과정목차</label>
						<div>
							<textarea class="form-control" rows="3" id="clist" name="clist">${createclassinfo.clist}</textarea>
						</div>
					</div>
					<div class="form-group has-error frame">
						<label class="control-label" for="inputError">강사소개</label>
						<div>
							<textarea class="form-control" rows="3" id="cinstintro" name="cinstintro">${createclassinfo.cinstintro}</textarea>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
textarea {
	resize:none;
}

#dplist {
	text-align: center;
}

.text {
	text-align: center;
}

#thead tr th {
	text-align: center;
}

.frame {
	width: 500px;
	/* display: inline-block; */
}
</style>

</head>
<body>	
	<!-- Tab 선택 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home " data-toggle="tab">교육과정 상세설명</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div id="openclass">
			<div class="col-lg-10" style="overflow: hidden;">
				<div class="form-group has-error" style="display: inline-block; float: left;">
					<img src="images/book.jpg" style="margin-left: 40px;" >
				</div>					
				<div class="form-group has-error text" style="display: inline-block; margin-left: 100px;">		
					<table>
						<tr>
							<td>
								<div class="form-group has-error" style="padding-right:10px; display: inline-block;">
									<label class="control-label" for="inputError">교육유형</label> 
									<div>${openclassinfo.ctype}</div>
								</div>
							</td>
							<td>
								<div class="form-group has-error"style="padding-right:10px; display: inline-block; text-decoration: underline; color: blue">
									<label class="control-label" for="inputError">교육과정</label> 
									<div>${classtitle}</div>
								</div>
							</td>
							<td>
								<div class="form-group has-error" style="padding-right:10px; display: inline-block;">
									<label class="control-label" for="inputError">개설날짜</label> 
									<div>${openclassinfo.createdate}</div>
								</div>
							</td>
						</tr>
						<tr>
							<td><div class="form-group has-error" style="padding-right:10px; display: inline-block;">
								<label class="control-label" for="inputError">교육기관</label> 
								<div>${openclassinfo.cinstitution}</div>
							</div></td>
							<td><div class="form-group has-error" style="padding-right:10px; display: inline-block;">
								<label class="control-label" for="inputError">강사</label> 
								<div>${openclassinfo.cinstructor}</div>
							</div></td>
							<td><div class="form-group has-error" style="padding-right:10px; display: inline-block;">
								<label class="control-label" for="inputError">교재</label> 
								<div>${openclassinfo.cbook}</div>
							</div></td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="col-lg-10" align="center">		
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">평가형식</label>
					<textarea class="form-control" rows="5" id="cevaluation" name="cevaluation"  readonly="readonly">${openclassinfo.cevaluation}</textarea>
				</div>
				
				<hr color="red" size="2"/>
				
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">과정소개</label>
					<textarea  class="form-control" rows="5" id="cintroduction" name="clist"  readonly="readonly">${openclassinfo.cintroduction}</textarea>
				</div>
				
				<hr color="red" size="2"/>
				
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">학습목표</label>
					<textarea  class="form-control" rows="5" id="cgoal" name="cgoal"  readonly="readonly">${openclassinfo.cgoal}</textarea>
				</div>
				
				<hr color="red" size="2"/>
				
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">과정목차</label>
					<textarea  class="form-control" rows="15" id="clist" name="clist"  readonly="readonly">${openclassinfo.clist}</textarea>
				</div>
				
				<hr color="red" size="2"/>
				
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">강사소개</label>
					<textarea  class="form-control" rows="10" id="cinstintro" name="cinstintro"  readonly="readonly">${openclassinfo.cinstintro}</textarea>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
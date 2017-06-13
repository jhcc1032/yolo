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
			<div class="col-lg-10" style="overflow: hidden; height: 250px;">
				<div class="form-group has-error" style="float: left; position: absolute; top: 50px;">
					<img src="images/book.jpg" style="margin-left: 20px;" >
				</div>					
				<div class="form-group has-error text" style="position: absolute; left: 170px;">		
					<table style="width: 400px; border: medium;">
						<tr>
							<td style="width: 300px;">
								<div class="form-group has-error"style="text-decoration: underline; color: blue">
									<label class="control-label" for="inputError">교육과정</label> 
									<div>${classtotalinfo.ctitle}</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 100px;"><div class="form-group has-error">
								<label class="control-label" for="inputError">강사</label> 
								<div>${classtotalinfo.cinstructor}</div>
							</div></td>
							<td style="width: 100px;"><div class="form-group has-error">
								<label class="control-label" for="inputError">교육기관</label> 
								<div>${classtotalinfo.cinstitution}</div>
							</div></td>
						</tr>
						<tr>
							<td style="width: 100px;">
								<div class="form-group has-error" >
									<label class="control-label" for="inputError">교육유형</label> 
									<div>${classtotalinfo.ctype}</div>
								</div>
							</td>
							<td style="width: 100px;">
								<div class="form-group has-error">
									<label class="control-label" for="inputError">개설날짜</label> 
									<div>${classtotalinfo.createdate}</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 300px;"><div class="form-group has-error">
								<label class="control-label" for="inputError">교재</label> 
								<div>${classtotalinfo.cbook}</div>
							</div></td>
						</tr>
					</table>
				</div>
			</div>
			
			
			
			<div class="col-lg-10" align="center">		
			<hr color="red" size="2"/>
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">평가형식</label>
					<textarea class="form-control" rows="5" id="cevaluation" name="cevaluation"  readonly="readonly">${classtotalinfo.cevaluation}</textarea>
				</div>
				
				<hr color="red" size="2"/>
				
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">과정소개</label>
					<textarea  class="form-control" rows="5" id="cintroduction" name="clist"  readonly="readonly">${classtotalinfo.cintroduction}</textarea>
				</div>
				
				<hr color="red" size="2"/>
				
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">학습목표</label>
					<textarea  class="form-control" rows="5" id="cgoal" name="cgoal"  readonly="readonly">${classtotalinfo.cgoal}</textarea>
				</div>
				
				<hr color="red" size="2"/>
				
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">과정목차</label>
					<textarea  class="form-control" rows="15" id="clist" name="clist"  readonly="readonly">${classtotalinfo.clist}</textarea>
				</div>
				
				<hr color="red" size="2"/>
				
				<div class="form-group has-error frame">
					<label class="control-label" for="inputError">강사소개</label>
					<textarea  class="form-control" rows="10" id="cinstintro" name="cinstintro"  readonly="readonly">${classtotalinfo.cinstintro}</textarea>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<%@ include file="../include/bootstrap.jsp" %>
		<%@ include file="../include/modals.jsp" %>
		<%@ include file="../include/bbs.jsp" %>
		
	</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
			    <div class="navbar-header">
			    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
			    	</button>
			    	<a class="navbar-brand" href="#">Simple BBS</a>
				</div>
			 
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${loginUser == null}">
								<li><a class="active" data-toggle="modal" data-target="#loginModal">Login</a></li>
								<li><a class="" data-toggle="modal" data-target="#joinModal">Join</a></li>
							</c:when>
							<c:otherwise>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${loginUser.u_nickname} <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a data-toggle="modal" data-target="#updateModal">会員情報変更</a></li>
									<li><a data-toggle="modal" data-target="#updatePassModal">Password変更</a></li>
									<li><a data-toggle="modal" data-target="#deleteModal" style="color: red">脱退</a></li>
								</ul>
							</li>
							<li>
								<a href="logout">logout</a>
							</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
		
		<div class="container">
			<div class="row">
				<div class="col-sm-12" style="text-align: left; padding-left: 15px;">
					<h3 style="color: #1e1e1e; width: 80%; padding-bottom : 15px">
							<strong style="width: 100%; text-align: left;">${boardView.b_title}</strong>
					</h3>				
				</div>
				<div class="col-sm-5" style="text-align: left; padding-left: 20px;">
					No : ${boardView.b_id}										
				</div>
				<div class="col-sm-2" style="text-align: center;; padding-left: 15px;">
					Writer : ${writer}
				</div>
				<div class="col-sm-3" style="text-align: right; padding-right: 20px;">
					<%-- <fmt:parseDate value='${boardView.b_createdate}' var='regdate' pattern='yyyymmddHHMM'/> --%>
					Date : -<%-- <fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd HH:mm" /> --%>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12" align="left" style="padding-left: 10px; padding-right: 10px;">
					<hr> 
						${boardView.b_content}
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6" align="left">
					<c:choose>
						<c:when test="${preNum == -1}">
							<button type="button" class="btn btn-default disabled">이전</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-default"
								onclick="location.href='${pageContext.request.contextPath}/admin/CEOBoardView/view/${preNum}?page=${param.page}&keyword=${param.keyword}'">Prev</button>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${nextNum == -1}">
							<button type="button" class="btn btn-default disabled">다음</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-default"
								onclick="location.href='${pageContext.request.contextPath}/admin/CEOBoardView/view/${nextNum}?page=${param.page}&keyword=${param.keyword}'">Next</button>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-sm-6" align="right">
					<c:if test="${loginUser.u_no == boardView.b_writer}">
						<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#boardDeleteModal">削除</button>
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#boardUpdateModal">修正</button>
					</c:if>
					<button type="button" class="btn btn-default" onclick="location.href='/'">目録</button>
				</div>
			</div>
			<br>
		    <div class="container">
		    	<div class="row" style="padding-right: 30px">
			        <label for="content">comment</label>
			        <form name="commentInsertForm">
			            <div class="input-group">
			               <input type="hidden" name="r_board" value="${boardView.b_id}"/>
			               <input type="hidden" name="r_writer" value="${loginUser.u_no }">
			               <input type="text" class="form-control" id="content" name="t_content" placeholder="内容を入力してください">
			               <span class="input-group-btn">
			                    <button class="btn btn-default" type="button" name="commentInsertBtn">登録</button>
			               </span>
			              </div>
			        </form>
			    </div>
    
		    	<div class="row" style="padding-right: 30px">
		        	<div class="commentList"></div>
		    	</div>
			</div>
		</div>
	</body>
</html>
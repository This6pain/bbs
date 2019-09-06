<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<%@ include file="../include/bootstrap.jsp" %>
		<%@ include file="../include/modals.jsp" %>
 		<%@ include file="../include/reply.jsp" %>
		
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
			    	<a class="navbar-brand" href='<c:url value="/"/>'>Simple BBS</a>
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
					Writer : ${boardView.b_nick}
				</div>
				<div class="col-sm-3" style="text-align: right; padding-right: 20px;">
					<%-- <fmt:parseDate value='${boardView.b_createdate}' var='regdate' pattern='yyyy-MM-dd HH:mm:ss'/> --%>
					Date : -<%-- <fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd HH:mm:ss" /> --%>
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
						<c:when test="${prevNum == -1}">
							<button type="button" class="btn btn-default disabled">Prev</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-default"
								onclick="location.href='<c:url value="/boardView?b_id=${prevNum }&page=${search.page }&searchType=${search.searchType}&keyword=${search.keyword}"/>'">Prev</button>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${nextNum == -1}">
							<button type="button" class="btn btn-default disabled">Next</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-default"
								onclick="location.href='<c:url value="/boardView?b_id=${nextNum }&page=${search.page }&searchType=${search.searchType}&keyword=${search.keyword}"/>'">Next</button>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-sm-6" align="right">
					<c:if test="${loginUser.u_no == boardView.b_writer}">
						<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#boardDeleteModal">削除</button>
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#boardUpdateModal">修正</button>
					</c:if>
					<a type="button" class="btn btn-default" href='<c:url value="/?page=${search.page }&searchType=${search.searchType}&keyword=${search.keyword}"/>'>目録</a>
				</div>
			</div>
			<hr>
		    <div class="container">
		    	<div class="row">
			    	<div class="my-3 p-3" style="padding-right: 30px">
				        <label for="content">comment</label>
				        <c:if test="${loginUser.u_no == null}">
				        	<h4 align="center">ログインしてください</h4>
				        </c:if>
				        <c:if test="${loginUser.u_no != null}">
				        <form name="insertComment" id="insertComment" method="post">
				            <div class="input-group">
				               <input type="hidden" name="r_board" value="${boardView.b_id}"/>
				               <input type="hidden" name="r_writer" value="${loginUser.u_no }">
				               <input type="text" class="form-control" id="content" name="r_content" placeholder="内容を入力してください">
				               <span class="input-group-btn">
				                   <button class="btn btn-default" id="insertBtn" >登録</button>
				               </span>
				        	</div>
				        </form>
				    </div>
	    
    				<div class="my-3 p-3" style="padding-top: 10px">
	
						<div id="commentList"></div>
						</c:if>
					</div> 

		    	</div>
			</div>
		</div>
		
	</body>
</html>
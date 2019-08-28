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
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>		
		
		<div class="container">
			<div class = "row">
				<c:if test="${loginUser != null }">
					<a class="nav-link" data-toggle="modal" data-target="#writeModal">write</a>
				</c:if>
				<table class="table">
					<thead>
						<tr>
							<th width="10%">
								No
							</th>
							<th width="60%">
								Title
							</th>
							<th width="10%">
								writer
							</th>
							<th width="10%">
								Date
							</th>
							<th width="10%">
								Hit
							</th>
						</tr>
					</thead>
					<tbody>					
						<c:choose>			
							<c:when test="${boardList == null}">
								<tr>
									<td colspan="5" align="center" style="font-family: sans-serif;">
										登録された記事がないです。
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${boardList}">
									<tr>
										<td width="10%">
											${board.b_id}
										</td>
										<td width="60%">
											<a href='<c:url value='/boardView?b_id=${board.b_id }'/>'>${board.b_title}</a>
										</td>
										<td width="10%">
											${board.b_writer}
										</td>
										<td width="10%">
											<%-- <fmt:parseDate value='${board.b_createdate}' var='regdate' pattern='EEE MMM dd HH:mm:ss zzz yyyy'/>										
											<fmt:parseDate value='${board.b_createdate}' var='regdate' pattern='yyyy-MM-dd HH:mm:ss.s'/>
											<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
										</td>
										<th width="10%">
											${board.b_hit}
										</td>
									</tr>
								</c:forEach>								
							</c:otherwise>
						</c:choose>	
					</tbody>					
				</table>
			</div>
		</div>
	</body>
</html>	
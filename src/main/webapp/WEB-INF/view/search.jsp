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
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>		
		
		<div class="container">
			<div class = "row">
				
				<table class="table">
					<thead>
						<tr >
							<th width="5%" style="text-align: center;">
								No
							</th>
							<th width="60%">
								Title
							</th>
							<th width="10%" style="text-align: center;">
								writer
							</th>
							<th width="20%" style="text-align: center;">
								Date
							</th>
							<th width="5%" style="text-align: center;">
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
								<%-- <c:forEach var="board" items="${boardList}" varStatus="boardStatus">
									<tr>
										<td width="5%">
											${board.b_id}
										</td>
										<td width="60%" style="text-align: left;;">
											<a href='<c:url value='/boardView?b_id=${board.b_id }&page=${search.page }&searchType=${search.searchType}&keyword=${search.keyword}'/>'>${board.b_title}</a>
											${board.b_title}
										</td>
										<td width="10%">
 											${board.b_nick}											
										</td>
										<td width="20%" style="text-align: center;">
											<jsp:useBean  id="today" class="java.util.Date"></jsp:useBean>
											<fmt:parseNumber value="${today.time / (1000 * 60 * 60 * 24)}" var="nowDays" integerOnly="true" />
											<fmt:parseNumber value="${board.b_createdate.time / (1000 * 60 * 60 * 24)}" var="regDays" integerOnly="true"/>
											<c:set value="${nowDays - regDays }" var="dayDiff" />
											<c:choose>
												<c:when test="${dayDiff == 0 }">										
													<fmt:formatDate value="${board.b_createdate }" pattern="HH:mm:ss"/>											
												</c:when>											
											    <c:otherwise>											
											        <fmt:formatDate value="${board.b_createdate }" pattern="yyyy.MM.dd"/>											
											    </c:otherwise>											
											  </c:choose>
											<c:set var = "boardDate" value = "${board.b_createdate}"/>
											<fmt:formatDate value = "${boardDate}" pattern ="yyyy-MM-dd HH:mm:ss"/>
										</td>
										<td width="5%" style="text-align: center;">
											${board.b_hit}
										</td>
									</tr>
								</c:forEach>	 --%>
								<c:forEach items="${boardList }" var="list" >
									<tr>
										<td colspan="5" align="center" style="font-family: sans-serif;">
											<a href='<c:url value='/api/detail?b_id=${list.idx }&page=${search.page }&biginDate=${search.beginDate}&endDate=${search.endDate}&title=${search.title}&content=${search.content}'/>'>${list }</a>
										</td>
									</tr>									
								</c:forEach> 							
							</c:otherwise>
						</c:choose>	
					</tbody>					
				</table>		
			</div>
			<div class="row">
				<div class="form-inline"  style="float: left;">				
					<!-- <div class="w100 form-group" style="padding-right:10px;">	
						<select class="form-control form-control-sm" name="searchType" id="searchType">		
							<option value="title">題目</option>		
							<option value="content">内容</option>		
							<option value="all">題目+内容</option>		
						</select>		
					</div> -->		
					<div class="form-group " >		
						<input type="text" class="form-control form-control-sm" name="beginDate" id="beginDate" placeholder="bigin(1990-01-01)">		
					</div>
					<div class="form-group " >		
						<input type="text" class="form-control form-control-sm" name="endDate" id="endDate" placeholder="endDate">		
					</div>
					<div class="form-group " >		
						<input type="text" class="form-control form-control-sm" name="title" id="title" placeholder="title">		
					</div>
					<div class="form-group " >		
						<input type="text" class="form-control form-control-sm" name="content" id="content" placeholder="content">		
					</div>
					<div class="form-group">
						<button class="btn btn-sm btn-primary" name="searchBtn" id="searchBtn">検索</button>
					</div>	
					<div class="form-group">
						<a class="btn btn-sm btn-primary" href='<c:url value="/"/>'>目録</a>		
					</div>
					<div class="form-group">
						<c:if test="${loginUser != null }">
							<a class="btn btn-sm btn-info" data-toggle="modal" data-target="#writeModal">write</a>
						</c:if>		
					</div>
						
				</div>
			
				<div class="float-right " style="float: right;">
					<ul class="btn-group pagination">
					    <c:if test="${pageMaker.prev }">
						    <li>
						        <a href='<c:url value="/api/search?page=${pageMaker.startPage-1 }"/>'>Prev</a>
						    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageIdx">
						    <li>
						        <a href='<c:url value="/api/search?page=${pageIdx }&biginDate=${search.beginDate}&endDate=${search.endDate}&title=${search.title}&content=${search.content}"/>'><i class="fa">${pageIdx }</i></a>
						    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li>
						        <a href='<c:url value="/api/search?page=${pageMaker.endPage+1 }"/>'>Next</a>
						    </li>
					    </c:if>
					</ul>
				</div>
			</div>
		</div>		
	</body>
</html>	
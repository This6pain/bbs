<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<%@ include file="../include/bootstrap.jsp" %>
		<%@ include file="../include/modals.jsp" %>
		
	</head>
	<body>
	
		<h2>test!!!</h2>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
			    <div class="navbar-header">
			    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
			    	</button>
			    	<a class="navbar-brand" href="#">스프링부트로 게시판 만들기!!</a>
				</div>
			 
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="/list">기본 게시판1</a></li>
						<li><a href="#">기본 게시판2</a></li>
						<li><a href="#">기본 게시판3</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown예제 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
		
		<div class="container">
			<div>
				<ul>					
					<li>
						<a href="#" class="nav-link" data-toggle="modal" data-target="#loginModal">Login</a>
					</li>
					<li>
						<a href="#" class="nav-link" data-toggle="modal" data-target="#joinModal">Sign-up</a>
					</li> 
					<li>
						<a href="#" class="nav-link" data-toggle="modal" data-target="#modifyModal">modify</a>
					</li>         	
					<li>
						<a href="#" style="text-decoration: line-through;">mypage</a>
					</li>
					<li>
						<a href="#" style="text-decoration: line-through;">logout</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="container">

			<div class = "row">
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
								Date
							</th>
							<th width="10%">
								writer
							</th>
							<th width="10%">
								Hit
							</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</body>
</html>	
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<%@ include file="../include/bootstrap.jsp" %>

</head>
<body>
		<!-- Modal login-->
		<div class="modal fade" id="loginModal" role="dialog">
			<div class="modal-dialog">
		  
				<div class="modal-content card" style="width: 80%; height: 80%;">
					<div class="card-header">
						<h3>ログイン</h3>
					</div>
					<div class="card-body">
						<form action="login.member" method="post">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name = "user_id" placeholder="ID">								
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" class="form-control" name = "user_pass" placeholder="password">
							</div>
							<div class="form-group">
								<input type="submit" value="ログイン" class="btn float-right login_btn" style="padding: 10px;">
							</div>
						</form>
					</div>
					
					<div class="card-footer">
						<div class="d-flex justify-content-center links">
							IDがないんですか?<a class="text-success" data-toggle="modal" data-target="#joinModal" data-dismiss="modal">会員加入</a>
						</div>
						<div class="d-flex justify-content-center">
							<a class="text-success"  data-toggle="modal" data-target="#findpassModal" data-dismiss="modal">パスワードを忘れましたでしょうか?</a>
							<!-- <a href="searchForm.jsp" class="text-success">Forgot your password?</a> -->
						</div>
					</div>
				</div>		    
			</div>
		</div>
		
		<!-- Modal sign-up -->
		<div class="modal fade" id="joinModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content card" style="width: 80%; height: 80%;">
				<div class="card-header">
					<h3>会員加入</h3>
				</div>
				<div class="card-body">
					<form action="#" method="post" enctype="multipart/form-data">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" name = "user_id" placeholder="ID" required>							
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" name = "user_pass" placeholder="password" required>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">				
								<span class="input-group-text"><i class="fas fa-check"></i></span>
							</div>
							<input type="password" class="form-control" name = "user_repass" placeholder="password confirm" required>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">				
								<span class="input-group-text"><i class="fas fa-signature"></i></span>
							</div>
							<input type="text" class="form-control" name = "user_nickname" placeholder="nickname" required>						
						</div>
												<div class="input-group form-group">
							<div class="input-group-prepend">				
								<span class="input-group-text"><i class="fas fa-signature"></i></span>
							</div>
							<input type="text" class="form-control" name = "user_kanziname" placeholder="kanziname" required>						
						</div>
												<div class="input-group form-group">
							<div class="input-group-prepend">				
								<span class="input-group-text"><i class="fas fa-signature"></i></span>
							</div>
							<input type="text" class="form-control" name = "user_kananame" placeholder="kananame" required>						
						</div>
						
						<div class="form-group">
							<input type="submit" value="加入" class="btn float-right login_btn">
						</div>
						</form>
					</div>
					<div class="card-footer">
					</div>
				</div>		    
			</div>
		</div>
		
		<!-- Modal find pass. id-->
		<div class="modal fade" id="findpassModal" role="dialog">
			<div class="modal-dialog">
		  		<div class="modal-content card" style="width: 80%; height: 80%;">
					<div class="card-header">
						<h3>暗証番号探し</h3>
					</div>
					<div class="card-body">
						<form action="#" method="post">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" name = "user_id" placeholder="ID">								
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-at"></i></span>
								</div>
								<input type="text" class="form-control" name = "email" placeholder="email">
							</div>
							<div class="form-group">
								<input type="submit" value="捜し" class="btn float-right login_btn">
							</div>
						</form>
					</div>
				</div>						    
			</div>
		</div>
		<!-- Modal message-->
		<div class="modal fade" id="msgModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content card" style="width: 80%; height: 80%;">
					<div class="card-header">
						<h3>Message</h3>
					</div>
					<div class="card-body">			
						<div class="input-group form-group">
						<span style="color: white;">
							${message }
						</span>
						</div>
						<div class="form-group">
							<input type="button" value="Close" class="btn float-right login_btn" data-dismiss="modal" style="padding: 10px;">
						</div>
					</div>
				</div>	    
			</div>
		</div>
</body>
</html>
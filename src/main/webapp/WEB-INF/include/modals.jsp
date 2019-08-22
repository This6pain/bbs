<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<%@ include file="../include/bootstrap.jsp" %>
		<%@ include file="../include/bbs.jsp" %>
	</head>
	<body>
				
		<!-- Modal login-->
		<div class="modal fade" id="loginModal" role="dialog">
			<div class="modal-dialog">
			
				<div class="modal-content card" style="width: 80%; height: 80%;">
					<div class="modal-header" style="color: white">
						<h3>ログイン</h3>
					</div>
					<div class="modal-body">
						<form action="login" method="post">
							<div class="form-group" >
								<label for="user_id" style="color: white">ID（メールアドレス）</label>
									<input type="text" class="form-control" id="user_id" name="login_id" placeholder="ID（メールアドレス）" required>
								<div class="check_font" id="id_check"></div>			
							</div>
							<div class="form-group">
								<label for="user_pw" style="color: white">PASSWORD</label>
									<input type="password" class="form-control" id="user_pw" name="login_pass" placeholder="PASSWORD" required>
								<div class="check_font" id="pw_check"></div>
							</div>
							<div>
								<input type="submit" value="ログイン" class="btn float-right login_btn" style="padding: 10px;">						
							</div>													
						</form>
					</div>
					
					<div class="modal-footer">
						<div class="d-flex justify-content-center links">
							IDがないんですか?<a class="text-success" data-toggle="modal" data-target="#joinModal" data-dismiss="modal">会員加入</a>
						</div>
					</div>
				</div>		    
			</div>
		</div>
		
		<!-- Modal sign-up -->
		<div class="modal fade" id="joinModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content card" style="width: 80%; height: 80%;">
					<div class="modal-header" style="color: white">
						<h3>会員加入</h3>
					</div>
					<div class="modal-body">
						<form action="join" method="post">
							<div class="form-group" >
								<label for="user_id" style="color: white">ID（メールアドレス）</label>
									<input type="text" class="form-control" id="user_id" name="u_id" placeholder="ID（メールアドレス）" required>
								<div class="check_font" id="id_check"></div>			
							</div>
							<div class="form-group">
								<label for="user_pw" style="color: white">PASSWORD</label>
									<input type="password" class="form-control" id="user_pw" name="u_pass" placeholder="PASSWORD" required>
								<div class="check_font" id="pw_check"></div>
							</div>
							<div class="form-group">
								<label for="user_pw2" style="color: white">PASSWORD確認</label>
									<input type="password" class="form-control" id="user_pw2" name="u_pass2" placeholder="Confirm Password" required>
								<div class="check_font" id="pw2_check"></div>
							</div>
							<div class="form-group">
								<label for="user_name" style="color: white">ニックネーム</label>
									<input type="text" class="form-control" id="user_nickname" name="u_nickname" placeholder="ニックネーム" required>
								<div class="check_font" id="nickname_check"></div>
							</div>
							<div class="form-group">
								<label for="user_name" style="color: white">名前（漢字）</label>
									<input type="text" class="form-control" id="user_kanjiname" name="u_kanjiname" placeholder="名前（漢字）" required>
								<div class="check_font" id="kanziname_check"></div>								
							</div>
							<div class="form-group">
								<label for="user_name" style="color: white">名前（カタカナ）</label>
									<input type="text" class="form-control" id="user_kananame" name="u_kananame" placeholder="名前（カタカナ）" required>
								<div class="check_font" id="kananame_check"></div>								
							</div>
							<div class="form-group required">
								<label for="user_birth" style="color: white">生年月日</label>
									<input type="text" class="form-control" id="user_birthdate" name="u_birthdate" placeholder="ex) 19990415" required>
								<div class="check_font" id="birth_check"></div>
							</div>
							<div class="reg_button">
								<input type="submit" value="加入" class="btn btn-primary" style="padding: 10px;">				
							</div>							
						</form>
					</div>
				</div>		    
			</div>
		</div>
		
		<!-- Modal User-Update -->
		<div class="modal fade" id="updateModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content card" style="width: 80%; height: 80%;">
					<div class="modal-header" style="color: white">
						<h3>会員情報変更</h3>
					</div>
					<div class="modal-body">
						<form action="update" method="post">
							<input type="hidden" name="u_id" value="${loginUser.u_id}">
							<input type="hidden" name="u_pass" value="${loginUser.u_pass}">
							<div class="form-group">
								<label for="user_name" style="color: white">ニックネーム</label>
									<input type="text" class="form-control" id="user_nickname" name="u_nickname" placeholder="${loginUser.u_nickname}" required>
								<div class="check_font" id="nickname_check"></div>
							</div>
							<div class="form-group">
								<label for="user_name" style="color: white">名前（漢字）</label>
									<input type="text" class="form-control" id="user_kanjiname" name="u_kanjiname" placeholder="${loginUser.u_kanjiname}" required>
								<div class="check_font" id="kanziname_check"></div>								
							</div>
							<div class="form-group">
								<label for="user_name" style="color: white">名前（カタカナ）</label>
									<input type="text" class="form-control" id="user_kananame" name="u_kananame" placeholder="${loginUser.u_kananame}" required>
								<div class="check_font" id="kananame_check"></div>								
							</div>
							<div class="form-group required">
								<label for="user_birth" style="color: white">生年月日</label>
									<input type="text" class="form-control" id="user_birthdate" name="u_birthdate" placeholder="${loginUser.u_birthdate}" required>
								<div class="check_font" id="birth_check"></div>
							</div>							
							<div class="reg_button">
								<input type="submit" value="変更" class="btn btn-primary px-3">
				
							</div>							
						</form>
					</div>
				</div>		    
			</div>
		</div>
		
		<!-- Modal User-UpdatePassword -->
		<div class="modal fade" id="updatePassModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content card" style="width: 80%; height: 80%;">
					<div class="modal-header" style="color: white">
						<h3>Password変更</h3>
					</div>
					<div class="modal-body">
						<form action="updatepass" method="post">
							<div class="form-group">
								<label for="user_pw" style="color: white">PASSWORD</label>
									<input type="password" class="form-control" id="old_pw" name="old" placeholder="PASSWORD" required>
								<div class="check_font" id="oldpw_check"></div>
							</div>
							<div class="form-group">
								<label for="user_pw" style="color: white">新しいPASSWORD</label>
									<input type="password" class="form-control" id="user_pw" name="login_pass" placeholder="PASSWORD" required>
									<input type="hidden" value="${loginUser.u_id}" name="login_id">
								<div class="check_font" id="pw_check"></div>
							</div>
							<div class="form-group">
								<label for="user_pw2" style="color: white">新しいPASSWORD確認</label>
									<input type="password" class="form-control" id="user_pw2" name="newpass2" placeholder="Confirm Password" required>
								<div class="check_font" id="pw2_check"></div>
							</div>							
							<div class="reg_button">
								<input type="submit" value="変更" class="btn btn-primary px-3">				
							</div>							
						</form>
					</div>
				</div>		    
			</div>
		</div>
		
		<!-- Modal User-delete -->
		<div class="modal fade" id="deleteModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content card" style="width: 80%; height: 80%;">
					<div class="modal-header" style="color: white">
						<h3>会員脱退</h3>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="user_pw" style="color: white">脱退しますか？</label>									
						</div>														
						<div class="reg_button">
							<button class="btn btn-primary" onclick="location.href='delete?u_no=${loginUser.u_no}'">脱退</button>
							<button class="btn btn-danger" data-dismiss="modal">cancel</button>
						</div>													
					</div>
				</div>		    
			</div>
		</div>
		
		<!-- Modal write-->
		<div class="modal fade" id="writeModal" role="dialog">
			<div class="modal-dialog">			
				<div class="modal-content card" style="width: 800px; height: 80%;">
					<div class="modal-header" style="color: white">
						<h3>記事登録</h3>
					</div>
					<div class="modal-body">
						<form action="write" method="post">
							<div class="form-group" >
								<label for="user_id" style="color: white">題目</label>
									<input type="text" class="form-control" id="board_title" name="b_title" placeholder="題目" required>
								<div class="check_font" id="id_check"></div>			
							</div>
							<div class="form-group">
								<label for="user_pw" style="color: white">内容</label>
									<textarea class="form-control" id="board_content" name="b_content"　placeholder="内容" rows="10" required></textarea>
								<div class="check_font" id="pw_check"></div>
							</div>
							<div>
								<input type="submit" value="登録" class="btn float-right login_btn" style="padding: 10px;">						
							</div>													
						</form>
					</div>
				</div>						    
			</div>
		</div>
	</body>
</html>
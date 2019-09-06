<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

	var empCK = /\s/g;

	var idCK = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var pwCK = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/; 

	var kanziCK = /[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+[々〆〤]+$/;

	var kanaCK =　/^[ぁ-んァ-ン]+$/;

	var birthCK = false;

	var joinCK = new Array(6);
	
	$("#user_id").blur(function() {
		var user_id = $('#user_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {
				
				if (data == 1) {
					$("#id_check").text("登録されているIDです");
					$("#id_check").css("color", "red");
					$("#reg_btn").attr("disabled", true);
				} else {
					
					if(idCK.test(user_id)){
						$("#id_check").text("");
						$("#reg_btn").attr("disabled", false);
					} else if(user_id == ""){
						
						$('#id_check').text('入力してください');
						$('#id_check').css('color', 'red');
						$("#reg_btn").attr("disabled", true);
					} else {
						
						$('#id_check').text("有効な形式ではありません。");
						$('#id_check').css('color', 'red');
						$("#reg_btn").attr("disabled", true);
					}
					
				}
			}
		});
	});
		
/* 	$("#user_id").blur(function() {
		if (idCK.test($(this).val())) {
				console.log(idCK.test($(this).val()));
				$("#id_check").text('');
		} else {
			$("#id_check").text("有効な形式ではありません。");
			$("#id_check").css("color", "red");
			IDまたはパスワードが一致しません。
			
		}
	}); */


	$("#user_pw").blur(function() {
		if (pwCK.test($(this).val())) {
				console.log(pwCK.test($(this).val()));
				$("#pw_check").text('');
				joinCK[1] = true;			
		} else {
			$('#pw_check').text('有効な形式ではありません。');
			$('#pw_check').css('color', 'red');
			joinCK[1] = false;			
		}
	});

	$("#user_pw2").blur(function() {
		if (pwCK.test($(this).val())) {
			if($(this).val()==$("#user_pw").val()){
				$("#pw2_check").text('');
				joinCK[2] = true;			
			} else{
				$('#pw2_check').text('暗証番号が一致しません。');
				$('#pw2_check').css('color', 'red');
				joinCK[2] = false;			
			}
		} else {
			$('#pw2_check').text('有効な形式ではありません。');
			$('#pw2_check').css('color', 'red');
			joinCK[2] = false;			
		}
	
	});

	$("#user_kanziname").blur(function() {
		if (kanziCK.test($(this).val())) {
				console.log(kanziCK.test($(this).val()));
				$("#kanziname_check").text('');
				joinCK[3] = true;			
		} else {
			$('#kanziname_check').text('名前を確認してください');
			$('#kanziname_check').css('color', 'red');
			joinCK[3] = false;			
		}
	});
	
	$("#user_kananame").blur(function() {
		if (kanaCK.test($(this).val())) {
				console.log(kanaCK.test($(this).val()));
				$("#kananame_check").text('');
				joinCK[4] = true;			
		} else {
			$('#kananame_check').text('名前を確認してください');
			$('#kananame_check').css('color', 'red');
			joinCK[4] = false;			
		}
	});	
	
	$('#user_birthdate').blur(function(){
		var dateStr = $(this).val();		
	    var year = Number(dateStr.substr(0,4)); 
	    var month = Number(dateStr.substr(4,2)); 
	    var day = Number(dateStr.substr(6,2)); 
	    var today = new Date(); 
	    var yearNow = today.getFullYear(); 
		
	    if (dateStr.length <=8) {
			
		    if (1900 > year || year > yearNow){
		    	
		    	$('#birth_check').text('生年月日を確認してください');
				$('#birth_check').css('color', 'red');
		    	
		    }else if (month < 1 || month > 12) {
		    		
		    	$('#birth_check').text('生年月日を確認してください');
				$('#birth_check').css('color', 'red'); 
		    
		    }else if (day < 1 || day > 31) {
		    	
		    	$('#birth_check').text('生年月日を確認してください');
				$('#birth_check').css('color', 'red'); 
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birth_check').text('生年月日を確認してください');
				$('#birth_check').css('color', 'red'); 
		    	 
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birth_check').text('生年月日を確認してください');
					$('#birth_check').css('color', 'red'); 
		    	
				}else{
					$('#birth_check').text('');
					joinCK[5] = true;			
				}
		     	
		    }else{
		    	
		    	$('#birth_check').text(''); 
				joinCK[5] = true;			
			}
			
		}else{
			
			$("#birth_check").text("生年月日を確認してください");
			$("#birth_check").css("color", "red");  
		}
	});


	$(document).on('click', '#reg_btn', function(){
		
		var validAll = true;

		for(var i = 0; i < joinCK.length; i++){
			
			if(joinCK[i] == false){
				validAll = false;
			}

		}
		return validAll;

	});
	
	$(document).on('click', '#searchBtn', function(e){

		e.preventDefault();

		var url = "${pageContext.request.contextPath}/";

		url = url + "?searchType=" + $('#searchType').val();

		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;

	});	

</script>


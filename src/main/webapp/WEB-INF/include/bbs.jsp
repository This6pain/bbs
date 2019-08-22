<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

			var empCK = /\s/g;
		
			var idCK = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			var pwCK = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/; 
		
			var kanziCK = /u'[\u4E00-\u9FFF]+'/;
		
			var kanaCK = /u'[\u3040-\u309F]+'/;
		
			var birthJ = false;
		
			$(document).ready(function(){
					
			$("#u_id").blur(function() {
				if (idCK.test($(this).val())) {
						console.log(idCK.test($(this).val()));
						$("#id_check").text('');
				} else {
					$('#name_check').text('이름을 확인해주세요');
					$('#name_check').css('color', 'red');
				}
			});
		
			$("#u_kanjiname").blur(function() {
				if (kanziCK.test($(this).val())) {
						console.log(kanziCK.test($(this).val()));
						$("#kanziname_check").text('');
				} else {
					$('#kanziname_check').text('이름을 확인해주세요');
					$('#kanziname_check').css('color', 'red');
				}
			});
		
			$("#u_kananame").blur(function() {
				if (kanaCK.test($(this).val())) {
						console.log(kanaCK.test($(this).val()));
						$("#kananame_check").text('');
				} else {
					$('#kananame_check').text('이름을 확인해주세요');
					$('#kananame_check').css('color', 'red');
				}
			});	
			
			// 생년월일	birthJ 유효성 검사
			$('#u_birthdate').blur(function(){
				var dateStr = $(this).val();		
			    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
			    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
			    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
			    var today = new Date(); // 날짜 변수 선언
			    var yearNow = today.getFullYear(); // 올해 연도 가져옴
				
			    if (dateStr.length <=8) {
					// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
				    if (1900 > year || year > yearNow){
				    	
				    	$('#birth_check').text('생년월일을 확인해주세요 :)');
						$('#birth_check').css('color', 'red');
				    	
				    }else if (month < 1 || month > 12) {
				    		
				    	$('#birth_check').text('생년월일을 확인해주세요 :)');
						$('#birth_check').css('color', 'red'); 
				    
				    }else if (day < 1 || day > 31) {
				    	
				    	$('#birth_check').text('생년월일을 확인해주세요 :)');
						$('#birth_check').css('color', 'red'); 
				    	
				    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				    	 
				    	$('#birth_check').text('생년월일을 확인해주세요 :)');
						$('#birth_check').css('color', 'red'); 
				    	 
				    }else if (month == 2) {
				    	 
				       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				       	
				     	if (day>29 || (day==29 && !isleap)) {
				     		
				     		$('#birth_check').text('생년월일을 확인해주세요 :)');
							$('#birth_check').css('color', 'red'); 
				    	
						}else{
							$('#birth_check').text('');
							birthJ = true;
						}//end of if (day>29 || (day==29 && !isleap))
				     	
				    }else{
				    	
				    	$('#birth_check').text(''); 
						birthJ = true;
					}//end of if
					
					}else{
						
						$('#birth_check').text('생년월일을 확인해주세요 :)');
						$('#birth_check').css('color', 'red');  
					}
				});
			});
		</script>
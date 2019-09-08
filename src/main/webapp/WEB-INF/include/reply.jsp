<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function(){
	
		replyList();
	
		$('#insertBtn').click(function(){ 
			var insertData = $('#insertComment').serialize();
			insertComment(insertData);
		});
		
	});
	
	function replyList(){

		var paramData = {"b_id" : "${boardView.b_id}"};
		
		$.ajax({
			type: "POST",
			data : paramData,
			dataType : "json",
			url: "${pageContext.request.contextPath}/commentList",
			success: function(data){
				var html = '';
				
				if(data.length > 0){
				    
					for(var i=0; i<data.length; i++){

						html += '<div class="media text-muted pt-3" id="rid'+data[i].r_id+'">';
	                    html += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                    html += '<span class="d-block">';
	                    html += '<strong class="text-gray-dark">' + data[i].r_nick + '</strong>';
						html += '<span style="padding-left: 7px; font-size: 9pt;">';
						if(${loginUser.u_no} == data[i].r_writer){
						html += '<a style="text-decoration: none;" class = "btn btn-primary btn-xs" onclick="updateComment(' + data[i].r_id + ',\'' + data[i].r_nick + '\',\'' + data[i].r_content + '\')" style="padding-right:5px">修正</a>';
						html += '<a style="text-decoration: none;" class = "btn btn-danger btn-xs" onclick="deleteComment('+data[i].r_id+')" >削除</a>';				                    
							}		
						html += '</span>';
	                    html += '</span><br>';
						html += data[i].r_content+'/rid'+data[i].r_id;
						html += '</p>';
						html += '</div>';

					}
				    
				}						
				$("#commentList").html(html);
			}
		});
	}


	function insertComment(insertData){
		$.ajax({
			url : '${pageContext.request.contextPath}/insertComment',
			type : 'post',
			data : insertData,
			success : function(result){
				if(result == 1){
					replyList(); 
					$("#content").val("");

				}
			}				
		});
	}
	
	function updateComment(r_id, r_nick, r_content){
		console.log(r_id);
		var html = "";

		html += '<div class="media text-muted pt-3" id="rid'+r_id+'">';
		html += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		html += '<span class="d-block">';
		html += '<strong class="text-gray-dark">' + r_nick + '</strong>';
		html += '<span style="padding-left: 7px; font-size: 9pt">';
		html += '<a href="javascript:void(0)" style="text-decoration: none;" class = "btn btn-primary btn-xs" onclick="updateCommentSave(' + r_id + ')" style="padding-right:5px">貯蔵</a>';
		html += '<a href="javascript:void(0)" style="text-decoration: none;" class = "btn btn-danger btn-xs" onClick="replyList()">Cancel<a>';
		html += '</span>';
		html += '</span>';		
		html += '<textarea name="editComment" id="editComment" class="form-control" rows="2">';
		html += r_content;
		html += '</textarea>';
		html += '</p>';
		html += '</div>';

		$('#rid'+r_id).html(html);

		$('#rid'+r_id + ' #editComment').focus();

	}

	function updateCommentSave(r_id){
	    var updateContent = $("#editComment").val();
	    
	    $.ajax({
	        url : '${pageContext.request.contextPath}/updateComment',
	        type : 'post',
	        data : {'r_content' : updateContent, 'r_id' : r_id},
	        success : function(data){
	            if(data == 1) {
					replyList(); 
	            } 
	        }
	    });
	}
	 
	function deleteComment(r_id){
	    $.ajax({
	        url : '${pageContext.request.contextPath}/deleteComment',
	        type : 'post',
	        data : {"r_id" : r_id},
	        success : function(data){
	            if(data == 1) {
					replyList(); 
	            }
	        }
	    });
	}


</script>
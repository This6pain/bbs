package com.ggh.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ggh.bbs.dto.LoginInfoDTO;
import com.ggh.bbs.dto.UserDTO;

@Mapper
public interface UserMapper {

	public void join(UserDTO user);
	
//	public int idcheck(UserDTO user);
	
//	public int logincheck(LoginInfoDTO loginInfo);
	
	public UserDTO login(LoginInfoDTO loginInfo);
	
	public void delete(int u_no);

	public void update(UserDTO updateUser);

	public void updatePass(LoginInfoDTO userpass);

	public String getNick(int b_writer);

	public List<UserDTO> getAllUser();

	public int userIdCheck(String user_id);
	

}

package com.ggh.bbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ggh.bbs.dto.LoginInfoDTO;
import com.ggh.bbs.dto.UserDTO;

@Service
public interface UserService {

	public void join(UserDTO user);

	public UserDTO login(LoginInfoDTO loginInfo);
	
	public void update(UserDTO updateUser);
		
	public void delete(int u_no);

	public void updatePass(LoginInfoDTO userPass);

	public String getNick(int b_writer);

	public List<UserDTO> getAllUser();
	
}

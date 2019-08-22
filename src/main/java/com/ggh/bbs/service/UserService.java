package com.ggh.bbs.service;

import org.springframework.stereotype.Service;

import com.ggh.bbs.dto.LoginInfoDTO;
import com.ggh.bbs.dto.UserDTO;

@Service
public interface UserService {

	public void join(UserDTO user);

	public UserDTO login(LoginInfoDTO loginInfo);
	
	public void update(UserDTO user);
		
	public void delete(UserDTO user);
	
}

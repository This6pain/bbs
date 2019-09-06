package com.ggh.bbs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ggh.bbs.dto.LoginInfoDTO;
import com.ggh.bbs.dto.UserDTO;
import com.ggh.bbs.mapper.UserMapper;
import com.ggh.bbs.service.UserService;

@Repository
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	@Override
	public void join(UserDTO user) {
		// TODO 自動生成されたメソッド・スタブ
		
		user.setAdmin_check(0);

		userMapper.join(user);		
	}

	@Override
	public void update(UserDTO updateUser) {
		// TODO 自動生成されたメソッド・スタブ
		
		 userMapper.update(updateUser);
	}

	@Override
	public UserDTO login(LoginInfoDTO loginInfo) {
		return userMapper.login(loginInfo);
	}

	@Override
	public void delete(int u_no) {
		
		userMapper.delete(u_no);
		
	}

	@Override
	public void updatePass(LoginInfoDTO userPass) {
		
		userMapper.updatePass(userPass);
	}

	@Override
	public String getNick(int b_writer) {
		
		String result = userMapper.getNick(b_writer); 

		return result;
	}

	@Override
	public List<UserDTO> getAllUser() {
		// TODO 自動生成されたメソッド・スタブ
		return userMapper.getAllUser();
	}

	@Override
	public int userIdCheck(String user_id) {
		// TODO 自動生成されたメソッド・スタブ
		return userMapper.userIdCheck(user_id);
	}

}

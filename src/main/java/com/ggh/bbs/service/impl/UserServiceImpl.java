package com.ggh.bbs.service.impl;

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
	public void update(UserDTO user) {
		// TODO 自動生成されたメソッド・スタブ
		
		 userMapper.update(user);
	}

	@Override
	public UserDTO login(LoginInfoDTO loginInfo) {
		System.out.println(loginInfo.getLogin_id()+"2");
		return userMapper.login(loginInfo);
	}

	@Override
	public void delete(UserDTO user) {
		
		userMapper.delete(user);
		
	}

}

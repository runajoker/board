package com.pro.main.regist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.main.vo.MemberVO;

@Service
public class RegistServiceImpl implements RegistService {
	@Autowired
	private RegistDAO registDAO;

	@Override
	public void registUser(Map<String, String> map) {
		registDAO.registUser(map);
	}

	@Override
	public MemberVO loginProcess(Map<String, String> map) {
		return registDAO.loginProcess(map); 
	}

}

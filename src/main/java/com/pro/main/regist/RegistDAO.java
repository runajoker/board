package com.pro.main.regist;

import java.util.List;
import java.util.Map;

import com.pro.main.vo.MemberVO;

public interface RegistDAO {

	void registUser(Map<String, String> map);

	MemberVO loginProcess(Map<String, String> map);

}

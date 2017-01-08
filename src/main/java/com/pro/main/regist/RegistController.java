package com.pro.main.regist;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistController {

	@RequestMapping(value ="/regist/")
	public String moveRegistView() {
		
		return "/regist/regist";
		
	}
}

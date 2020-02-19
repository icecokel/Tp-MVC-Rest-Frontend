package com.bang.hoo;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bang.hoo.domain.User;

@Controller
public class UserController {
	
	
	@PostMapping("login")
	public void login (HttpServletRequest request) {
//	request안에 모든 데이터 확인하기.		
//		Enumeration params = request.getParameterNames();
//		System.out.println("----------------------------");
//		while (params.hasMoreElements()){
//		    String name = (String)params.nextElement();
//		    System.out.println(name + " : " +request.getParameter(name));
//		}
//		System.out.println("----------------------------");
//		
//		
		String username = request.getParameter("username");
		int userid = Integer.parseInt(request.getParameter("userid"));
		
		User user = new User();
		
		user.setUsername(username);
		user.setUserid(userid);
		
		System.out.println(user.toString());
		
		request.getSession().setAttribute("user", user);
		
	}
	
	@GetMapping("logout")
	public String logout (Model model, HttpServletRequest request) {
		
		request.getSession().invalidate();

		return "redirect:/";
	}
}

package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.service.Ch10LoginResult;
import web.service.Ch10Service;

//import com.company.web_ch09_01.service.Ch09CommonService;


// @Controller 는 Annotation이라 하며 행동 양식을 설정하는 것이라 생각하면 된다.

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// HomeController.class에서 사용할 log에 대한 작업
	
	@RequestMapping("/home")
	public String home() {
		logger.info("HOMECONTROLLER ACTIVATE");
		//commonService.method();
		return "home";
	}
	
	@RequestMapping("/")
	public String login() {
		logger.info("login activate");
		return "login";
	}
	
	@Autowired
	private Ch10Service ch10service;
	
	@PostMapping("login")
	public String login(String mid, String mpassword, HttpSession session) {
		// submit으로 전달받은 id값이 mid와 mpassword를 받는다.
		
		// Serivce에서 DB와 대조하여 확인한다.
		// 상태에 따른 반환을 저장할 것을 받는다.
		// 로그인, ID틀림, PW틀림
		// 아래 방법은 열거타입으로 판단
		Ch10LoginResult result = ch10service.login(mid,mpassword);
		
		if(result == Ch10LoginResult.FailId) {
			// session.setAttribute("error", "InCorrect ID");
			// return "redirect:/ch10/loginForm";
			// session으로 넘겨 줄 수 있다.			
			return "login";
			// 혹은 그냥 get방식으로 넘겨줄 수 있다.
		}
		else if(result == Ch10LoginResult.FailPw) {
			//session.setAttribute("error", "InCorrect PW");
			//return "redirect:/ch10/loginForm";			
			return "login";
		}
		
		
		// ID와 PW가 맞다면 Success일 테니까
		session.setAttribute("mid", mid); // 로그인된 ID 저장
		return "home";
	}
	
	@RequestMapping("loginForm")
	public String loginForm(String error, Model model) {
		// get방식으로 error가 넘어올 경우
		// 즉 로그인이 성공하면 get으로 넘어오는 것이 없기에 error에 NULL값이지만
		// 그렇지 않을 경우 error 메세지가 있기에 출력이 가능하다.
		if(error != null) {
			if(error.equals("fail_id")) {
				model.addAttribute("Id_error","InCorrect ID");
			}
			else if(error.equals("fail_pw")) {
				model.addAttribute("Pw_error","InCorrect PW");
			}
			// model에 저장해서 넘긴다.
		}
		return "ch10/loginForm";
	}
}

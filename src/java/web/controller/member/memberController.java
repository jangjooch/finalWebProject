package web.controller.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.controller.HomeController;

@Controller
@RequestMapping("/member")
public class memberController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/memberList")
	public String memberList() {
		logger.info("meberList() Activate");
		return "member/memberList";
	}
	
}
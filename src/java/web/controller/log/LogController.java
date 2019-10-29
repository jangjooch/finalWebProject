package web.controller.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/log")
public class LogController {
	
	private static final Logger logger = LoggerFactory.getLogger(LogController.class);
	
	@RequestMapping("/log_list")
	public String log_list() {
		return "log/log_list";
	}
	
	@RequestMapping("/log_Detail")
	public String log_detail() {
		return "log/log_detail";
	}
}

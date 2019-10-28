package web.controller.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/log")
public class logController {
	
	private static final Logger logger = LoggerFactory.getLogger(logController.class);
	
}

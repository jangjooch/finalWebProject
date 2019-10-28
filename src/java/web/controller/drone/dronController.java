package web.controller.drone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.controller.log.logController;


@Controller
@RequestMapping("/drone")
public class dronController {
	
	private static final Logger logger = LoggerFactory.getLogger(logController.class);
	
}

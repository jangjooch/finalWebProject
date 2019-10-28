package web.controller.item;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.controller.log.logController;

@Controller
@RequestMapping("/item")
public class itemController {

	private static final Logger logger = LoggerFactory.getLogger(logController.class);
	
	@RequestMapping("/item_list")
	public String itemList() {
		return "item/item_list";
	}
}

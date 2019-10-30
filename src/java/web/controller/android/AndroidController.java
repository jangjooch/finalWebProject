package web.controller.android;

import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.controller.log.LogController;
import web.dto.android.ItemDto;
import web.service.android.AndroidService;

@Controller
@RequestMapping("/android")
public class AndroidController {
	private static final Logger logger = LoggerFactory.getLogger(LogController.class);

	@Resource(name = "dataSource")
	private DataSource dataSource;

	@Autowired
	private AndroidService service;

	@RequestMapping("/getItemList")
	public String getItemList(Model model) {
		List<ItemDto> list = service.getItemList();
		JSONObject mainJson = new JSONObject();
		JSONArray arrJson = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONObject json = new JSONObject();
			json.put("i_code", list.get(i).getI_code());
			json.put("i_name", list.get(i).getI_name());
			arrJson.put(i, json);
		}
		mainJson.put("List", arrJson);
		model.addAttribute("list",mainJson.toString());
		return "android/itemList";
	}

}

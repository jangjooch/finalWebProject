package web.controller.mission;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.mission.MissionDto;
import web.dto.request.RequestDto;
import web.service.mission.MissionSerivce;

@Controller
@RequestMapping("/mission")
public class MissionController {
	
	private static final Logger logger = LoggerFactory.getLogger(MissionController.class);
	
	@Autowired
	MissionSerivce service;
	
	@Resource(name="dataSource")
	private DataSource datasource;
	
	
	
	
	
	
	@RequestMapping("/missionInList")
	public String missionInList(HttpSession session) {		
		
		logger.info("Controller missionInList Activate");
		int success = 0;
		
		List<RequestDto> missionList = service.missionList(session, success); 
		
		return "mission/mission_in_list";
	}
	@RequestMapping("/missionProList")
	public String missionProList(HttpSession session) {		
		
		logger.info("Controller missionProList Activate");
		int success = 1;
		
		List<RequestDto> missionList = service.missionList(session, success); 
		
		return "mission/mission_pro_list";
	}
	
	@RequestMapping("/missionAccept")
	public String missionAccept(int re_num) {
		
		logger.info("Controller missionAccept Activate");
		
		service.successChange(re_num);
		
		service.reduceMount(re_num);
		
		return "redirect:/mission/missionInList";
	}
	
	@RequestMapping("missionProcess")
	public String missionProcess(int re_num, Model model) {
		
		List<String> destination = service.getDestination(re_num);
		model.addAttribute("destination_lat",destination.get(0));
		model.addAttribute("destination_lng",destination.get(1));
		
		return "mission/mission_pro_detail";
	}
	
}

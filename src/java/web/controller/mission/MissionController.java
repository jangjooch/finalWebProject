package web.controller.mission;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.mission.MissionDto;
import web.service.mission.MissionSerivce;

@Controller
@RequestMapping("/mission")
public class MissionController {
	
	private static final Logger logger = LoggerFactory.getLogger(MissionController.class);
	
	@Autowired
	MissionSerivce missionservice;
	
	@Resource(name="dataSource")
	private DataSource datasource;
	
	@RequestMapping("/missionList")
	public String missionList(HttpSession session) {
		logger.info("Controller missionList Activate");
		
		List<MissionDto> missionList = missionservice.missionList(session); 
		
		return "mission/mission_list";
	}
	
}

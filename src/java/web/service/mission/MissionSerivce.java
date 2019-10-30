package web.service.mission;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.mission.MissionDao;
import web.dto.mission.MissionDto;

@Service
public class MissionSerivce {
	
	@Autowired
	MissionDao missiondao;

	private static final Logger logger = LoggerFactory.getLogger(MissionSerivce.class);
	
	public List<MissionDto> missionList(HttpSession session) {
		// TODO Auto-generated method stub
		logger.info("MissionService missionList Activate");
		List<MissionDto> missionList = missiondao.missionList(session);
		return missionList;
	}
	
}

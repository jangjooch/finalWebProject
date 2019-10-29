package web.service.mission;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.mission.MissionDao;
import web.dto.mission.MissionDto;

@Service
public class MissionSerivce {
	
	@Autowired
	MissionDao missiondao;

	public List<MissionDto> missionList(HttpSession session) {
		// TODO Auto-generated method stub
		List<MissionDto> missionList = missiondao.misstionList(session);
		return missionList;
	}
	
}

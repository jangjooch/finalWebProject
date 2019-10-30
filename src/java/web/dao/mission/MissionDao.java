package web.dao.mission;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.mission.MissionDto;
import web.dto.mission.MissionItemDto;

@Component
public class MissionDao {

	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(MissionDao.class);
	
	public List<MissionDto> missionList(HttpSession session) {
		// TODO Auto-generated method stub
		logger.info("MissionDao missionList Activate");
		Map<String, Object> param = new HashMap<String, Object>();
	    
		List<Integer> combineRe_num = sqlsessionTemplate.selectList("mission.mission_re_num");
		param.put("re_numList", combineRe_num); //map에 list를 넣는다.		
		int i = 0;
		logger.info("conbineRe_num");
		for(int num : combineRe_num) {
			logger.info( i + " : " + num);
			i++;
		}
		List<MissionItemDto> currentMissionItems = sqlsessionTemplate.selectList("mission.currentMissionItemList",param);
		i = 0;
		logger.info("missionItems");
		for(MissionItemDto itemDto : currentMissionItems) {
			logger.info( i + " : " + itemDto.getRe_num());
			i++;
		}
		session.setAttribute("currentMissionItems", currentMissionItems);
		
		List<MissionDto> currentMissionList = sqlsessionTemplate.selectList("mission.currentMissionList", param);
		i = 0;
		logger.info("currentMissionList");
		for(MissionDto missionDto : currentMissionList) {
			logger.info( i + " : " + missionDto.getRe_num() + " " + missionDto.getRe_time());
			i++;
		}
		session.setAttribute("currentMissionList", currentMissionList);
		
		return currentMissionList;
	}
}

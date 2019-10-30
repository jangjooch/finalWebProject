package web.dao.mission;

import java.util.ArrayList;
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
	
	public List<MissionDto> missionList(HttpSession session, int success) {
		// TODO Auto-generated method stub
		logger.info("MissionDao missionList Activate");
		Map<String, Object> param = new HashMap<String, Object>();
	    
		List<Integer> combineRe_num;
		
		if(success == 0) {
			combineRe_num = sqlsessionTemplate.selectList("mission.mission_in_re_num");
		}
		else {
			combineRe_num = sqlsessionTemplate.selectList("mission.mission_pro_re_num");
		}
		
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
		if(success==0) {
			session.setAttribute("currentMissionInItems", currentMissionItems);
		}
		else {
			session.setAttribute("currentMissionProItems", currentMissionItems);
		}
		
		
		List<MissionDto> currentMissionList = sqlsessionTemplate.selectList("mission.currentMissionList", param);
		i = 0;
		logger.info("currentMissionList");
		for(MissionDto missionDto : currentMissionList) {
			logger.info( i + " : " + missionDto.getRe_num() + " " + missionDto.getRe_time());
			i++;
		}
		if(success==0) {
			session.setAttribute("currentMissionInList", currentMissionList);
		}
		else {
			session.setAttribute("currentMissionProList", currentMissionList);
		}
		
		
		return currentMissionList;
	}

	public void successChange(int re_num) {
		// TODO Auto-generated method stub
		sqlsessionTemplate.update("mission.successChange",re_num);
	}

	public void reduceMount(int re_num) {
		// TODO Auto-generated method stub
		List<Integer> Getting_Icode = sqlsessionTemplate.selectList("mission.Getting_Icode",re_num);
		
		List<Integer> Getting_Iamount = sqlsessionTemplate.selectList("mission.Getting_Iamount",re_num);
		
		List<Integer> Getting_Imount = new ArrayList<Integer>();
		for(int i_code : Getting_Icode) {
			int mount = (int)sqlsessionTemplate.selectOne("mission.GetMountByICode", i_code);
			Getting_Imount.add(mount);
		}
		
		for(int i = 0 ; i < Getting_Icode.size() ; i++) {
			Map<String, Integer> parsing = new HashMap<String, Integer>();
			parsing.put("i_code", Getting_Icode.get(i));
			if(Getting_Imount.get(i) - Getting_Iamount.get(i) < 0) {
				parsing.put("i_amount", 0);
			}
			else {
				parsing.put("i_amount", Getting_Imount.get(i) - Getting_Iamount.get(i));
			}
			sqlsessionTemplate.update("mission.reduceMount", parsing);
		}
		
	}

	public List<String> getDestination(int re_num) {
		// TODO Auto-generated method stub
		
		MissionDto missiondto = sqlsessionTemplate.selectOne("mission.GetMissionByReNum",re_num);
		
		List<String> destination = new ArrayList<String>();
		destination.add(missiondto.getRe_location_x());
		destination.add(missiondto.getRe_location_y());
		
		return destination;
	}
}

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
import web.dto.request.RequestDto;

@Component
public class MissionDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(MissionDao.class);
	
	public List<RequestDto> missionList(HttpSession session, int success) {
		// TODO Auto-generated method stub
		logger.info("MissionDao missionList Activate");
		Map<String, Object> param = new HashMap<String, Object>();
	    
		List<Integer> combineRe_num;
		
		if(success == 0) {
			combineRe_num = sqlSessionTemplate.selectList("mission.mission_in_re_num");
		}
		else {
			combineRe_num = sqlSessionTemplate.selectList("mission.mission_pro_re_num");
		}
		
		param.put("re_numList", combineRe_num); //map에 list를 넣는다.		
		int i = 0;
		logger.info("conbineRe_num");
		for(int num : combineRe_num) {
			logger.info( i + " : " + num);
			i++;
		}
		
		List<MissionItemDto> currentMissionItems = sqlSessionTemplate.selectList("mission.currentMissionItemList",param);
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
		
		
		List<RequestDto> currentMissionList = sqlSessionTemplate.selectList("mission.currentMissionList", param);
		i = 0;
		logger.info("currentMissionList");
		for(RequestDto missionDto : currentMissionList) {
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
		sqlSessionTemplate.update("mission.successChange",re_num);
	}

	public void reduceMount(int re_num) {
		// TODO Auto-generated method stub
		List<Integer> Getting_Icode = sqlSessionTemplate.selectList("mission.Getting_Icode",re_num);
		
		List<Integer> Getting_Iamount = sqlSessionTemplate.selectList("mission.Getting_Iamount",re_num);
		
		List<Integer> Getting_Imount = new ArrayList<Integer>();
		for(int i_code : Getting_Icode) {
			int mount = (int)sqlSessionTemplate.selectOne("mission.GetMountByICode", i_code);
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
			sqlSessionTemplate.update("mission.reduceMount", parsing);
		}
		
	}

	public List<String> getDestination(int re_num) {
		// TODO Auto-generated method stub
		
		RequestDto requestDto = sqlSessionTemplate.selectOne("mission.GetMissionByReNum",re_num);
		
		List<String> destination = new ArrayList<String>();
		destination.add(requestDto.getRe_location_x());
		destination.add(requestDto.getRe_location_y());
		
		return destination;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// -------------------------------------
	// 페이징 로우넘
	public int selectTotalRowNo() {
		int totalRowNo = sqlSessionTemplate.selectOne("mission.selectTotalRowNum");
		return totalRowNo;
	}

	// 요청목록
	public List<MissionDto> requestList(int startRowNo, int endRowNo) {
		System.out.println("디에이오 진입");
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<MissionDto> requestList = sqlSessionTemplate.selectList("mission.selectRequestList", map);
		System.out.println("디에이오 끝");
		return requestList;	
	}

	public MissionDto selectOneMission(int re_num) {
		MissionDto mission = sqlSessionTemplate.selectOne("mission.missionDetail", re_num);
		return mission;
	}
}

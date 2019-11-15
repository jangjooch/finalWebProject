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

import web.dto.item.ItemDto;
import web.dto.item.MissionItemsDto;
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
	
	// 아이템 가져오기
	public List<ItemDto> selectItemList() {
		List<ItemDto> list = sqlSessionTemplate.selectList("mission.itemList");
		return list;
	}

	// 전체 아이템 마운트 가져오기
	public List<ItemDto> selectItemCheckList(){
		List<ItemDto> list = sqlSessionTemplate.selectList("mission.selectItemList");
		return list;
	}
	
	// 요청에 대한 List 가져오기
	public List<MissionItemsDto> selectItemMount(int re_num) {
		List<MissionItemsDto> list = sqlSessionTemplate.selectList("mission.selectRequestItemList", re_num);
		return list;
	}
	
	// 물품 빼기 UPDATE
	public int updateRequestItemAmount(int requestItemMount, int requestItemCode) {
		Map<String, Integer> map = new HashMap<>();
		map.put("requestItemMount", requestItemMount);
		map.put("requestItemCode", requestItemCode);
		
		int rows = sqlSessionTemplate.update("mission.updateItemMount", map);
		
		return rows;
	}
	
	// 요청 SUCCESS CHANGE UPDATE 
	public int updateRequestSuccessChange(int re_num) {
		int rows = sqlSessionTemplate.update("mission.updateRequestSuccess", re_num);
		
		return rows;
	}
	
	public int updateRequestSuccessChangeRefusal(int re_num) {
		int rows = sqlSessionTemplate.update("mission.updateRequestSuccess2", re_num);
		
		return rows;
	}
	
	/* ****************** re_success 가 1 인 List(드론출발대기) *******************/
	// 요청 페이지 List
	public List<RequestDto> selectSuccess1List(int startRowNo, int endRowNo){
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		
		List<RequestDto> list = sqlSessionTemplate.selectList("mission.selectRequestSuccess1List", map);
		return list;
	}
	
	public int selectSuccess1ListCount() {
		int count = sqlSessionTemplate.selectOne("mission.selectSuccess1ListCount");
		return count;
	}
	
	/* ****************** re_success 가 2 인 List(실행중) *******************/
	public List<RequestDto> selectSuccess2List(int startRowNo, int endRowNo){
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		
		List<RequestDto> list = sqlSessionTemplate.selectList("mission.selectRequestSuccess2List", map);
		
		return list;
	}
	
	public int selectSuccess2ListCount() {
		int count = sqlSessionTemplate.selectOne("mission.selectSuccess2ListCount");
		return count;
	}
	
	// 물품 적재 -> 적재 완료 업데이트
	public int updateSuccessChainge1Eseo2(int re_num) {
		int rows = sqlSessionTemplate.update("mission.updateSuccessChainge1Eseo2", re_num);
		return rows;
	}

	public int updateSuccessChainge2Eseo3(int re_num) {
		int rows = sqlSessionTemplate.update("mission.updateSuccessChainge2Eseo3", re_num);
		return 0;
	}
	
	/*  */
	public List<RequestDto> mqttAllTable(){
		List<RequestDto> list = sqlSessionTemplate.selectList("mission.mqttAllTable");
		return list;
	}
}

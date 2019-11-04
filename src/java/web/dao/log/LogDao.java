package web.dao.log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.drone.DroneDto;
import web.dto.drone.DroneMissionDto;
import web.dto.log.LogDto;
import web.dto.member.MemberDto;
import web.dto.mission.MissionDto;

@Component
public class LogDao {
	private static final Logger logger = LoggerFactory.getLogger(LogDao.class);

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public LogDto getSelectLog(int d_m_number) {
		LogDto logDto = new LogDto();
		
		// 드론 미션 테이블에서 한행 가져오기
		DroneMissionDto droneMissionDto = sqlSessionTemplate.selectOne("droneMission.selectDroneMissionDetail", d_m_number);
		// 드론  테이블에서 드론 미션테이블 primary에 대한 한행 가져오기
		DroneDto droneDto = sqlSessionTemplate.selectOne("drone.selectdrone", droneMissionDto.getD_number());
		// 요청 테이블에서 드론 미션 테이블의 요청번호의 한행 가져오기
		MissionDto missionDto = sqlSessionTemplate.selectOne("mission.GetMissionByReNum2", droneMissionDto.getRe_num());
		// 요청자에 대한 회원 정보 한행으로 가져오기
		MemberDto memberDto = sqlSessionTemplate.selectOne("member.memberSelectOne", missionDto.getM_num());
		
		logDto.setDroneDto(droneDto);
		logDto.setDroneMissionDto(droneMissionDto);
		logDto.setMemberDto(memberDto);
		logDto.setMissionDto(missionDto);
		
		return logDto;
	}
	// 전체 리스트
	public List<LogDto> getSelectLogList(int startRowNo, int endRowNo){
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		
		
		List<LogDto> logDtoList = new ArrayList<LogDto>();
		List<DroneMissionDto> droneMissionDtoList = sqlSessionTemplate.selectList("droneMission.droneMemberListEx", map);
		
		for(int i=0; i<droneMissionDtoList.size(); i++) {
			LogDto logdto = new LogDto();
			
			DroneDto droneDto = sqlSessionTemplate.selectOne("drone.selectdrone", droneMissionDtoList.get(i).getD_m_number());
			MissionDto missionDto = sqlSessionTemplate.selectOne("mission.GetMissionByReNum2", droneMissionDtoList.get(i).getRe_num());
			MemberDto memberDto = sqlSessionTemplate.selectOne("member.memberSelectOne", missionDto.getM_num());
			
			logdto.setDroneMissionDto(droneMissionDtoList.get(i));
			logdto.setDroneDto(droneDto);
			logdto.setMissionDto(missionDto);
			logdto.setMemberDto(memberDto);
			
			logDtoList.add(logdto);
		}
		
		return logDtoList;
	}
	
	public List<LogDto> getSelectChooseList(String choose, int startRowNo, int endRowNo){
		Map<String, String> map = new HashMap<>();
		map.put("choose", choose);
		map.put("startRowNo", String.valueOf(startRowNo));
		map.put("endRowNo", String.valueOf(endRowNo));
		
		
		List<LogDto> logDtoList = new ArrayList<LogDto>();
		List<DroneMissionDto> droneMissionDtoList = sqlSessionTemplate.selectList("droneMission.droneMemberListEx", map);
		
		for(int i=0; i<droneMissionDtoList.size(); i++) {
			LogDto logdto = new LogDto();
			
			DroneDto droneDto = sqlSessionTemplate.selectOne("drone.selectdrone", droneMissionDtoList.get(i).getD_m_number());
			MissionDto missionDto = sqlSessionTemplate.selectOne("mission.GetMissionByReNum2", droneMissionDtoList.get(i).getRe_num());
			MemberDto memberDto = sqlSessionTemplate.selectOne("member.memberSelectOne", missionDto.getM_num());
			
			logdto.setDroneMissionDto(droneMissionDtoList.get(i));
			logdto.setDroneDto(droneDto);
			logdto.setMissionDto(missionDto);
			logdto.setMemberDto(memberDto);
			
			logDtoList.add(logdto);
		}
		
		return logDtoList;
	}
	
}

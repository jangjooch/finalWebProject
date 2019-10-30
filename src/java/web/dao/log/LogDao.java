package web.dao.log;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dao.drone.DroneDao;
import web.dao.drone.DroneMissionDao;
import web.dao.member.MemberDao;
import web.dao.mission.MissionDao;
import web.dto.drone.DroneDto;
import web.dto.drone.DroneMissionDto;
import web.dto.log.LogDto;
import web.dto.member.MemberDto;
import web.dto.mission.MissionDto;

@Component
public class LogDao {
	private static final Logger logger = LoggerFactory.getLogger(LogDao.class);
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private DroneMissionDao droneMissionDao;
	@Autowired
	private DroneDao droneDao;
	@Autowired
	private MissionDao missionDao;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public LogDto getSelectLog(int d_m_number) {
		LogDto logDto = new LogDto();
		
		// 드론 미션 테이블에서 한행 가져오기
		DroneMissionDto droneMissionDto = sqlSessionTemplate.selectOne("droneMission.selectDroneMissionDetail", d_m_number);
		// 드론  테이블에서 드론 미션테이블 primary에 대한 한행 가져오기
		DroneDto droneDto = sqlSessionTemplate.selectOne("drone.selectdrone", droneMissionDto.getD_number());
		// 요청 테이블에서 드론 미션 테이블의 요청번호의 한행 가져오기
		MissionDto missionDto = sqlSessionTemplate.selectOne("mission.GetMissionByReNum", droneMissionDto.getRe_num());
		// 요청자에 대한 회원 정보 한행으로 가져오기
		MemberDto memberDto = sqlSessionTemplate.selectOne("member.memberSelectOne", missionDto.getM_num());
		
		return logDto;
	}
}

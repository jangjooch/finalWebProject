package web.dto.log;

import web.dto.drone.DroneDto;
import web.dto.drone.DroneMissionDto;
import web.dto.member.MemberDto;
import web.dto.mission.MissionDto;

public class LogDto {
	private MemberDto memberDto;  			// 회원 테이블
	private MissionDto missionDto;			// 물품 테이블
	private DroneDto droneDto;				// 드론 테이블
	private DroneMissionDto droneMissionDto;// 드론 미션 테이블 
}

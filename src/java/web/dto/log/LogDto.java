package web.dto.log;

import web.dto.drone.DroneDto;
import web.dto.drone.DroneMissionDto;
import web.dto.member.MemberDto;
import web.dto.mission.MissionDto;

public class LogDto {
	private MemberDto memberDto;  			// 회원 테이블
	private MissionDto missionDto;			// 요청 테이블
	private DroneDto droneDto;				// 드론 테이블
	private DroneMissionDto droneMissionDto;// 드론 미션 테이블 
	
	public MemberDto getMemberDto() {
		return memberDto;
	}
	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}
	public MissionDto getMissionDto() {
		return missionDto;
	}
	public void setMissionDto(MissionDto missionDto) {
		this.missionDto = missionDto;
	}
	public DroneDto getDroneDto() {
		return droneDto;
	}
	public void setDroneDto(DroneDto droneDto) {
		this.droneDto = droneDto;
	}
	public DroneMissionDto getDroneMissionDto() {
		return droneMissionDto;
	}
	public void setDroneMissionDto(DroneMissionDto droneMissionDto) {
		this.droneMissionDto = droneMissionDto;
	}
	
	
}

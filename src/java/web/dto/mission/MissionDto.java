package web.dto.mission;

import java.util.Date;
import java.util.List;

import web.dto.item.MissionItemsDto;
import web.dto.member.MemberDto;


public class MissionDto {
	
	private int re_num; // 요청 번호. primary
	private Date re_time; // 요청 날짜
	private String re_location_x; // 신청 위치 X
	private String re_location_y; // 신청 위치 Y
	private int re_success; // 요청대기 요청 수락 판별용
	private int m_num;		// 멤버 번호
	private MemberDto member;
	
	private List<MissionItemsDto> missionItems;
	// mission이랑 연결되어 있으니 이렇게 하여 1 대 N의 관계를 형성한다.
	
	public MemberDto getMember() {
		return member;
	}
	public void setMember(MemberDto member) {
		this.member = member;
	}
	public List<MissionItemsDto> getMissionItems() {
		return missionItems;
	}
	public void setMissionItems(List<MissionItemsDto> missionItems) {
		this.missionItems = missionItems;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getRe_num() {
		return re_num;
	}
	public int getRe_success() {
		return re_success;
	}
	public void setRe_success(int re_success) {
		this.re_success = re_success;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public Date getRe_time() {
		return re_time;
	}
	public void setRe_time(Date re_time) {
		this.re_time = re_time;
	}
	public String getRe_location_x() {
		return re_location_x;
	}
	public void setRe_location_x(String re_location_x) {
		this.re_location_x = re_location_x;
	}
	public String getRe_location_y() {
		return re_location_y;
	}
	public void setRe_location_y(String re_location_y) {
		this.re_location_y = re_location_y;
	}
	
}

package web.dto.member;

import java.util.Date;

public class ReportDto {
	private int requester_num;	// 요청자 멤버번호
	private int mamnager_num;		// 처리자 멤버번호
	private Date re_time;		// 요청날짜
	private int d_m_number;		// 요청번호
	private String requester_name;		// 요청자 이름
	private String manager_name;		// 처리자 이름
	private String re_location_x;		// 좌표
	private String re_location_y;		// 좌표 
	
	
	
	
	public int getD_m_number() {
		return d_m_number;
	}
	public void setD_m_number(int d_m_number) {
		this.d_m_number = d_m_number;
	}
	public int getRequester_num() {
		return requester_num;
	}
	public void setRequester_num(int requester_num) {
		this.requester_num = requester_num;
	}
	public int getMamnager_num() {
		return mamnager_num;
	}
	public void setMamnager_num(int mamnager_num) {
		this.mamnager_num = mamnager_num;
	}
	public Date getRe_time() {
		return re_time;
	}
	public void setRe_time(Date re_time) {
		this.re_time = re_time;
	}
	public String getRequester_name() {
		return requester_name;
	}
	public void setRequester_name(String requester_name) {
		this.requester_name = requester_name;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
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

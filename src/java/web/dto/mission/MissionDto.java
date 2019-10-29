package web.dto.mission;

import java.util.Date;


public class MissionDto {
	
	private int re_num; // 요청 번호. primary
	private Date re_time; // 요청 날짜
	private String re_location_x; // 신청 위치 X
	private String re_location_y; // 신청 위치 Y
	
	
	public int getRe_num() {
		return re_num;
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

package web.dto.log;

import java.util.Date;

public class RequestDto {
	private int re_num;
	private Date re_time;
	private Double re_location_x;
	private Double re_location_y;
	private int m_num;
	private boolean re_success;
	
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
	public Double getRe_location_x() {
		return re_location_x;
	}
	public void setRe_location_x(Double re_location_x) {
		this.re_location_x = re_location_x;
	}
	public Double getRe_location_y() {
		return re_location_y;
	}
	public void setRe_location_y(Double re_location_y) {
		this.re_location_y = re_location_y;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public boolean isRe_success() {
		return re_success;
	}
	public void setRe_success(boolean re_success) {
		this.re_success = re_success;
	}
	
	
}

package web.dto.mission;

import java.util.Date;

import web.dto.drone.DroneDto;
import web.dto.request.RequestDto;


public class MissionDto {
	
	
	private int d_m_number; 
	private int d_number; 
	private int re_num; 
	private int m_num; 
	private String d_m_start; 
	private Date d_m_prepatation;
	
	private DroneDto droneDto;
	private RequestDto requestDto;
	
	
	public RequestDto getRequestDto() {
		return requestDto;
	}
	public void setRequestDto(RequestDto requestDto) {
		this.requestDto = requestDto;
	}
	public DroneDto getDroneDto() {
		return droneDto;
	}
	
	
	
	public void setDroneDto(DroneDto droneDto) {
		this.droneDto = droneDto;
	}
	public int getD_m_number() {
		return d_m_number;
	}
	public void setD_m_number(int d_m_number) {
		this.d_m_number = d_m_number;
	}
	public int getD_number() {
		return d_number;
	}
	public void setD_number(int d_number) {
		this.d_number = d_number;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getD_m_start() {
		return d_m_start;
	}
	public void setD_m_start(String d_m_start) {
		this.d_m_start = d_m_start;
	}
	public Date getD_m_prepatation() {
		return d_m_prepatation;
	}
	public void setD_m_prepatation(Date d_m_prepatation) {
		this.d_m_prepatation = d_m_prepatation;
	}

	
	
	
	
	
	
}

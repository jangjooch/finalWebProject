package web.dto.drone;

import java.sql.Date;

public class droneMissionDto {
	
	private int d_m_number;
	// drone d_num former
	private int d_number;
	// request re_num former
	private int re_num;
	// member m_num former
	private int m_num;
	private String d_m_stat;
	private Date d_m_preparation;
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
	public String getD_m_stat() {
		return d_m_stat;
	}
	public void setD_m_stat(String d_m_stat) {
		this.d_m_stat = d_m_stat;
	}
	public Date getD_m_preparation() {
		return d_m_preparation;
	}
	public void setD_m_preparation(Date d_m_preparation) {
		this.d_m_preparation = d_m_preparation;
	}
	
	
	
}

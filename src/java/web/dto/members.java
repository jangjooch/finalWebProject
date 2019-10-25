package web.dto;

public class members {
	
	private int m_num;
	private String m_id;
	private String m_name;
	private String m_pw;
	private int m_phone;
	private int m_rate;
	// 데이터 결과 저장을 위한 dto는 이렇듯 private으로 되어
	// setter가 존재하여야 한다. setter가 있어야
	// property로 넘어올 수 있기 때문이다.
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public int getM_phone() {
		return m_phone;
	}
	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_rate() {
		return m_rate;
	}
	public void setM_rate(int m_rate) {
		this.m_rate = m_rate;
	}
	
}

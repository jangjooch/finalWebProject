package web.dto.drone;

import java.util.Date;

import web.dto.member.MemberDto;
import web.dto.request.RequestDto;

public class DroneMissionDto {
	private int rn;
	
	private int d_m_number;
	// drone d_num former
	private int d_number;
	// request re_num former
	private int re_num;
	// member m_num former
	private int m_num;
	
	private MemberDto memberDto;
	private String d_m_start;
	private Date d_m_preparation;
	private RequestDto requestDto;
	
	
	
	
	
	
	
	
	public RequestDto getRequestDto() {
		return requestDto;
	}
	public void setRequestDto(RequestDto requestDto) {
		this.requestDto = requestDto;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
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
	
	public MemberDto getMemberDto() {
		return memberDto;
	}
	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}
	public String getD_m_start() {
		return d_m_start;
	}
	public void setD_m_start(String d_m_start) {
		this.d_m_start = d_m_start;
	}
	public Date getD_m_preparation() {
		return d_m_preparation;
	}
	public void setD_m_preparation(Date d_m_preparation) {
		this.d_m_preparation = d_m_preparation;
	}
	
	
	
}

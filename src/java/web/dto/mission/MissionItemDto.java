package web.dto.mission;

public class MissionItemDto {
	
	private int re_num; // 조건문으로 뽑아내기 위해서
						// MissionDto랑 뽑아내기 위해서
	private String i_name; // 요청 물품 명
	private int i_amount; // 요청 수량
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public int getI_amount() {
		return i_amount;
	}
	public void setI_amount(int i_amount) {
		this.i_amount = i_amount;
	}
	
}

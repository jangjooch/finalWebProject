package web.dto.item;

public class MissionItems {

	private int re_num;
	private int i_code;
	private ItemDto itemDto;	// 물품 상세 테이블
	private int i_amount;
	
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getI_code() {
		return i_code;
	}
	public void setI_code(int i_code) {
		this.i_code = i_code;
	}
	public ItemDto getItemdto() {
		return itemDto;
	}
	public void setItemdto(ItemDto itemDto) {
		this.itemDto = itemDto;
	}
	public int getI_amount() {
		return i_amount;
	}
	public void setI_amount(int i_amount) {
		this.i_amount = i_amount;
	}
	
	
	
}

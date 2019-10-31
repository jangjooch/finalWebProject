package web.dto.item;

public class MissionItemsDto {

	private int re_num;
	private int i_code;
	private int i_amount;
	private ItemDto itemDto;	// 물품 상세 테이블
	
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
	public ItemDto getItemDto() {
		return itemDto;
	}
	public void setItemDto(ItemDto itemDto) {
		this.itemDto = itemDto;
	}
	public int getI_amount() {
		return i_amount;
	}
	public void setI_amount(int i_amount) {
		this.i_amount = i_amount;
	}
	
	
	
}

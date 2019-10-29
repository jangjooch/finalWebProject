package web.service.item;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dao.item.ItemDao;
import web.dto.item.ItemDto;

@Component
public class ItemService {	
	
	private static final Logger logger = LoggerFactory.getLogger(ItemService.class);
	
	@Autowired
	ItemDao itemdao;
	
	public int getTotalRowNum() {
		// TODO Auto-generated method stub
		int totalRowNum = itemdao.selectTotalRowNum();
		return totalRowNum;
	}

	public List<ItemDto> getItemList(int startRowNo, int endRowNo) {
		// TODO Auto-generated method stub
		List<ItemDto> item_list = itemdao.selectList(startRowNo,endRowNo);
		return item_list;
	}

	public List<Integer> search_iCode(String findding, String selectGroup) {
		// TODO Auto-generated method stub
		List<Integer> searched_iCode = itemdao.search_iCode(findding, selectGroup); 		
		return searched_iCode;
	}
	public List<ItemDto> getItemList_Searched(List<Integer> searched_iCode, int size) {
		// TODO Auto-generated method stub
		List<ItemDto> item_list = itemdao.selectList_Searched(searched_iCode, size);
		return item_list;
	}

	public ItemDto getItem(int i_code) {
		// TODO Auto-generated method stub
		ItemDto itemdto = itemdao.selectItem(i_code);
		return itemdto;
	}

	public void removeItem(int i_code) {
		// TODO Auto-generated method stub
		int removed = itemdao.removeItem(i_code);
		logger.info("removed item content + " + removed);
	}

	public boolean exist(String i_name) {
		// TODO Auto-generated method stub
		ItemDto item = itemdao.selectByName(i_name);
		if(item==null) {
			return true;
		}
		else {
			return false;
		}
		
	}

	public void join(ItemDto item) {
		// TODO Auto-generated method stub
		logger.info("itemservice join activate");
		itemdao.insert(item);
	}

	public void edit(ItemDto item) {
		// TODO Auto-generated method stub
		logger.info("itemservice edit activate");
		itemdao.edit(item);
	}


}

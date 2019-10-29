package web.dao.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.item.ItemDto;

@Component
public class ItemDao {

	private static final Logger logger = LoggerFactory.getLogger(ItemDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int selectTotalRowNum() {
		// TODO Auto-generated method stub
		int selectTotalRowNum = sqlSessionTemplate.selectOne("item.selectTotalRowNum");
		return selectTotalRowNum;
	}

	public List<ItemDto> selectList(int startRowNo, int endRowNo) {
		// TODO Auto-generated method stub
		Map<String, Integer> rowNum = new HashMap<String, Integer>();
		rowNum.put("startRowNo", startRowNo);
		rowNum.put("endRowNo", endRowNo);
		List<ItemDto> item_list = sqlSessionTemplate.selectList("item.selectList", rowNum);
		return item_list;
	}
	
	public List<Integer> search_iCode(String findding, String selectGroup) {
		// TODO Auto-generated method stub
		
		List<Integer> searched_iCode;
				
		if(selectGroup.equals("code")) {
			//String i_code = findding;
			int findding_code = Integer.parseInt(findding);
			searched_iCode = sqlSessionTemplate.selectList("item.searchByCode", findding_code);
		}
		else if(selectGroup.equals("name")) {
			//String i_name = findding;
			searched_iCode = sqlSessionTemplate.selectList("item.searchByName", findding);
		}
		else if(selectGroup.equals("class")) {
			//String i_class = findding;
			searched_iCode = sqlSessionTemplate.selectList("item.searchByClass", findding);
		}
		else {
			searched_iCode = sqlSessionTemplate.selectList("");
		}
		
		return searched_iCode;
	}
	public List<ItemDto> selectList_Searched(List<Integer> searched_iCode, int size) {
		// TODO Auto-generated method stub
		Map<String, Integer> rowNum = new HashMap<String, Integer>();
		
		int i = 0;
		int dumpNum = 0;
		for(int num : searched_iCode) {
			i++;
			rowNum.put("i_code0"+i, num);
			dumpNum = num;			
		}
		logger.info("searched_iCode size : " + searched_iCode.size());
		if(searched_iCode.size() != 5) {
			logger.info("Acivate dumpNum");
			for(int j = i ; j <= 5 ; j++) {
				rowNum.put("i_code0"+j, dumpNum);
			}
		}
		
		int idx = 1;
		for(int num : searched_iCode) {
			logger.info(String.valueOf(num) + " " + String.valueOf(idx));
			idx ++;
		}
		
		List<ItemDto> item_list = sqlSessionTemplate.selectList("item.selectList_searched", rowNum);
		
		return item_list;
	}

	
	public ItemDto selectItem(int i_code) {
		// TODO Auto-generated method stub
		ItemDto itemdto = sqlSessionTemplate.selectOne("item.selectByICode",i_code);
		
		return itemdto;
	}

	public int removeItem(int i_code) {
		// TODO Auto-generated method stub
		int removed = sqlSessionTemplate.delete("item.removeItem",i_code);
		return removed;
	}

	public ItemDto selectByName(String i_name) {
		// TODO Auto-generated method stub
		ItemDto item = sqlSessionTemplate.selectOne("item.selectByName",i_name);
		
		return item;
	}

	public void insert(ItemDto item) {
		// TODO Auto-generated method stub
		logger.info("item insert Activate");
		int get_code = sqlSessionTemplate.selectOne("item.settingCode");
		get_code++;
		logger.info("icode : " + get_code);		
		item.setI_code(get_code);
		int inserted = sqlSessionTemplate.insert("item.insertItem", item);
		logger.info("inserted item : " + inserted);
	}

	public void edit(ItemDto item) {
		// TODO Auto-generated method stub
		logger.info("item update Activate");
		int updated = sqlSessionTemplate.update("item.update",item);
		logger.info("updated item : " + updated);
		
	}


	

}
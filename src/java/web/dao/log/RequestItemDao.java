package web.dao.log;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.log.RequestItemDto;

@Component
public class RequestItemDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 아이템 전체 리스트
	public List<RequestItemDto> requestItemList(){
		List<RequestItemDto> requestItemList = sqlSessionTemplate.selectList("request_Item.selectRequestItemList");
		return requestItemList;
	}
	
	// 요청에 대한 물품
	public List<RequestItemDto> requestItem(int re_num) {
		List<RequestItemDto> ru_numRequestItemList = 
					sqlSessionTemplate.selectList("request_Item.selectRequestItemList", re_num);
		return ru_numRequestItemList;
	}
	
	// insert
	// update
	// delete
	
	
}

package web.dao.log;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.log.RequestDto;

@Component
public class RequestDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 전체 리스트 dto
	public List<RequestDto> selectRequestList(){
		List<RequestDto> requestList = sqlSessionTemplate.selectList("requestList");
		return requestList;
	}
	
	// primary 키에 대한 한행
	public RequestDto selectOneRequest(int re_num) {
		RequestDto requestDto = sqlSessionTemplate.selectOne("requestSelectOne", re_num);
		return requestDto;
	}
	
	// insert
	// update
	// delete
}

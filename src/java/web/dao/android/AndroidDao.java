package web.dao.android;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dao.drone.DroneDao;
import web.dto.android.ItemDto;
import web.dto.android.MemberDto;
import web.dto.android.RequestDto;
import web.dto.android.RequestItemDto;

@Component
public class AndroidDao {
private static final Logger logger = LoggerFactory.getLogger(DroneDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ItemDto> getItemList() {
		List<ItemDto> list = sqlSessionTemplate.selectList("android.selectList");
		
		return list;
	}

	public MemberDto login(String m_id) {
		MemberDto result=sqlSessionTemplate.selectOne("android.selectMemberByMid",m_id);
		return result;
	}

	public int getNewRequestNum() {
		int result=sqlSessionTemplate.selectOne("android.selectMaxRequestNum");
		return result;
	}

	public int addRequest(RequestDto requestDto) {
		int result=sqlSessionTemplate.insert("android.insertRequest",requestDto);
		return result;
	}

	public int requestItem(List<RequestItemDto> requestItemList) {
		int result=sqlSessionTemplate.insert("android.insertRequestItem",requestItemList);
		return result;
	}

	public List<RequestItemDto> responseItem(int re_num) {
		List<RequestItemDto> list=sqlSessionTemplate.selectList("android.responseItem",re_num);
		return list;
	}

	public List<RequestItemDto> getRequestItemByRequestNum(int requestNum) {
		List<RequestItemDto> list=sqlSessionTemplate.selectList("android.getItemListByRequestNum",requestNum);
		return list;
	}

	public int getMid(String id, String pw) {
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		int result=sqlSessionTemplate.selectOne("android.getMid",map);
		return result;
	}
}

package web.dao.android;

import java.util.List;
import org.springframework.ui.Model;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dao.drone.DroneDao;
import web.dto.android.ItemDto;

@Component
public class AndroidDao {
private static final Logger logger = LoggerFactory.getLogger(DroneDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ItemDto> getItemList() {
		List<ItemDto> list = sqlSessionTemplate.selectList("android.selectList");
		
		return list;
	}
}

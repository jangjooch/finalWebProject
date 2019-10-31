package web.dao.drone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.drone.DroneMissionDto;

@Component
public class DroneMissionDao {
	private static final Logger logger = LoggerFactory.getLogger(DroneMissionDao.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<DroneMissionDto> droneMissionList(int startRowNo, int endRowNo){
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		
		List<DroneMissionDto> droneMissionDtoList =
				sqlSessionTemplate.selectList("droneMission.selectDroneMission", map);
	
		return droneMissionDtoList;
	}

	public int droneMissionCountRows() {
		int rows = sqlSessionTemplate.selectOne("droneMission.selectDroneMissionCount");
		return rows;
	}

	public DroneMissionDto droneMissionDtoSelectOne(int d_m_number) {
		DroneMissionDto droneMissionDto = sqlSessionTemplate.selectOne("droneMission.selectDroneMissionDetail", d_m_number);
		return droneMissionDto;
	}
	
}

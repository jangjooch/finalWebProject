
package web.dao.drone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.drone.DroneDto;

@Component
public class DroneDao {
	
	private static final Logger logger = LoggerFactory.getLogger(DroneDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<DroneDto> selectList(int drone_startRowNo, int drone_endRowNo){
		
		Map<String, Integer> map = new HashMap<>();
		map.put("drone_startRowNo", drone_startRowNo);
		map.put("drone_endRowNo", drone_endRowNo);
		logger.info("drone select in 실행");
		
		List<DroneDto> drone_list = sqlSessionTemplate.selectList("drone.selectList", map);
		logger.info("drone select out 실행");
		return drone_list;
		
	}
	
	public int selectTotalRowNo() {
		
		int totalRowNum = sqlSessionTemplate.selectOne("drone.selectDroneTotalRowNum");
		return totalRowNum;
		
	}
	
	public DroneDto selectdrone(int drone_no) {
		logger.info("selectdrone in 실행");
		DroneDto drone = sqlSessionTemplate.selectOne("drone.selectdrone", drone_no);
		logger.info("selectdrone out 실행");
		return drone;
		
	}

	public void insert(DroneDto dronedto) {
		logger.info("insertdrone in 실행");
		
		sqlSessionTemplate.selectOne("drone.insertdrone", dronedto);	// nullpointerexeption
		logger.info("삽입값");
		
	}

	public void delete(int d_number) {
		
		sqlSessionTemplate.selectOne("drone.deletedrone", d_number);
		logger.info("delete complete");
	}

	public void update(DroneDto dronedto) {
		sqlSessionTemplate.selectOne("drone.updatedrone", dronedto);
		logger.info("update complete");
		
	}

	public List<DroneDto> selectSearch(int drone_startRowNo, int drone_endRowNo){
		
		Map<String, Integer> map = new HashMap<>();
		map.put("drone_startRowNo", drone_startRowNo);
		map.put("drone_endRowNo", drone_endRowNo);
		logger.info("drone select in 실행");
		
		List<DroneDto> drone_list = sqlSessionTemplate.selectList("selectDroneSearch", map);
		logger.info("drone select out 실행");
		return drone_list;
		
	}
	
	
	/* ***************** 운행가능 리스트 ***************** */
	public List<DroneDto> selectStateList(int drone_startRowNo, int drone_endRowNo, String totalWeight){
		int intTotalWeight = Integer.parseInt(totalWeight);
		Map<String, Integer> map = new HashMap<>();
		map.put("drone_startRowNo", drone_startRowNo);
		map.put("drone_endRowNo", drone_endRowNo);
		map.put("totalWeight", intTotalWeight);
		
		List<DroneDto> drone_list = sqlSessionTemplate.selectList("drone.selectStateList", map);
		return drone_list;
	}
	
	public int selectStateTotalRowNo(String totalWeight) {
		int intTotalWeight = Integer.parseInt(totalWeight);
		int totalRowNum = sqlSessionTemplate.selectOne("drone.selectStateCount", intTotalWeight);
		
		return totalRowNum;
	}
	
	// 드론 상태 업데이트 -> 수행중
	public int updateDrontState(int d_number) {
		int update = sqlSessionTemplate.update("drone.updateDroneState", d_number);
		return update;
	}
	
	// 드론 상태 업데이트 -> 대기중
	public void updateDroneState1(int d_number) {
		int update = sqlSessionTemplate.update("drone.updateDroneState1", d_number);
		
	}
}

package web.service.drone;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.drone.DroneDao;
import web.dto.drone.DroneDto;

@Service
public class DroneService {

		private static final Logger logger = LoggerFactory.getLogger(DroneService.class);
	
	
		@Autowired
		DroneDao dronedao;	//주입
		
		public List<DroneDto> getDroneList(int drone_startRowNo, int drone_endRowNo){
			List<DroneDto> droneList = dronedao.selectList(drone_startRowNo, drone_endRowNo);
			logger.info("getDroneList 실행");
			return droneList;
			
		}
		
		public int getDroneTotalRowNo() {
			int totalRowNum = dronedao.selectTotalRowNo();
			return totalRowNum;
		}

		public DroneDto getDrone(int drone_no) {
			DroneDto dronedto = dronedao.selectdrone(drone_no);
			return dronedto;
		}

		public void join(DroneDto dronedto) {
			dronedao.insert(dronedto);
		}

		public void delete(int d_number) {
			dronedao.delete(d_number);
		}

		public void update(DroneDto dronedto) {
			dronedao.update(dronedto);
		}

		public List<DroneDto> getDroneSearch(int drone_value,int drone_startRowNo, int drone_endRowNo){
			List<DroneDto> droneList = dronedao.selectSearch(drone_startRowNo, drone_endRowNo);
			logger.info("getDroneList 실행");
			return droneList;	// 수정중
			
		}
		
		public List<DroneDto> getDroneSearch(String drone_value,int drone_startRowNo, int drone_endRowNo){
			List<DroneDto> droneList = dronedao.selectSearch(drone_startRowNo, drone_endRowNo);
			logger.info("getDroneList 실행");
			return droneList;
			
		}
		
		public List<DroneDto> getDroneSearch(int type, int drone_value,int drone_startRowNo, int drone_endRowNo){
			List<DroneDto> droneList = dronedao.selectSearch(drone_startRowNo, drone_endRowNo);
			logger.info("getDroneList 실행");
			return droneList;
			
		}
		
		/* ****************** 드론 운행가능 리스트 ****************** */
		public List<DroneDto> getDroneStateList(int drone_startRowNo, int drone_endRowNo, String totalWeight){
			System.out.println("aaaa1"+drone_startRowNo);
			System.out.println("aaaa2"+drone_endRowNo);
			List<DroneDto> droneList = dronedao.selectStateList(drone_startRowNo, drone_endRowNo, totalWeight);
			return droneList;
		}
		
		public int getDroneStateTotalRowNo(String totalWeight) {
			int totalRowNum = dronedao.selectStateTotalRowNo(totalWeight);
			return totalRowNum;
		}
		
		
}

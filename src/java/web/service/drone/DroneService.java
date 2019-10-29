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

		public void search(DroneDto dronedto) {
			dronedao.search(dronedto);
		}
		
}

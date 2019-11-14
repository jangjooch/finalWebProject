package web.service.drone;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.drone.DroneMissionDao;
import web.dao.log.LogDao;
import web.dto.drone.DroneMissionDto;

@Service
public class DroneMissionService {
	
	@Autowired
	private DroneMissionDao droneMissionDao;
	@Autowired
	private LogDao logDao;
	
	public List<DroneMissionDto> droneMissionList(int startRowNo, int endRowNo){
		List<DroneMissionDto> droneMissionDtoList =
				droneMissionDao.droneMissionList(startRowNo, endRowNo);
		return droneMissionDtoList;
	}

	public int getTotalRowNo() {
			int rows = droneMissionDao.droneMissionCountRows();
		return rows;
	}

	public DroneMissionDto droneMissionDtoSelectOne(int d_m_number) {
		DroneMissionDto droneMissionDto = droneMissionDao.droneMissionDtoSelectOne(d_m_number);
		logDao.getSelectLog(d_m_number);
		return droneMissionDto;
	}
	
	// 요청이 거절 된 로그 
	public void requestRejection(int re_num) {
		int rows = droneMissionDao.requestRejection(re_num);		
	}
	
	
}

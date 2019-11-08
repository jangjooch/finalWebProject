package web.service.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.log.LogDao;
import web.dto.drone.DroneMissionDto;
import web.dto.log.LogDto;
import web.dto.mission.MissionDto;
import web.dto.request.RequestDto;

@Service
public class LogService {
	@Autowired
	private LogDao logDao;
	
	public LogDto getSelectLog(int d_m_number) {
		LogDto logDto = logDao.getSelectLog(d_m_number);
		return logDto;
	}
	
	public List<DroneMissionDto> getSelectLogList(int startRowNo, int endRowNo){
		List<DroneMissionDto> droneMissionList = logDao.getSelectLogList(startRowNo, endRowNo);
		return droneMissionList;
	}
	
	public List<RequestDto> getRequestList(){
		List<RequestDto> missionList = logDao.getRequestList();
		return missionList;
	}
	
	
}

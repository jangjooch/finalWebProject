package web.service.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.log.LogDao;
import web.dto.drone.DroneMissionDto;
import web.dto.log.LogDto;
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

	public int getSearchTotalRowNo(String choose_get, String searchThing_get) {
		// 여기까지 잘 들어옴
		System.out.println("choose_get : "+choose_get);
		System.out.println("searchThing_get : "+searchThing_get);
		int totalRowNum = logDao.selectSearchTotalRowNo(choose_get, searchThing_get);
		return totalRowNum;
	}

	public List<RequestDto> getSearchList(String choose, String searchThing, int startRowNo, int endRowNo) {
		List<RequestDto> searchList = logDao.selectSearchMember(choose,searchThing,startRowNo, endRowNo);
		return searchList;
	}
	
	
}

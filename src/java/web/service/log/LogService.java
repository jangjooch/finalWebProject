package web.service.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.log.LogDao;
import web.dto.log.LogDto;

@Service
public class LogService {
	@Autowired
	private LogDao logDao;
	
	public LogDto getSelectLog(int d_m_number) {
		LogDto logDto = logDao.getSelectLog(d_m_number);
		return logDto;
	}
	
	public List<LogDto> getSelectLogList(int startRowNo, int endRowNo){
		List<LogDto> logDtoList = logDao.getSelectLogList(startRowNo, endRowNo);
		return logDtoList;
	}
}

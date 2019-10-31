package web.service.log;

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
}

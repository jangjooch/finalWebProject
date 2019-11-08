package web.service.notice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.notice.NoticeDao;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDao noticeDao;

	private static final Logger logger = LoggerFactory.getLogger(NoticeService.class);
}

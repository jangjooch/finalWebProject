package web.controller.notice;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.controller.HomeController;
import web.service.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Resource(name="dataSource")
	private DataSource dataSource;
	
	@Autowired
	private  NoticeService service;
	
	
	// 리스트
	@RequestMapping("noticeList")
	public String noticeList() {
		
		return null;
	}
	
	
	// 수정
	@RequestMapping("noticeUpdate")
	public String noticeUpdate() {
		
		return null;
	}	
	
	// 삭제
	@RequestMapping("noticeDelete")
	public String noticeDelete() {
		
		return null;
	}	
	
	
	// 등록
	@RequestMapping("noticeInsert")
	public String noticeInsert() {
		
		return null;
	}	
	
	
	// 댓글 등록
	@RequestMapping("noticeComment")
	public String noticeComment() {
		
		return null;
	}	
	
	
	
	
	
	
	
	
	
}

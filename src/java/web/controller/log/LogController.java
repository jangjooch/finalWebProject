package web.controller.log;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dao.log.LogDao;
import web.dto.drone.DroneMissionDto;
import web.dto.log.LogDto;
import web.dto.mission.MissionDto;
import web.service.drone.DroneMissionService;
import web.service.log.LogService;

@Controller
@RequestMapping("/log")
public class LogController {
	
	private static final Logger logger = LoggerFactory.getLogger(LogController.class);
	
	@Autowired 
	private DroneMissionService droneMissionService;
	@Autowired
	private LogService logService;
	@Autowired
	private LogDao logDao;
	
	// 페이징
	@RequestMapping("/log_list")
	public String log_list(Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);
		
		int rowsPerPage = 10;		 								// 페이지 당 게시글 개수
		int pagesPerGroup = 5;										// 페이지 당 그룹 수
		int totalRowNum = droneMissionService.getTotalRowNo();		// 전체 게시글 수
		int totalPageNum = totalRowNum / rowsPerPage;				// 전체 페이지 수
		if(totalRowNum % rowsPerPage !=0) totalPageNum++;			 
		
		int totalGroupNum = totalPageNum / pagesPerGroup;			// 전 체 그룹 수
		if(totalPageNum % pagesPerGroup !=0) totalGroupNum++;		//
		
		int groupNo = (pageNo-1)/pagesPerGroup + 1;					// 현재 페이지 그룹 번호
		int startPageNo = (groupNo-1) * pagesPerGroup + 1;			// 현재 그룹의 시작 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup -1;				// 현재 그룹의 마지막 페이지 번호
		if(groupNo == totalGroupNum) endPageNo = totalPageNum;		//
		
		int startRowNo = (pageNo-1) * rowsPerPage + 1;				// 현재 페이지의 시작 행 번호
		int endRowNo = pageNo * rowsPerPage;						// 현재 페이지의 끝 행 번호
		if(pageNo == totalPageNum) endRowNo = totalRowNum;			//
		
		List<DroneMissionDto> droneMissionList = logService.getSelectLogList(startRowNo, endRowNo);
		List<MissionDto> missionList = logService.getRequestList();
				
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("droneMissionList", droneMissionList); // 현재 페이지
		model.addAttribute("missionList", missionList); // 현재 페이지
		
		return "log/log_list";
	}
	
	// 상세페이지
	@RequestMapping("/log_detail")
	public String log_detail(int d_m_number, Model model) {
		LogDto logDto = logService.getSelectLog(d_m_number);
		model.addAttribute("logDto", logDto);
		
		return "log/log_detail";
	}
	
	// 검색한 리스트만 가져오기
	
}
package web.controller.log;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.drone.DroneMissionDto;
import web.dto.log.LogDto;
import web.dto.request.RequestDto;
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
//		List<RequestDto> missionList = logService.getRequestList();
				
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("droneMissionList", droneMissionList); // 현재 페이지
//		model.addAttribute("missionList", missionList); // 현재 페이지
		
		// 검색리스트 jsp에서 구별하기 위한 코드
		int whereFrom = 1;
		model.addAttribute("whereFrom", whereFrom);
		
		
		return "log/log_list";
	}
	
	// 상세페이지
	@RequestMapping("/log_detail")
	public String log_detail(String d_m_number, String re_num, Model model) {
		if (d_m_number != null) {
			System.out.println("빠밤1");
			int dm_number = Integer.parseInt(d_m_number);
			LogDto logDto = logService.getSelectLog(dm_number);
			model.addAttribute("logDto", logDto);
		}
		if (re_num != null) {
			System.out.println("뿌붐1");
			int reNum = Integer.parseInt(re_num);
			int dm_number = logService.getDMNumber(reNum); // d_m_number를 구해와라
			LogDto logDto = logService.getSelectLog(dm_number);
			model.addAttribute("logDto", logDto);
		}
		/*
		 * re_num으로 d_m_number 번호를 구해와서 돌리기
		 */
		return "log/log_detail";
	}
	
	
	// 마이페이지에서 내 사건번호를 가지고와서 뿌려주는 서블릿
	@RequestMapping("/getDMNum")
	public String getDMNum(int re_num, Model model) {
		System.out.println(" 진입! re_num: " + re_num);
		int d_m_number = logService.getDMNum(re_num);
		LogDto logDto2 = logService.getSelectLog(d_m_number);
		model.addAttribute("logDto", logDto2);
		
		return "log/log_detail";
	}
	
	
	
	
	
	
	
	
	
	
	
	// -------------- 검색
	@RequestMapping("logSearchedList")
	public String logSearchedList(String choose, String searchThing,Model model, @RequestParam(defaultValue="1") int searchPageNo, HttpSession session) {
		session.setAttribute("searchPageNo", searchPageNo);
		String choose_get = null;
		if(choose == null) {  // 처음검색이 아닌경우
			choose_get = (String)session.getAttribute("logChoose");
		}
		else {		//  새로운 검색인 경우
			session.setAttribute("logChoose", choose);
		}
		
		String SearchThing_get = null;
		if(searchThing == null) { // 처음 검색이 아닌경우
			SearchThing_get = (String)session.getAttribute("logSearchThing");
		}
		else {//  새로운 검색인 경우
			session.setAttribute("logSearchThing", searchThing);
		}
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
		int totalRowNum = 0;
		if(SearchThing_get != null) { // 처음 검색이 아닌경우
			totalRowNum = logService.getSearchTotalRowNo(choose_get ,SearchThing_get);
		}
		else {
			totalRowNum = logService.getSearchTotalRowNo(choose ,searchThing);
		}
		int totalPageNum = totalRowNum / rowsPerPage;
		if(totalRowNum % rowsPerPage != 0) totalPageNum++;
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if(totalPageNum % pagesPerGroup != 0) totalGroupNum++;
		int groupNo = (searchPageNo-1)/pagesPerGroup + 1;
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNum) endPageNo = totalPageNum;
		int startRowNo = (searchPageNo-1)*rowsPerPage + 1;
		int endRowNo = searchPageNo*rowsPerPage;
		if(searchPageNo == totalPageNum) endRowNo = totalRowNum;
		
		//현재 페이지의 게시물 가져오기
		List<RequestDto> searchList = null;
		
		if (choose !=null && searchThing != null) { // 처음 검색한 경우
			searchList = logService.getSearchList(choose, searchThing, startRowNo, endRowNo);
		}
		else {	// 검색중인 경우
			searchList = logService.getSearchList(choose_get, SearchThing_get, startRowNo, endRowNo);
		}
		
		
		//JSP로 페이지 정보 넘기기
		model.addAttribute("searchpagesPerGroup", pagesPerGroup);
		model.addAttribute("searchtotalPageNum", totalPageNum);
		model.addAttribute("searchtotalGroupNum", totalGroupNum);
		model.addAttribute("searchgroupNo", groupNo);
		model.addAttribute("searchstartPageNo", startPageNo);
		model.addAttribute("searchendPageNo", endPageNo);
		model.addAttribute("searchPageNo", searchPageNo);
		model.addAttribute("searchList", searchList);
		
		// 검색리스트 jsp에서 구별하기 위한 코드
		int whereFrom = 2;
		model.addAttribute("whereFrom", whereFrom);
		
		return "log/log_searched";
	}
	
	
	
	
	
	
	// 파일 업로드창 띄우기
	@RequestMapping("logFileUpload")
	public String logFileUpload(int d_m_number, Model model) {
		System.out.println("창 띄우기!"+d_m_number);
		model.addAttribute("d_m_number",d_m_number);
		return "log/log_fileUpload";
	}
	
	
	
	
	// 파일 업로드하기
	@PostMapping("/fileUpLoad")
	public void fileUpload(int d_m_number,MultipartFile attach1, MultipartFile attach2, MultipartFile attach3, MultipartFile attach4,
			HttpServletRequest request, Model model) throws Exception {
		System.out.println("!!!!!!!!!!!!!!!!!!!!");
		System.out.println("d_m_number: " + d_m_number);
		ServletContext application = request.getServletContext();
		String savePath = application.getRealPath("/resources/upload/");
		System.out.println("저장위치: " + savePath);
		if(!attach1.isEmpty()) {
			logger.info("-------------");
			logger.info("attach1: " + attach1.getOriginalFilename());
			String saveFileName = new Date().getTime() + "-" + d_m_number + "_1" + attach1.getOriginalFilename();
			logger.info("attach1: " + saveFileName);
			model.addAttribute("attach1", saveFileName);
			attach1.transferTo(new File(savePath + saveFileName));
		}
		if(!attach2.isEmpty()) {
			String saveFileName = new Date().getTime() + "-" + d_m_number + "_2"  + attach2.getOriginalFilename();
			model.addAttribute("attach2", saveFileName);
			attach2.transferTo(new File(savePath + saveFileName));
		}
		if(!attach3.isEmpty()) {
			String saveFileName = new Date().getTime() + "-" + d_m_number + "_3"  + attach3.getOriginalFilename();
			model.addAttribute("attach3", saveFileName);
			attach3.transferTo(new File(savePath + saveFileName));
		}
		if(!attach4.isEmpty()) {
			String saveFileName = new Date().getTime() + "-" + d_m_number + "_4"  + attach4.getOriginalFilename();
			model.addAttribute("attach4", saveFileName);
			attach4.transferTo(new File(savePath + saveFileName));
		}

		if (model != null) {
			System.out.println("모델은 null이 아니다!");
		}
		
	}	
}// class
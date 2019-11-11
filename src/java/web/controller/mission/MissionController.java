package web.controller.mission;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.item.ItemDto;
import web.dto.mission.MissionDto;
import web.dto.request.RequestDto;
import web.service.mission.MissionSerivce;

@Controller
@RequestMapping("/mission")
public class MissionController {
	
	private static final Logger logger = LoggerFactory.getLogger(MissionController.class);
	
	@Autowired
	MissionSerivce service;
	
	@Resource(name="dataSource")
	private DataSource datasource;
	
	@RequestMapping("/missionInList")
	public String missionInList(HttpSession session) {		
		
		logger.info("Controller missionInList Activate");
		int success = 0;
		
		List<RequestDto> missionList = service.missionList(session, success); 
		
		return "mission/mission_in_list";
	}
	@RequestMapping("/missionProList")
	public String missionProList(HttpSession session) {		
		
		logger.info("Controller missionProList Activate");
		return "mission/mission_pro_list";
	}
	
	@RequestMapping("/missionAccept")
	public String missionAccept(int re_num) {
		
		logger.info("Controller missionAccept Activate");
		
		service.successChange(re_num);
		
		service.reduceMount(re_num);
		
		return "redirect:/mission/missionInList";
	}
	
	@RequestMapping("missionProcess")
	public String missionProcess(int re_num, Model model) {
		
		return "mission/mission_pro_detail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ---------------------------------
	@RequestMapping("/requestList")
	public String requestList(Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session) {
		logger.info("컨트롤러 진입");
		session.setAttribute("pageNo", pageNo);
		int rowsPerPage = 10	;
		int pagesPerGroup = 5;
		int totalRowNum = service.getTotalRowNo();
		int totalPageNum = totalRowNum / rowsPerPage;
		if(totalRowNum % rowsPerPage != 0) totalPageNum++;
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if(totalPageNum % pagesPerGroup != 0) totalGroupNum++;
		
		int groupNo = (pageNo-1)/pagesPerGroup + 1;
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNum) endPageNo = totalPageNum;
		
		int startRowNo = (pageNo-1)*rowsPerPage + 1;
		int endRowNo = pageNo*rowsPerPage;
		if(pageNo == totalPageNum) endRowNo = totalRowNum;
		logger.info("페이징끝");
		//현재 페이지의 게시물 가져오기
		List<MissionDto> requestList = service.getRequestList(startRowNo, endRowNo);
		//아이템 리스트 가져오기
		List<ItemDto> itemList = service.getItemList();
		
		//JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("requestList", requestList);
		model.addAttribute("itemList", itemList);
		
		logger.info("컨트롤러 끝");
		return "mission/mission_in_list2";
	}
	
	
	@RequestMapping("missionDetail")
	public String missionDetail(int re_num, Model model) {
		MissionDto mission = service.getMission(re_num);
		
		model.addAttribute("mission", mission);
		return "mission/missionDetail2";
	}
	
	
	
	
	
}

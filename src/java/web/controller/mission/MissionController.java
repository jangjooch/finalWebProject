package web.controller.mission;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.item.ItemDto;
import web.dto.item.MissionItemsDto;
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
	
	// 요청 리스트
	@RequestMapping("/requestList")
	public String requestList(Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);
		int rowsPerPage = 10;
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
		
		return "mission/mission_in_list";
	}
	
	
	@RequestMapping("/missionDetail")
	public String missionDetail(int re_num, Model model) {
		MissionDto mission = service.getMission(re_num);
		
		model.addAttribute("mission", mission);
		return "mission/missionDetail";
	}
	
	// 지도 api
	@RequestMapping("/missionProcess")
	public String missionProcess() {
		
		return "mission/mission_pro_detail";
	}
	
	// 미션 수락하기
	@RequestMapping("/missionAcceptList")
	public String missionItemCheck(int re_num) {
		System.out.println("진입!");
		int check = service.missionCheck(re_num);
		
		if(check == 1) {
			//요청 거절 re_success = 3;
			int fail = service.updateRequestSuccessChangeRefusal(re_num);
		}else{
			//요청 수락 re_success = 1;
			int success = service.requestSuccessChange(re_num);
		}
		
		return "redirect:/mission/requestList"; 
	}
	
	/* ********************* 요청 수락 완료 상태-드론 출발 대기상태 ********************* */
	@RequestMapping("/missionProList")
	public String missionProList(Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session) {
		
		session.setAttribute("pageNo", pageNo);
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
		int totalRowNum = service.selectSuccess1ListCount();
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
		//현재 페이지의 게시물 가져오기
		List<RequestDto> requestList = service.selectSuccess1List(startRowNo, endRowNo);
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
		
		return "mission/mission_pro_list";
	}
	
	/* ********************* 드론 출발 후 실행 중 ********************* */
	@RequestMapping("/missionStart")
	public String missionStart(Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session) {
		
		session.setAttribute("pageNo", pageNo);
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
		int totalRowNum = service.selectSuccess2ListCount();
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
		//현재 페이지의 게시물 가져오기
		List<RequestDto> requestList = service.selectSuccess2List(startRowNo, endRowNo);
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
		
		return "mission/mission_start_list";
	}
	
	//드론 상태가 출발 가능일 경우 가져오기
	public String droneStateList() {
		return "";
	}
	
	//드론 상태 업데이트
	public String droneStateUpdate() {
	
		return "";
	}
	
	@RequestMapping("/api")
	public String MissionApi() {
				
		return"mission/mission_pro_detail";
	}
}

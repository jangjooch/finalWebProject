package web.controller.drone;

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

import web.controller.log.LogController;
import web.dto.drone.DroneDto;
import web.service.drone.DroneService;


@Controller
@RequestMapping("/drone")
public class DroneController {
	
	private static final Logger logger = LoggerFactory.getLogger(LogController.class);
	
	@Resource(name="dataSource")
	private DataSource dataSource;
	
	@Autowired
	private DroneService service;
	
	@RequestMapping("/drone_list")
	public String droneList(String drone_value, String drone_type, Model model, @RequestParam(defaultValue ="1") int drone_pageNo, HttpSession session) {
		logger.info("droneList() Activate");
		
		session.setAttribute("drone_pageNo", drone_pageNo);
		
		//페이지당 행수
		int drone_rowsPerPage = 10;
		//이전, 다음을 클릭했을 때 나오는 페이지 수
		int drone_pagesPerGroup = 5;
		// 전체 게시물 수
		int drone_totalRowNum = service.getDroneTotalRowNo();
		//전체 페이지 수
		int drone_totalPageNum = drone_totalRowNum / drone_rowsPerPage;
		if(drone_totalRowNum %drone_rowsPerPage != 0 ) drone_totalPageNum++;
		//전체 그룹 수
		int drone_totalGroupNum = drone_totalPageNum/drone_pagesPerGroup;
		if(drone_totalPageNum%drone_pagesPerGroup !=0) drone_totalGroupNum++;
		
		//현재 페이지의 그룹번호
		int drone_groupNo = (drone_pageNo-1)/drone_pagesPerGroup + 1;
		
		//현재 그룹의 시작 페이지 번호
		int drone_startPageNo = (drone_groupNo-1)*drone_pagesPerGroup + 1;
		//현재 그룹의 마지막 페이지 번호
		int drone_endPageNo = drone_startPageNo + drone_pagesPerGroup - 1;
		if(drone_groupNo == drone_totalGroupNum) drone_endPageNo = drone_totalPageNum;
		//if(drone_pageNo == drone_totalPageNum) drone_endPageNo = drone_totalPageNum;
		//if(drone_groupNo == drone_totalGroupNum)drone_endPageNo = drone_totalPageNum;	
		
		//현재 페이지의 시작 행 번호
		int drone_startRowNo = (drone_pageNo-1)*drone_rowsPerPage+1;
		//현재 페이지의 끝 행 번호
		int drone_endRowNo = drone_pageNo * drone_rowsPerPage;
		if(drone_pageNo == drone_totalPageNum) drone_endRowNo = drone_totalRowNum;
		
		//if(drone_groupNo == drone_totalGroupNum) drone_endRowNo = drone_totalRowNum;
				
		
		if(drone_value!=null)
		{
			if(drone_type.equals("drone_number")){	// 수정중
				List<DroneDto> drone_list = service.getDroneSearch(Integer.parseInt(drone_value), drone_startRowNo, drone_endRowNo);
				model.addAttribute("drone_list", drone_list);				
			}else if(drone_type.equals("drone_model")) {
				List<DroneDto> drone_list = service.getDroneSearch(drone_value, drone_startRowNo, drone_endRowNo);
				model.addAttribute("drone_list", drone_list);
			}else if(drone_type.equals("drone_status")) {
				List<DroneDto> drone_list = service.getDroneSearch(1, Integer.parseInt(drone_value), drone_startRowNo, drone_endRowNo);
				model.addAttribute("drone_list", drone_list);
			}
			
			//Jsp로 페이지 정보 넘기기
			model.addAttribute("drone_pagesPerGroup", drone_pagesPerGroup);
			model.addAttribute("drone_totalPageNum", drone_totalPageNum);
			model.addAttribute("drone_totalGroupNum", drone_totalGroupNum);
			model.addAttribute("drone_groupNo", drone_groupNo);
			model.addAttribute("drone_startPageNo", drone_startPageNo);
			model.addAttribute("drone_endPageNo", drone_endPageNo);
			model.addAttribute("drone_pageNo", drone_pageNo);
			
			
			return "drone/drone_list";
		}
		
		//현재 페이지의 게시물 가져오기
		List<DroneDto> drone_list = service.getDroneList(drone_startRowNo, drone_endRowNo);
		logger.info(""+drone_list.size());
		
		
		
		//Jsp로 페이지 정보 넘기기
		model.addAttribute("drone_pagesPerGroup", drone_pagesPerGroup);
		model.addAttribute("drone_totalPageNum", drone_totalPageNum);
		model.addAttribute("drone_totalGroupNum", drone_totalGroupNum);
		model.addAttribute("drone_groupNo", drone_groupNo);
		model.addAttribute("drone_startPageNo", drone_startPageNo);
		model.addAttribute("drone_endPageNo", drone_endPageNo);
		model.addAttribute("drone_pageNo", drone_pageNo);
		model.addAttribute("drone_list", drone_list);
		
		return "drone/drone_list";
	}
	
	@RequestMapping("/drone_joinForm")
	public String drone_joinForm() {
		return "drone/drone_join";
	}
	
	@RequestMapping("/drone_join")
	public String drone_join(DroneDto dronedto) {
		logger.info("drone join run...");
		service.join(dronedto);
		return "redirect:/drone/drone_list";
	}
	
	@RequestMapping("/drone_delete")
	public String drone_delete(int d_number, HttpSession session) {
		logger.info("deleteController run");
		
		service.delete(d_number);
		int pageNo = (Integer)session.getAttribute("drone_pageNo");
		return "redirect:/drone/drone_list?pageNo=" + pageNo;
	}
	
	@RequestMapping("/drone_detail")
	public String drone_detail(int d_number, Model model, HttpSession session) {
		logger.info("detail 실행");
		DroneDto dronedto = service.getDrone(d_number);
		session.setAttribute("dronedto", dronedto);
		model.addAttribute("d_number", d_number);
		
		return "drone/drone_detail";
	}
	
	
	@RequestMapping("/drone_updateForm")
	public String drone_updateForm() {
		
		return "drone/drone_update";
	}
	
	@RequestMapping("/drone_update")
	public String drone_update(DroneDto dronedto) {
		service.update(dronedto);

		return "redirect:/drone/drone_list";
	}
	
	/* *********************** 드론 상태 리스트 *********************** */
	@RequestMapping("/droneState_List")
	public String droneStateList(String totalWeight, Model model, @RequestParam(defaultValue ="1") int pageNo, HttpSession session) {
		System.out.println("드론상태리스트 컨트롤러 진입");
		System.out.println("totalWeight가 파라이터로 왔니? : " + totalWeight);
		
//		session.setAttribute("totalWeight", totalWeight);
		session.setAttribute("pageNo", pageNo);
		
		System.out.println("세션있니?" + session.getAttribute("totalWeight"));
		
		String totalWeight_get = null;
		
		if (totalWeight == null) {
			totalWeight_get = (String) session.getAttribute("totalWeight");
		} else {
			session.setAttribute("totalWeight", totalWeight);
		}
		
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
		int totalRowNum = 0;
		if (totalWeight_get != null) {
			totalRowNum = service.getDroneStateTotalRowNo(totalWeight_get);
		} else {
			totalRowNum = service.getDroneStateTotalRowNo(totalWeight);
		}
		
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
		
		
		List<DroneDto> drone_list = null;

		if (totalWeight != null) {
			drone_list = service.getDroneStateList(startRowNo, endRowNo, totalWeight);
		} else {
			drone_list = service.getDroneStateList(startRowNo, endRowNo, totalWeight_get);
		}
		
		
		
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("drone_list", drone_list);
			
		return "drone/droneStateList";
	}
}

package web.controller.member;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.controller.HomeController;
import web.dto.member.MemberDto;
import web.dto.mission.MissionDto;
import web.service.member.MemberSerivce;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Resource(name="dataSource")
	private DataSource dataSource;
	
	@Autowired
	private  MemberSerivce service;
	
	
	// 멤버 목록
	@RequestMapping("/memberList")
	public String memberList(Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);
		//페이지당 행수
		int rowsPerPage = 10;
		//이전, 다음을 클릭했을 때 나오는 페이지 수
		int pagesPerGroup = 5;
		//전체 게시물 수
		int totalRowNum = service.getTotalRowNo();
		//전체 페이지 수
		int totalPageNum = totalRowNum / rowsPerPage;
		if(totalRowNum % rowsPerPage != 0) totalPageNum++;
		//전체 그룹 수
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if(totalPageNum % pagesPerGroup != 0) totalGroupNum++;
		
		//현재 페이지의 그룹번호
		int groupNo = (pageNo-1)/pagesPerGroup + 1;
		//현재 그룹의 시작 페이지 번호
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		//현재 그룹의 마지막 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNum) endPageNo = totalPageNum;
		
		//현재 페이지의 시작 행번호
		int startRowNo = (pageNo-1)*rowsPerPage + 1;
		//현재 페이지의 끝 행번호
		int endRowNo = pageNo*rowsPerPage;
		if(pageNo == totalPageNum) endRowNo = totalRowNum;
		
		//현재 페이지의 게시물 가져오기
		List<MemberDto> memberList = service.getMemberList(startRowNo, endRowNo);
		
		//JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("memberList", memberList);
		logger.info("컨트롤러 끝");
		return "member/member_list";
	}
	
	// 멤버 등록폼
	@RequestMapping("/memberInsertForm")
	public String memberInsertForm(HttpSession session) {
		
		return "member/member_insertForm";
	}
	
	// 멤버 등록
	@RequestMapping("/insertMember")
	public String insertMember(MemberDto member , HttpSession session) {
		service.insertMember(member);
		return "redirect:/member/memberList";
	}
	
	// 멤버 삭제
	@RequestMapping("/memberDelete")
	public String deleteBoard(int m_num, HttpSession session) {
		System.out.println("컨트롤러 주입"+m_num);
		service.deleteMember(m_num);
		int pageNo = (Integer)session.getAttribute("pageNo");
		System.out.println("컨트롤러 응답 페이지 번호" + pageNo);
		return "redirect:/member/memberList?pageNo=" + pageNo;
	}
	
	// 멤버 수정으로 이동
	@RequestMapping("updateMemberForm")
	public String updateMemberForm(int m_num, Model model) {
		MemberDto member = service.getMember(m_num);
		model.addAttribute("member",member);
		return "member/member_update";
	}
	
	
	// 멤버 수정하기
	@RequestMapping("updateMember")
	public String updateMember(MemberDto member , HttpSession session) {
		System.out.println("컨트롤러");
		service.updateMember(member);
		int pageNo = (Integer)session.getAttribute("pageNo");
		return "redirect:/member/memberList?pageNo=" + pageNo;
	}
	
	
	
	
	
	// 멤버 디테일
	@RequestMapping("memberDetail")
	public String memberDetail(int m_num , Model model) {
		MemberDto member = service.getMember(m_num);
		List<MissionDto> report = service.getReport(m_num);
		model.addAttribute("member",member);
		model.addAttribute("report",report);
		return "member/member_detail";
	}
	
	// 아이디 체크
	@RequestMapping("/checkMid")
	public void checkMid(String m_id, HttpServletResponse response) throws Exception {
		boolean result = service.checkMid(m_id);
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		pw.print(jsonObject.toString());
		pw.flush();
		pw.close();
	}
	
	
	// 검색 리스트
	@RequestMapping("/memberSearch")
	public String memberSearch(String searchThing, String things,Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);
		String searching_get = null;
		if(searchThing == null) {
			searching_get = (String)session.getAttribute("memberSearchThing");
		}
		else {
			session.setAttribute("memberSearchThing", searchThing);
		}
		String thing_get = null;
		if(things == null) {
			thing_get = (String)session.getAttribute("memberThings");
		}
		else {
			session.setAttribute("memberThings", things);
		}
		
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
		int totalRowNum = 0;
		if(thing_get != null) {
			totalRowNum = service.getSearchTotalRowNo(searching_get ,thing_get);
		}
		else {
			totalRowNum = service.getSearchTotalRowNo(searchThing ,things);
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
		
		//현재 페이지의 게시물 가져오기
		List<MemberDto> searchList = null;
		
		if (searchThing !=null && things != null) {
			searchList = service.getSearchList(searchThing, things, startRowNo, endRowNo);
		}
		else {
			searchList = service.getSearchList(searching_get, thing_get, startRowNo, endRowNo);
		}
		
		
		//JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("searchList", searchList);
		
		logger.info("써치 컨트롤러 끝");
		return "member/member_searched";
	}
	
	
	
}

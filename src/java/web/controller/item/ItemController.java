package web.controller.item;

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

import web.dto.item.ItemDto;
import web.service.item.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
//edit
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Resource(name="dataSource")
	private DataSource datasource;
	
	@Autowired
	ItemService itemservice;
	
	@RequestMapping("/item_list")
	public String itemList(Model model, @RequestParam(defaultValue = "1")int ipageNumber, HttpSession session) {
		
		logger.info("To item_list");
		
		int rowsPerPage = 5;
		
		int pagesPerGroup = 5;
		
		int totalRowNum = itemservice.getTotalRowNum();
		
		int totalPageNum = totalRowNum / rowsPerPage;
		if(totalRowNum % rowsPerPage != 0) totalPageNum ++;
		
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if(totalPageNum % pagesPerGroup != 0) totalGroupNum ++;
		
		int groupNo = (ipageNumber - 1) / pagesPerGroup + 1;
		
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNum) endPageNo = totalPageNum;
		
		int startRowNo = (ipageNumber - 1) * rowsPerPage + 1;
		
		int endRowNo = ipageNumber * rowsPerPage;
		if(ipageNumber == totalPageNum) endRowNo = totalRowNum;
		
		List<ItemDto> item_list = itemservice.getItemList(startRowNo, endRowNo); 
		
		model.addAttribute("ipagesPerGroup", pagesPerGroup);
		model.addAttribute("itotalPageNum", totalPageNum);
		model.addAttribute("itotalGroupNum", totalGroupNum);
		model.addAttribute("igroupNo", groupNo);
		model.addAttribute("istartPageNo", startPageNo);
		model.addAttribute("iendPageNo", endPageNo);
		model.addAttribute("ipageNumber", ipageNumber);
		
		session.setAttribute("ipageNumber", ipageNumber);
		
		model.addAttribute("itemList", item_list);
		
		return "item/item_list";
	}
	
	@RequestMapping("item_detail")
	public String item_detail(int i_code, HttpSession session) {
		
		ItemDto itemdto = itemservice.getItem(i_code);
		session.setAttribute("item_selected", itemdto);
		
		return "item/item_detail";
	}
	
	@RequestMapping("item_remove")
	public String item_remove(HttpSession session) {
		
		logger.info("Controller item_remove activate");
		
		ItemDto itemdto = (ItemDto)session.getAttribute("item_selected");
		
		int target_code = itemdto.getI_code();
		
		itemservice.removeItem(target_code);
		
		int pageNum = (Integer)session.getAttribute("ipageNumber");
		
		return "redirect:/item/item_list?ipageNumber=" + pageNum;
	}
	
	
	
	@RequestMapping("item_add")
	public String item_add() {
		return "item/item_join";
	}
	
	@RequestMapping("item_join")
	public String item_join(ItemDto item) {
		
		logger.info("ItemController item_join() activate");
		
		itemservice.join(item);
		
		return "redirect:/item/item_list";
	}
	
	@RequestMapping("item_update")
	public String item_update() {
		return "item/item_update";
	}
	
	@RequestMapping("item_edit")
	public String item_edit(ItemDto item, HttpSession session) {
		
		ItemDto itemget = (ItemDto)session.getAttribute("item_selected");
		
		int code_stack = itemget.getI_code();
		item.setI_code(code_stack);
		logger.info("ItemController item_edit() activate");
		
		int pageNumer = (Integer)session.getAttribute("ipageNumber");
		
		itemservice.edit(item);
		
		return "redirect:/item/item_list?ipageNumber=" + pageNumer;		
	}
	
	@RequestMapping("checkIname")
	public void checkIname(String i_name, HttpServletResponse response)throws Exception {
		
		boolean result = itemservice.exist(i_name);
		response.setContentType("application/json;charset=UTF-8");
		// json을 보내기 위한 pw생성
		PrintWriter pw = response.getWriter();

		// json생성 및 초기화
		JSONObject jsonobject = new JSONObject();
		jsonobject.put("result", result);
		
		// json 보내기
		pw.print(jsonobject.toString());
		
		pw.flush();
		pw.close();	
		
	}
	
	@RequestMapping("item_list_search")
	public String item_search(String findding, String selectGroup, Model model, @RequestParam(defaultValue = "1")int searchedipageNumber, HttpSession session) {
		
		// 조건에 맞는 i_code만 뽑아냄.
		List<Integer> searched_iCode = itemservice.search_iCode(findding, selectGroup);
		int searched_size = searched_iCode.size();
		int rowsPerPage = 5;
		int pagesPerGroup = 5;
		int totalRowNum = searched_size;
		int totalPageNum = totalRowNum / rowsPerPage;
		if(totalRowNum % rowsPerPage != 0) totalPageNum ++;
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if(totalPageNum % pagesPerGroup != 0) totalGroupNum ++;
		int groupNo = (searchedipageNumber - 1) / pagesPerGroup + 1;
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNum) endPageNo = totalPageNum;
		int startRowNo = (searchedipageNumber - 1) * rowsPerPage + 1;
		int endRowNo = searchedipageNumber * rowsPerPage;
		if(searchedipageNumber == totalPageNum) endRowNo = totalRowNum;
		
		int size = 5;
		List<ItemDto> item_list_searched;
		for(int n : searched_iCode) {
			logger.info("idxs of searched + " + n);
		}
		logger.info("searched_size : " + String.valueOf(searched_size));
		if(rowsPerPage>searched_size) {
			size = searched_size;
			logger.info("size : " + String.valueOf(size) + " less happened");
			item_list_searched = itemservice.getItemList_Searched(searched_iCode, size);
		}
		else {
			logger.info("size : " + String.valueOf(size) + " over happened");
			item_list_searched = itemservice.getItemList_Searched(searched_iCode.subList(startRowNo-1, endRowNo), size);
		}
		
		model.addAttribute("ipagesPerGroup", pagesPerGroup);
		model.addAttribute("itotalPageNum", totalPageNum);
		model.addAttribute("itotalGroupNum", totalGroupNum);
		model.addAttribute("igroupNo", groupNo);
		model.addAttribute("istartPageNo", startPageNo);
		model.addAttribute("iendPageNo", endPageNo);
		model.addAttribute("ipageNumber_s", searchedipageNumber);
		
		session.setAttribute("ipageNumber_s", searchedipageNumber);
		
		model.addAttribute("itemList_searched", item_list_searched);
		
		
		return "item/item_searched";
	}
	
}


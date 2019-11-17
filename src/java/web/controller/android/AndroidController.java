package web.controller.android;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.controller.log.LogController;
import web.dto.android.ItemDto;
import web.dto.android.RequestDto;
import web.dto.android.RequestItemDto;
import web.service.loginResult;
import web.service.android.AndroidService;

@Controller
@RequestMapping("/android")
public class AndroidController {
	private static final Logger logger = LoggerFactory.getLogger(LogController.class);

	@Resource(name = "dataSource")
	private DataSource dataSource;

	@Autowired
	private AndroidService service;

	@RequestMapping("/getItemList")
	public String getItemList(Model model) {
		List<ItemDto> list = service.getItemList();
		JSONObject mainJson = new JSONObject();
		JSONArray arrJson = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONObject json = new JSONObject();
			json.put("i_code", list.get(i).getI_code());
			json.put("i_name", list.get(i).getI_name());
			arrJson.put(i, json);
		}
		mainJson.put("List", arrJson);
		model.addAttribute("list", mainJson.toString());
		return "android/itemList";
	}

	@RequestMapping("/login")
	public String login(String id, String pw, Model model) throws Exception {
		loginResult loginresult = service.login(id, pw);
		int m_num;
		String result = "";
		if (loginresult == loginResult.Success) {
			result = "success";
			m_num=service.getMid(id,pw);
			if(m_num!=0) model.addAttribute("m_num",m_num);
		}
		if (loginresult == loginResult.FailId) {
			result = "failId";
		}
		if (loginresult == loginResult.FailPw) {
			result = "failPw";
		}
		
		
		model.addAttribute("result", result);
		return "android/loginResult";

	}

	@RequestMapping("getNewRequestNum")
	public String getNewRequestNum(Model model) {
		int result=0;
		result = service.getNewRequestNum();
		model.addAttribute("result", result);
		System.out.println("최신 요청번호");
		return "android/newRequestNumResult";
	}

	@RequestMapping("requestItem")
	public String requestItem(String re_num, String re_location_x, String re_location_y, String m_num,
			String re_itemList, Model model) {
		String result = "fail";
		
		
		// 요청에 대한 데이터 가공
		RequestDto requestDto = new RequestDto();
		requestDto.setRe_num(Integer.parseInt(re_num));
		requestDto.setRe_location_x(re_location_x);
		requestDto.setRe_location_y(re_location_y);
		requestDto.setM_num(Integer.parseInt(m_num));

		//요청 저장
		boolean resultRequest = service.request(requestDto);
		
		JSONObject json = new JSONObject(re_itemList);
		JSONArray jArr = json.getJSONArray("List");
		//요청 아이템 리스트 데이터 파싱
		String[] jsonName = { "i_code", "i_amount" };
		String[][] parseredData = new String[jArr.length()][jsonName.length];
		for (int i = 0; i < jArr.length(); i++) {
			json = jArr.getJSONObject(i);
			if (json != null) {
				for (int j = 0; j < jsonName.length; j++) {
					parseredData[i][j] = json.getString(jsonName[j]);
				}
			}
		}
		List<RequestItemDto> requestItemList=new ArrayList<RequestItemDto>();
		for(int i=0;i<parseredData.length;i++) {
			RequestItemDto requestItemDto= new RequestItemDto();
			requestItemDto.setRe_num(Integer.parseInt(re_num));
			requestItemDto.setI_code(Integer.parseInt(parseredData[i][0]));
			requestItemDto.setI_amount(Integer.parseInt(parseredData[i][1]));
			requestItemList.add(requestItemDto);
		}
		
		//아이템 리스트 저장
		boolean resultList = service.requestItem(requestItemList,re_num);
		
		
		if(resultRequest && resultList) {
			result = "success";
		}
		
		model.addAttribute("result", result);
		return "android/requestItemResult";
	}
	
	
	@RequestMapping("/checkRequestItemList")
	public String checkRequestItemList(String requestNum,Model model) {
		int reqNum=Integer.parseInt(requestNum);
		List<RequestItemDto>list = service.getItemListByRequestNum(reqNum);//리턴값 없음 마이바티스 수정 필요
		JSONObject main=new JSONObject();
		JSONArray jArray=new JSONArray();
		for(RequestItemDto requestItemDto:list) {
			JSONObject json=new JSONObject();
			json.put("i_name", requestItemDto.getItemDto().getI_name());
			json.put("i_amount", requestItemDto.getI_amount());
			jArray.put(json);
		}
		main.put("List",jArray);
		String result=main.toString();
		
		model.addAttribute("list",result);
		return "android/checkRequestItemList";
	}

}

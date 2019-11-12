package web.service.android;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.android.AndroidDao;
import web.dto.android.ItemDto;
import web.dto.android.MemberDto;
import web.dto.android.RequestDto;
import web.dto.android.RequestItemDto;
import web.service.loginResult;
import web.service.drone.DroneService;

@Service
public class AndroidService {

	private static final Logger logger = LoggerFactory.getLogger(DroneService.class);
	
	@Autowired
	AndroidDao androidDao;
	
	public List<ItemDto> getItemList(){
		List<ItemDto> list=androidDao.getItemList();
		return list;
	}

	public loginResult login(String id, String pw) {
		MemberDto member = androidDao.login(id);
		if(member == null) {
			return loginResult.FailId;
		}
		else {
			if(pw.contentEquals(member.getM_pw())) {
				return loginResult.Success;
			}
			else {
				return loginResult.FailPw;
			}
		}
	}

	public int getNewRequestNum() {
		int result= androidDao.getNewRequestNum();
		result++;
		return result;
	}

	public boolean request(RequestDto requestDto) {
		int result=androidDao.addRequest(requestDto);
		return result>0;
	}


	public List<RequestItemDto> requestItem(List<RequestItemDto> requestItemList, String re_num) {
		int result=androidDao.requestItem(requestItemList);
		if(result>0) {
			List<RequestItemDto> list=androidDao.responseItem(Integer.parseInt(re_num));
			return list;
		}else {
			return null;
		}
		
	}

}

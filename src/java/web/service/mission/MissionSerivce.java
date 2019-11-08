package web.service.mission;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.mission.MissionDao;
import web.dto.mission.MissionDto;
import web.dto.request.RequestDto;

@Service
public class MissionSerivce {
	
	@Autowired
	MissionDao missionDao;

	private static final Logger logger = LoggerFactory.getLogger(MissionSerivce.class);
	
	public List<RequestDto> missionList(HttpSession session, int success) {
		// TODO Auto-generated method stub
		logger.info("MissionService missionList Activate");
		List<RequestDto> missionList = missionDao.missionList(session, success);
		return missionList;
	}

	public void successChange(int re_num) {
		// TODO Auto-generated method stub
		logger.info("MissionService successChange activate");
		
		missionDao.successChange(re_num);
		
	}

	public void reduceMount(int re_num) {
		// TODO Auto-generated method stub
		logger.info("MissionService reduceMount Activate");
		missionDao.reduceMount(re_num);
	}

	public List<String> getDestination(int re_num) {
		// TODO Auto-generated method stub
		
		List<String> destination = missionDao.getDestination(re_num);
		
		return destination;
	}
	
	
	
	
	// --------------------------
	// 페이징 로우넘
	public int getTotalRowNo() {
		int totalRowNum = missionDao.selectTotalRowNo();
		return totalRowNum;
	}

	// 페이징 리스트
	public List<MissionDto> getRequestList(int startRowNo, int endRowNo) {
		logger.info("서비스 진입");
		List<MissionDto> requestList = missionDao.requestList(startRowNo,endRowNo);
		return requestList;
	}

	public MissionDto getMission(int re_num) {
		MissionDto mission = missionDao.selectOneMission(re_num);
		return mission;
	}	
	
}

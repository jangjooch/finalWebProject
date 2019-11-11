package web.service.mission;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.mission.MissionDao;
import web.dto.item.ItemDto;
import web.dto.item.MissionItemsDto;
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
	
	// 아이템 리스트
	public List<ItemDto> getItemList(){
		List<ItemDto> list = missionDao.selectItemList();
		return list;
	}

	public int missionCheck(int re_num) {
		List<MissionItemsDto> checkMountList = missionDao.selectItemMount(re_num);    // 요청 물품 
		List<ItemDto> checkAllList = missionDao.selectItemCheckList();                // 관리 물품
		
		for(int i=0; i<checkAllList.size(); i++) {
			for(int j=0; j<checkMountList.size(); j++) {
				if(checkAllList.get(i).getI_mount() < checkMountList.get(j).getI_amount()) {
					return 1;
				}
			}
		}
		
		int rows = 0;
		for(int i=0; i<checkMountList.size(); i++) {
			
			int requestItemCode = checkMountList.get(i).getI_code();     //요청 물품 코드
			int requestItemMount = checkMountList.get(i).getI_amount();  //요청 물품 수량
				
				rows = missionDao.updateRequestItemAmount(requestItemMount, requestItemCode) + rows;
			}
		
		
		System.out.println(rows);
		return 0;
		
	}
}

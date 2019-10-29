package web.dao.mission;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.mission.MissionDto;
import web.dto.mission.MissionItemDto;

@Component
public class MissionDao {

	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	
	public List<MissionDto> misstionList(HttpSession session) {
		// TODO Auto-generated method stub
		
		Map<String, Object> param = new HashMap<String, Object>();
	    
		List<Integer> combineRe_num = sqlsessionTemplate.selectList("mission.mission_re_code");
		param.put("i_codeList", combineRe_num); //map에 list를 넣는다.
		
		
		
		List<MissionItemDto> missionItems = sqlsessionTemplate.selectList("mission.missionItemList",param);
		
		List<MissionDto> missionList = sqlsessionTemplate.selectList("mission.missionList", combineRe_num);
		
		return null;
	}
	
	
	
}

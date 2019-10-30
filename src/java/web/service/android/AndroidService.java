package web.service.android;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.android.AndroidDao;
import web.dto.android.ItemDto;
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
}

package com.p2p.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.p2p.pojo.Indexpic;
import com.p2p.service.back.IndexpicService;
import com.p2p.util.PageInfo;

@Controller
@RequestMapping(value="/back/admin")
public class IndexpicController {
	@Resource(name="indexpicServiceImpl")
	private IndexpicService indexpicService;
	
	@RequestMapping(value="selectIndexpicList")
	@ResponseBody
	public PageInfo  selectIndexpicList(Integer page, Integer rows) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
		PageInfo pageInfo = new PageInfo(page+1,rows);
		//得到总的页数
		Integer count = indexpicService.indexCount();
		Map<String,Object> map = new HashMap<String,Object>();
		pageInfo.setCondition(map);
		indexpicService.selectPage(pageInfo);
		pageInfo.setTotal(count);
		return pageInfo;
	}
	//增加轮播图
	@RequestMapping(value="insertIndexpic")
	@ResponseBody
	public int insertIndexpic(Indexpic indexpic,HttpServletRequest request,MultipartFile file) throws Exception {
		String filepath = UtilController.uploadFrom(request, file);
		indexpic.setIpimage(filepath);
		int count = indexpicService.addModel(indexpic);
		return count;
	}
}

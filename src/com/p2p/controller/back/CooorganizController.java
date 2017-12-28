package com.p2p.controller.back;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.p2p.pojo.Cooorganiz;
import com.p2p.service.back.CooorganizService;
import com.p2p.util.PageInfo;

/**
 * 操作人:李钟辉
 * 操作时间:2017-12-22
 * 合作机构的Controller
 * */
@Controller
@RequestMapping("/back/admin")
public class CooorganizController {
	@Resource(name="cooorganizServiceImpl")
	private CooorganizService cooorganizService;
	
	
	@RequestMapping(value="seleCooorganizlist")
	@ResponseBody
	public PageInfo  selectCooorganizList(Integer page, Integer rows,Cooorganiz cooorganiz) {
		Integer pageSize = 0;
		
		PageInfo pageInfo = new PageInfo(pageSize,rows);
		Map<String,Object> map = new HashMap<String,Object>();
		pageInfo.setCondition(map);
		cooorganizService.selectPage(pageInfo,cooorganiz);
		pageInfo.setTotal(pageInfo.getTotal());
		return pageInfo;
	}
	
	//实现新增
	@RequestMapping(value="insertCooorganiz")
	@ResponseBody
	public int insertCooorganiz(Cooorganiz cooorganiz) {
		int count = cooorganizService.addModel(cooorganiz);
		return count;
	}
	
	//修改角色信息
	@RequestMapping(value = "updateCooorganiz")
	@ResponseBody
	public  int updateCooorganiz(Cooorganiz cooorganiz){  
		int count = cooorganizService.update(cooorganiz);
		return count;
	}
	
	//删除
	@RequestMapping(value ="deleteCooorganiz")
	@ResponseBody
	public  int delCooorganiz(String ids){ 
		int count = 0;
		String[] idStr = ids.split(",");
		for (int i = 0; i < idStr.length;i++) {
			String coid = (String) idStr[i];
			Cooorganiz cooorganiz = new Cooorganiz();
			cooorganiz.setCoid(Integer.valueOf(coid));
			count =cooorganizService.delete(cooorganiz);
		}
		return count;
	}
	
}
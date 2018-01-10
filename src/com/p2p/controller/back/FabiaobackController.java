package com.p2p.controller.back;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.p2p.pojo.Fabiao;
import com.p2p.service.back.FabiaobackService;
import com.p2p.util.PageInfo;

/**
 * 操作人：朱勇峰
 * 操作时间：2018年1月5日09:30:43
 * 
 * */

@Controller
@RequestMapping("/back")
public class FabiaobackController {

	@Resource(name="fabiaobackServiceImpl")	
	private FabiaobackService fabiaoService;
	
	
	@RequestMapping("pagefabiao")
	@ResponseBody
	//发标表分页查询
	public PageInfo pagefabiao(Integer page,Integer rows,Fabiao fabiao) {
		Integer pageSize =0;
		PageInfo pageInfo = new PageInfo(pageSize,rows);
		Map<String,Object> map = new HashMap<String, Object>();
		pageInfo.setCondition(map);
		fabiaoService.selectPage(pageInfo, fabiao);
		pageInfo.setTotal(pageInfo.getTotal());
		return pageInfo;
	}
	
	@RequestMapping("insertfabiao")
	@ResponseBody
	//发标表增加
	public int insertfabiao(Fabiao fabiao) {
		int count =0;
		count = fabiaoService.addModel(fabiao);
		return count;
	}
	
	@RequestMapping("updatefabiao")
	@ResponseBody
	//发标表修改
	public int updatefabiao(Fabiao fabiao) {
		int count = fabiaoService.update(fabiao);
		return count;
	}
	
	@RequestMapping("deletefabiao")
	@ResponseBody
	//发标表删除
	public int deletefabiao(String ids) {
		int count =0;
		String[] idsStr = ids.split(",");
		for(int i=0;i<idsStr.length;i++) {
			String fid = (String)idsStr[i];
			Fabiao fabiao = new Fabiao();
			fabiao.setFid(Integer.valueOf(fid));
			count = fabiaoService.delete(fabiao);
		}
		return count;
	}
}

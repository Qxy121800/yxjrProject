package com.p2p.controller.back;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.p2p.pojo.Role;
import com.p2p.service.back.RoleService;
import com.p2p.util.PageInfo;

/**
 * 关于后台角色相关操作的controller
 * 2017-11-18
 * 操作人:胡孝玉
 * */
@Controller
@RequestMapping(value="/back/admin")
public class RoleController {
	@Resource(name="roleServiceImpl")
	private RoleService roleService;
	
	//实现分页查询
	@RequestMapping(value="seleRolelist")
	@ResponseBody
	public PageInfo  selectRoleList(Integer page, Integer rows,Role role) {
		Integer pageSize = 0;
		
		//得到总的页数
		//Integer count = roleService.roleCount();
		
		PageInfo pageInfo = new PageInfo(pageSize,rows);
		Map<String,Object> map = new HashMap<String,Object>();
		pageInfo.setCondition(map);
		roleService.selectPage(pageInfo,role);
		pageInfo.setTotal(pageInfo.getTotal());
		return pageInfo;
	}
	
	//实现新增
	@RequestMapping(value="insertRole")
	@ResponseBody
	public int insertRole(Role role) {
		int count = roleService.addModel(role);
		return count;
	}
	
	//修改角色信息
	@RequestMapping(value = "updateRole")
	@ResponseBody
	public  int updateRole(Role role){  
		int count = roleService.update(role);
		return count;
	}
	
	//删除
	@RequestMapping(value ="deleteRole")
	@ResponseBody
	public  int delRole(String ids){ 
		int count = 0;
		String[] idStr = ids.split(",");
		for (int i = 0; i < idStr.length;i++) {
			String reid = (String) idStr[i];
			Role role = new Role();
			role.setReid(Integer.valueOf(reid));
			count =roleService.delete(role);
		}
		return count;
	}
}

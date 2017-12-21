package com.p2p.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.p2p.pojo.Activity;
import com.p2p.service.front.ActivityServiceFront;
/**
 * 操作人:吴光海
 * 创建时间:2017-12-19
 * 操作前台员工的mapper
 * */
@Controller
public class ActivityControllerFront {
	@Resource(name="activityServiceImplFront")
	private ActivityServiceFront activityService;
	//前台查询
		@RequestMapping("listActivityFront")
		public String listActivityFront(Model model) {
			List<Activity> listActivityfront = activityService.listActivity();
			model.addAttribute("listActivityfront", listActivityfront);
			return "/views/front/activity";
		}
}

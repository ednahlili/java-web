package com.demo.app.module.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


@Controller
@RequestMapping("/user")
public class UserController {
	
	public static Map<String,RoleInfo> map = new HashMap<String,RoleInfo>();
	
	@RequestMapping("/userlist")
	public String userlist(Model model) {
		List<RoleInfo> rolelist = new ArrayList<RoleInfo>();
		
		for(Map.Entry<String, RoleInfo> entry :map.entrySet()) {
			rolelist.add(entry.getValue());
		}
	
		model.addAttribute("roles", rolelist);
		model.addAttribute("size", rolelist.size());
		
		return "/user/admin-role";
	}
	
	@RequestMapping("/adduser")
	public String adduser(HttpServletRequest request,Model model) {
		
		String id =request.getParameter("id");
		if("".equals(id)||null==id) {
			return "/user/admin-role-add";
		}else {
			RoleInfo role =map.get(id);
			model.addAttribute("role", role);
			return "/user/admin-role-add";
		}
	
		
	}
	
	
	
	@RequestMapping("/save")
	@ResponseBody
public ResultVo saveRole(RoleInfo role) {
		
		if(null != role) {
			if(null == role.getId() || "".equals(role.getId())) {
			String key = String.valueOf(System.currentTimeMillis());
			role.setId(key);
			map.put(key, role);
			}else {
				map.put(role.getId(), role);
			}
			return ResultVo.success();
		}else {		
			return ResultVo.msg("-1","添加失败！");
		}
	}
	
	@RequestMapping("/delRole")
	@ResponseBody
	public ResultVo delRole(HttpServletRequest request) {
		String id = request.getParameter("id");
		if(null != id && !"".equals(id)) {
			String[] ids = id.split(",");
			for(String key : ids) {
				map.remove(key);
			}
			return ResultVo.success();
		}else {
			return ResultVo.msg("-1", "删除失败");
		}
	}
}

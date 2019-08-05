package yummy.boot.controller;

import com.github.pagehelper.PageInfo;
import com.sky.blue.web.JsonResult;
import com.sky.blue.web.JsonResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import yummy.boot.entity.User;
import yummy.boot.service.UserService;

import java.util.List;

@RestController
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//http://127.0.0.1:8083/user/insert
	@RequestMapping(value = "/insert")
	public String insert() {
		userService.insertSample();
		return "ok";
	}

	//http://127.0.0.1:8083/user/selectByNameByPage?name=maning&pageNum=1&pageSize=2

	/**
	 * 演示分页查询写法
	 * */
	@RequestMapping(value = "/selectByNameByPage",method=RequestMethod.GET)
	public JsonResult selectByNameByPage(String name,Integer pageNum,Integer pageSize){
		PageInfo<User> pageInfo=userService.selectByNameByPage(name,pageNum,pageSize);
		return JsonResultUtil.createSuccessResult(pageInfo);
	}



	//http://127.0.0.1:8083/user/queryUser
	@RequestMapping(value="queryUser")
	public JsonResult queryUser(){
		List<User> list= userService.queryUser();
		return JsonResultUtil.createSuccessResult(list);
	}

	//http://127.0.0.1:8083/user/queryUserByUserName
	@RequestMapping(value="queryUserByUserName")
	public JsonResult queryUserByUserName(@RequestParam("userName") String userName){
		List<User> list= userService.queryUserByUserName(userName);
		return JsonResultUtil.createSuccessResult(list);
	}


}

package yummy.boot.controller;

import com.github.pagehelper.PageInfo;
import com.sky.blue.web.JsonResult;
import com.sky.blue.web.JsonResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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


	/**
	 * 演示xml方式与注解方式共存
	 * 即使在xml的工程中也能使用注解的方式使用mybatis
	 * */
	//http://127.0.0.1:8083/user/selectAll
	@RequestMapping(value="selectAll")
	public JsonResult selectAll(){
		List<User> list= userService.selectAll();
		return JsonResultUtil.createSuccessResult(list);
	}


}
package yummy.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import yummy.web.entity.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping(value = "/helloJson")
public class HelloJsonController {
	
	@RequestMapping(value = "/getDate")
	public Date getDate() {
		return new Date();
	}


	@RequestMapping(value = "/queryUser")
	public List<User> queryUser() {
		List<User> list=new ArrayList<>();

		User user=new User();
		user.setName("天空");
		user.setCode("sky");

		User user2=new User();
		user2.setName("白云");
		user2.setCode("cloud");

		list.add(user);
		list.add(user2);

		return list;
	}




}

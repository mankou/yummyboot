package yummy.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Date;

@RestController
@RequestMapping(value = "/helloJson")
public class HelloJsonController {
	
	@RequestMapping(value = "/getDate")
	public Date getDate() {
		return new Date();
	}




}

package yummy.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/hello")
public class HelloController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String test(){
        return "hello";
    }
}
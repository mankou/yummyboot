package yummy.boot.controller;

import com.sky.blue.web.JsonResult;
import com.sky.blue.web.JsonResultUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import yummy.boot.service.TestService;

import java.util.List;

@RestController
@RequestMapping(value = "/test")
@RequiredArgsConstructor
public class TestController {

    private final TestService testService;

    @RequestMapping(value = "/testQueryDb",method = RequestMethod.GET)
    public JsonResult testQueryDb() {
        List list=testService.testQueryDb();
        return JsonResultUtil.createSuccessResult(list);

    }
}

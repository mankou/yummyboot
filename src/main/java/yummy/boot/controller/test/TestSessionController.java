package yummy.boot.controller.test;

import com.sky.blue.web.JsonResult;
import com.sky.blue.web.JsonResultUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@RestController
@RequestMapping(value = "/test/session")
public class TestSessionController {

    @RequestMapping(value = "/testLogin")
    public Date testLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam String userName) {
        HttpSession session=request.getSession();
        session.setAttribute("userId",userName);
        return new Date();
    }


    @RequestMapping(value = "/visit")
    public JsonResult visit(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        String userId= (String) session.getAttribute("userId");
        return JsonResultUtil.createSuccessResult(userId);
    }
}

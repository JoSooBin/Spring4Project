package JSB.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.util.Date;

@Controller
public class IndexController {

    //호출방법 : http://localhost:8080/index
    @GetMapping("/index")
    public String index(){
        return "index.tiles";
    }


}

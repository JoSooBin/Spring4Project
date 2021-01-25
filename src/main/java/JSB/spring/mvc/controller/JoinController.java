package JSB.spring.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JoinController {
    // /join/agree
    @GetMapping("/join/agree")
    public String agree(){
        return "join/agree.tiles";
    }

    // /join/chekme
    @GetMapping("/join/checkme")
    public String checkme(){
        return "join/checkme.tiles";
    }

    // /join/joinme
    @GetMapping("/join/joinme")
    public String joinme(){
        return "join/joinme.tiles";
    }

    // /join/joinok
    @GetMapping("/join/joinok")
    public String joinok(){
        return "join/joinok.tiles";
    }

}

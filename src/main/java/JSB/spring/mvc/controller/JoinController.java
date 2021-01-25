package JSB.spring.mvc.controller;

import JSB.spring.mvc.service.MemberService;
import JSB.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JoinController {

    @Autowired
    private MemberService msrv;

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
    @GetMapping("/join/joinme") //회원가입 폼
    public String joinme(){
        return "join/joinme.tiles";
    }

    @PostMapping("/join/joinme") //회원가입 처리
    public String joinmeok(MemberVO mvo){

        System.out.println(msrv.newMember(mvo));

        return "redirect:/join/joinok";
    }

    // /join/joinok
    @GetMapping("/join/joinok")
    public String joinok(){
        return "join/joinok.tiles";
    }

}

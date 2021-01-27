package JSB.spring.mvc.controller;

import JSB.spring.mvc.service.MemberService;
import JSB.spring.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.util.Date;

@Controller
public class IndexController {

    @Autowired
    private MemberService msrv;

    //호출방법 : http://localhost:8080/index
    @GetMapping("/index")
    public String index(){
        return "index.tiles";
    }

    //로그인 체크기능
    //입력한 아이디/비밀번호로 로그인 가능여부 확인
    //로그인 성공시 로그인여부를 시스템에 저장하기 위해 HttpSession 객체를 이용함
    //즉, 서버가 생성한 정보를 일정기간 동안 WAS에 저장해두고 필요할때마다 이것을 활용함으로써
    //로그인한 사용자를 식별 할 수 있음
    @PostMapping("/login/login")
    public String loginok(MemberVO mvo, HttpSession sess){
        String returnPage = "redirect:/login/loginfail";

        if(msrv.checkLogin(mvo, sess)) //로그인 성공시
            returnPage = "redirect:/index";

        return returnPage;
    }

    //로그인 성공시 로그인여부를 세션객체로 만들어 두었음
    //로그아웃시에는 이 세션객체를 지워버리면 됨
    @GetMapping("/login/logout")
    public String logout(HttpSession sess){

        //세션 객체를 서버에서 제거됨
        sess.invalidate();

        return "redirect:/index";
    }

    //로그인 실패시 처리
    @GetMapping("/login/loginfail")
    public String fail(){
        return "fail.tiles";
    }
}

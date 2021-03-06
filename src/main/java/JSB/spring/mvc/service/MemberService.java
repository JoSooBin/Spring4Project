package JSB.spring.mvc.service;

import JSB.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;

public interface MemberService {
    String newMember(MemberVO mvo);

    String findZipcode(String dong);

    String checkUserid(String uid);

    boolean checkLogin(MemberVO mvo, HttpSession sess);
}

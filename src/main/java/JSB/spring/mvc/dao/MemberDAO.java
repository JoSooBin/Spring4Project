package JSB.spring.mvc.dao;

import JSB.spring.mvc.vo.MemberVO;
import JSB.spring.mvc.vo.ZipcodeVO;

import java.util.List;

public interface MemberDAO {
    int insertMember(MemberVO mvo);

    List<ZipcodeVO> selectZipcode(String dong);

    int selectOneUserid(String uid);
}

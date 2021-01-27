package JSB.spring.mvc.dao;

import JSB.spring.mvc.vo.MemberVO;
import JSB.spring.mvc.vo.ZipcodeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("mdao")
public class MemberDAOImple implements MemberDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override //회원정보 추가
    public int insertMember(MemberVO mvo) {
        return sqlSession.insert("member.insertMember", mvo);
    }

    @Override //우편번호 조회
    public List<ZipcodeVO> selectZipcode(String dong){
        return sqlSession.selectList("member.zipcode",dong);
    }

    @Override
    public int selectOneUserid(String uid) {
        return sqlSession.selectOne("member.checkuid",uid);
    }
}

package JSB.spring.mvc.dao;

import JSB.spring.mvc.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mdao")
public class MemberDAOImple implements MemberDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertMember(MemberVO mvo) {
        return sqlSession.insert("member.insertMember", mvo);
    }
}

package JSB.spring.mvc.dao;

import JSB.spring.mvc.vo.PdsVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("pdao")
public class PdsDAOImple implements PdsDAO {
    @Autowired private SqlSession sqlSession;

    @Override
    public int insertPds(PdsVO pvo) {
        return sqlSession.insert("pds.insertPds", pvo);
    }

    @Override
    public List<PdsVO> selectPds(int snum) {
        return sqlSession.selectList("pds.selectList",snum);
    }

    @Override
    public int selectCountPds() {
        return sqlSession.selectOne("pds.countPds");
    }

    @Override
    public PdsVO selectOnePds(String pno) {
        return sqlSession.selectOne("pds.selectOne",pno);
    }

    @Override
    public PdsVO selectOneFname(String pno, String order) {
        Map<String, String> param = new HashMap<>();
        param.put("pno", pno);
        param.put("order", "fname"+order);

        return sqlSession.selectOne("pds.selectOneFname", param);
    }
}

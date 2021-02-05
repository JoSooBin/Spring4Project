package JSB.spring.mvc.dao;

import JSB.spring.mvc.vo.GalleryVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("gdao")
public class GalleryDAOImple implements GalleryDAO{
    @Autowired private SqlSession sqlSession;

    @Override
    public int insertGallery(GalleryVO gvo) {
        sqlSession.insert("gallery.insertGallery", gvo);
        //방금 입력한 갤러리의 데이터의 gno값을 조사해서 반환
        return sqlSession.selectOne("gallery.lastGalleryID");
    }

    @Override
    public List<GalleryVO> selectGallery(int snum) {
        return sqlSession.selectList("gallery.selectList", snum);
    }

    @Override
    public int selectCountGallery() {
        return sqlSession.selectOne("gallery.countGallery");
    }

    @Override
    public GalleryVO selectOneGallery(String gno) {
        return sqlSession.selectOne("gallery.selectOne", gno);
    }
}

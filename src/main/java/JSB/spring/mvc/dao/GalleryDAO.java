package JSB.spring.mvc.dao;

import JSB.spring.mvc.vo.GalleryVO;

import java.util.List;

public interface GalleryDAO {
    int insertGallery(GalleryVO gvo);

    List<GalleryVO> selectGallery(int snum);

    int selectCountGallery();

    GalleryVO selectOneGallery(String gno);
}

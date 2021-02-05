package JSB.spring.mvc.service;

import JSB.spring.mvc.vo.GalleryVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface GalleryService {
    boolean newGallery(GalleryVO gvo, MultipartFile[] img);

    List<GalleryVO> readGallery(String cp);

    int countGallery();

    GalleryVO readOneGallery(String gno);
}

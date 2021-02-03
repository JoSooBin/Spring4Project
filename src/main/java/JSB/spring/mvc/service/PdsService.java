package JSB.spring.mvc.service;

import JSB.spring.mvc.vo.PdsVO;

import java.util.List;
import java.util.Map;

public interface PdsService {

    boolean newPds(Map<String, String> frmdata, PdsVO pvo);
    List<PdsVO> readPds(String cp);
    int countPds();

    PdsVO readOnePds(String cp);

    PdsVO readOneFname(String pno, String order);
}

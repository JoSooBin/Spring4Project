package JSB.spring.mvc.dao;

import JSB.spring.mvc.vo.PdsVO;

import java.util.List;
import java.util.Map;

public interface PdsDAO {
    int insertPds(PdsVO pvo);

    List<PdsVO> selectPds(int snum);

    int selectCountPds();

    PdsVO selectOnePds(String pno);

    PdsVO selectOneFname(String pno, String order);

    int updateDownCount(Map<String, String> param);
}

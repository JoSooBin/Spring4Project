package JSB.spring.mvc.service;

import JSB.spring.mvc.dao.BoardDAO;
import JSB.spring.mvc.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bsrv")
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO bdao;

    @Override
    public boolean newBoard(BoardVO bvo) {
        boolean isOK = false;

        int cnt = bdao.insertBoard(bvo);
        if(cnt>0) isOK = true;

        return isOK;
    }

    @Override
    public List<BoardVO> readBoard(String cp) {
        int snum = (Integer.parseInt(cp) -1 ) * 10;

        return bdao.selectBoard(snum);
    }

    @Override
    public BoardVO readOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

    @Override
    public boolean modifyBoard(BoardVO bvo) {
        return false;
    }

    @Override
    public boolean deleteBoard(String bno) {
        return false;
    }

    //게시글 총 갯수
    public int countBoard() {
        return bdao.selectCountBoard();
    }


}

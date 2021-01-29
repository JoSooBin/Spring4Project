package JSB.spring.mvc.service;

import JSB.spring.mvc.vo.BoardVO;

import java.util.List;

public interface BoardService {
    boolean newBoard(BoardVO bvo);
    List<BoardVO> readBoard(String cp);
    BoardVO readOneBoard(String bno);
    boolean modifyBoard(BoardVO bvo);
    boolean removeBoard(String bno);
    int countBoard();

    boolean viewCountBoard(String bno);
}

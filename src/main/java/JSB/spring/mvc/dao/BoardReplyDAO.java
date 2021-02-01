package JSB.spring.mvc.dao;

import JSB.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyDAO {
     List<ReplyVO> selectReply(int bno);

     int insertReply(ReplyVO rvo);
}

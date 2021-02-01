package JSB.spring.mvc.service;

import JSB.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyService {
 List<ReplyVO> readReply(String bno);

 boolean newReply(ReplyVO rvo);
}

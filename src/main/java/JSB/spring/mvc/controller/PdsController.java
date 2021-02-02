package JSB.spring.mvc.controller;

import JSB.spring.mvc.util.FileUpDownUtil;
import JSB.spring.mvc.vo.PdsVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class PdsController {

    @GetMapping("/pds/list")
    public String list(){
        return "pds/list.tiles";
    }

    @GetMapping("/pds/write")
    public String write(){
        return "pds/write.tiles";
    }

    @PostMapping("/pds/writeok") //파일업로드
    public String writeok(PdsVO pvo, HttpServletRequest req){

        //업로드 처리 및 폼데이터 가져오기
        FileUpDownUtil fud = new FileUpDownUtil();
        Map<String, String> frmdata = fud.procUpload(req);

        System.out.println(frmdata.get("title"));
        System.out.println(frmdata.get("contents"));
        System.out.println(frmdata.get("file1"));
        System.out.println(frmdata.get("file1size"));
        System.out.println(frmdata.get("file1type"));

        return "redirect;/pds/list?cp=1";
    }
}

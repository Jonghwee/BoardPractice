package mvc.ctr;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import mvc.domain.Lunchrush;
import mvc.util.ImageLink;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import mvc.svc.LunchrushService;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Project : BoardPractice
 * Created by OKESTRO
 * Developer : jonghwee
 * Date Time : 2022/09/20 3:17 PM
 * Summary : BoardPractice Controller
 **/
@RestController
@RequiredArgsConstructor
@Slf4j
@CrossOrigin(origins = "http://localhost:3000") //CORS(Cross-Origin Resource Sharing) 정책 위반 방지
public class LunchrushController {

    public final LunchrushService lunchrushService;

    @GetMapping("/hello")
    public List<String> hello(){
        return Arrays.asList("서버 포트는 8888", "리액트 포트는 3000");
    }

    /**
     *
     * list
     * @return String
     * @Date Time : 2022/09/25 4:15 PM
     * @Summary : 게시물 리스트
     */
    @RequestMapping("/list")
    public List<Lunchrush> list(Model model){
        return lunchrushService.selectAll();
    }

    /**
     *
     * selectByNo
     * @param boardNo
     * @return ModelAndView
     * @Date Time : 2022/09/25 4:16 PM
     * @Summary : 게시물 상세보기
     */
    @GetMapping("/read/{boardNo}")
    public ModelAndView selectByNo0(@PathVariable Long boardNo){
        Lunchrush lunchrush = lunchrushService.selectByNo(boardNo);
        return new ModelAndView("detail","lunchrush", lunchrush);

    }

    /**
     *
     * writeForm
     * @Date Time : 2022/09/25 4:17 PM
     * @Summary : 작성 폼 불러오기
     */
//    @GetMapping("/write")
//    public void writeForm(){}

    /**
     *
     * boardInsert
     * @param lunchrush
     * @param file
     * @return String
     * @throws IOException
     * @Date Time : 2022/09/25 5:10 PM
     * @Summary : 게시물 등록하기
     */
    @PostMapping("/insert")
    public Lunchrush insertBoard(@RequestBody Lunchrush lunchrush, MultipartFile file) throws IOException {

        System.out.println("insertBoard 도착");
        System.out.println(lunchrush);
        if(file.getSize()>0){
            File image = new File(ImageLink.LUNCH_IMG + file.getOriginalFilename());
            file.transferTo(image);
            lunchrush.setImage(file.getOriginalFilename());
        }

        return lunchrushService.insertBoard(lunchrush);

    }

    /**
     *
     * updateForm
     * @param boardNo
     * @return ModelAndView
     * @Date Time : 2022/09/25 4:35 PM
     * @Summary : 게시물 수정 폼
     */
    @PostMapping("/updateForm")
    public ModelAndView updateForm(Long boardNo){
        Lunchrush lunchrush = lunchrushService.selectByNo(boardNo);

        return new ModelAndView("update", "lunchrush", lunchrush);
    }

    /**
     *
     * updateBoard
     * @param lunchrush
     * @param file
     * @return ModelAndView
     * @throws IOException
     * @Date Time : 2022/09/25 5:58 PM
     * @Summary : 게시물 수정하기
     */
    @PostMapping("/update")
    public ModelAndView updateBoard(Lunchrush lunchrush, MultipartFile file) throws IOException{

        if(file.getSize()>0){
            File image = new File(ImageLink.LUNCH_IMG + file.getOriginalFilename());
            file.transferTo(image);
            lunchrush.setImage(file.getOriginalFilename());
        }

        Lunchrush dbLunch = lunchrushService.updateBoard(lunchrush);

        return new ModelAndView("detail","lunchrush", dbLunch);
    }

    /**
     *
     * deleteBoard
     * @param boardNo
     * @return String
     * @Date Time : 2022/09/25 6:01 PM
     * @Summary : 게시물 삭제하기
     */
    @PostMapping("/delete")
    public String deleteBoard(Long boardNo){
        lunchrushService.deleteBoard(boardNo);

        return "redirect:/list";
    }

}

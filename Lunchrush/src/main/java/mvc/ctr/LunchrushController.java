package com.ctr;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import com.svc.LunchrushService;

/**
 * Project : BoardPractice
 * Created by OKESTRO
 * Developer : jonghwee
 * Date Time : 2022/09/20 3:17 PM
 * Summary : BoardPractice Controller
 **/
@RestController
@RequiredArgsConstructor
public class LunchrushController {

    public final LunchrushService lunchrushService;

    @GetMapping ("/test")
    public String index(){
        System.out.println("controller");
        return "index";
    }
//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public ModelAndView selectByNo(Long boardNo){
//        Lunchrush lunchrush = lunchrushService.selectByNo(boardNo);
//        return new ModelAndView("index","lunchrush", lunchrush);
//    }
}

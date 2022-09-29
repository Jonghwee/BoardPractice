package com.svc.impl;

import com.domain.Lunchrush;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.repo.LunchrushRepository;
import com.svc.LunchrushService;

/**
 * Project : BoardPractice
 * Created by OKESTRO
 * Developer : jonghwee
 * Date Time : 2022/09/20 3:18 PM
 * Summary :
 **/
@Service
public class LunchrushServiceImpl implements LunchrushService {

    @Autowired
    private LunchrushRepository lunchrushRepository;

    /**
     *
     * selectByNo
     * @param boardNo
     * @return Lunchrush
     * @Date Time : 2022/09/23 3:20 PM
     * @Summary : boardNo로 게시글 가져오기
     */
    @Override
    public Lunchrush selectByNo(Long boardNo) {
        return lunchrushRepository.findById(boardNo).orElseThrow(()->
                new RuntimeException("Not found"));
    }
}

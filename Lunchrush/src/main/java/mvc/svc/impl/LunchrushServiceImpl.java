package mvc.svc.impl;

import mvc.domain.Lunchrush;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import mvc.repo.LunchrushRepository;
import mvc.svc.LunchrushService;

import java.util.List;

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

    @Override
    public List<Lunchrush> selectAll() {
        List<Lunchrush> list = lunchrushRepository.findAll();
        return list;
    }

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

    /**
     *
     * boardInsert
     * @param lunchrush
     * @Date Time : 2022/09/25 5:05 PM
     * @Summary : 게시물 등록하기
     */
    @Override
    public Lunchrush insertBoard(Lunchrush lunchrush) {

        return lunchrushRepository.save(lunchrush);
    }

    /**
     *
     * updateBoard
     * @param lunchrush
     * @return Lunchrush
     * @Date Time : 2022/09/25 5:40 PM
     * @Summary : 게시물 수정하기
     */
    @Override
    public Lunchrush updateBoard(Lunchrush lunchrush) {
        Lunchrush dbLunch = lunchrushRepository.findById(lunchrush.getBoardNo()).orElse(null);

        dbLunch.setPlaceName(lunchrush.getPlaceName());
        dbLunch.setAddress(lunchrush.getAddress());
        dbLunch.setScore(lunchrush.getScore());
        dbLunch.setDate(lunchrush.getDate());
        dbLunch.setContent(lunchrush.getContent());
        dbLunch.setImage(lunchrush.getImage());
        dbLunch.setLunchLeader(lunchrush.getLunchLeader());

        lunchrushRepository.save(dbLunch);

        return dbLunch;
    }

    /**
     *
     * deleteBoard
     * @param boardNo
     * @Date Time : 2022/09/25 6:00 PM
     * @Summary : 게시물 삭제하기
     */
    @Override
    public void deleteBoard(Long boardNo) {
        lunchrushRepository.deleteById(boardNo);
    }
}

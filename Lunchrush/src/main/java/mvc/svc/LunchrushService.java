package mvc.svc;

import mvc.domain.Lunchrush;

import java.util.List;

/**
 * Project : BoardPractice
 * Created by OKESTRO
 * Developer : jonghwee
 * Date Time : 2022/09/20 3:18 PM
 * Summary :
 **/
public interface LunchrushService {

    List<Lunchrush> selectAll();
    Lunchrush selectByNo(Long boardNo);

    Lunchrush insertBoard(Lunchrush lunchrush);

    Lunchrush updateBoard(Lunchrush lunchrush);

    void deleteBoard(Long boardNo);
}

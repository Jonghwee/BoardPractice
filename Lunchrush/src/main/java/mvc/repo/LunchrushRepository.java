package mvc.repo;

import mvc.domain.Lunchrush;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Project : BoardPractice
 * Created by OKESTRO
 * Developer : jonghwee
 * Date Time : 2022/09/23 10:32 AM
 * Summary :
 **/
public interface LunchrushRepository extends JpaRepository<Lunchrush, Long> {
}

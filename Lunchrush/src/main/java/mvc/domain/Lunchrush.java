package mvc.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.io.File;
import java.time.LocalDate;

/**
 * Project : BoardPractice
 * Created by OKESTRO
 * Developer : jonghwee
 * Date Time : 2022/09/23 12:56 AM
 * Summary :
 **/
@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Lunchrush {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "board_no_seq")
    @SequenceGenerator(sequenceName = "board_no_seq", allocationSize = 1, name="board_no_seq")
    private Long boardNo;

    private String date;

    private String placeName;

    private String address;

    private double score;

    private String content;

    private String image;

    private String lunchLeader;
}

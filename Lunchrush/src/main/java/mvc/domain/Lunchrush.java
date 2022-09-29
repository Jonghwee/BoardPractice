package com.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
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

    @CreatedDate
    private LocalDate date;

    private String placeName;

    private String address;

    private Integer score;

    private String content;

    private File image;

    private String lunchLeader;
}

package com.kh.semi.domain.vo;

import lombok.*;
import org.springframework.http.converter.json.GsonBuilderUtils;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
    private int boardNo;
    private int empNo; // 작성자 고유 번호
    private String boardTitle;
    private String boardContent;
    private Date createDate;
    private int boardType;

    // 추가된 필드
    private String memId; // 작성자
    private String storeName; // 소속 지점

}

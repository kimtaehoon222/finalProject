package com.workie.easy.sign.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Guide {

	private int guideNo; //가이드번호
	private String bigTitle; //대제목
	private String smallTitle; //소제목
	private String content; //내용
	private Date createDate; //등록일
	private Date modifyDate; //수정일
}

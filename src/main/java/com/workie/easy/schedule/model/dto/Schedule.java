package com.workie.easy.schedule.model.dto;

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
public class Schedule {

	/*기본 일정 정보*/
	private int skedNo;			    //일정번호
	private String skedCode;	    //일정분류코드
	private int empNo;			    //사원번호
	private String colorCode;	    //색상코드
	private String skedTitle;	    //일정제목
	private String skedContent;	    //일정내용
	private String skedStatus;	    //일정상태
	private String skedPlace;	    //일정장소
	private String skedMemo;	    //일정메모
	
	/*일정 시간 정보*/
	private String skedStart;		//일정시작
	private String skedStartTime;	//일정시작
	private String skedEnd;			//일정종료
	private String skedEndTime;		//일정종료
	
	/*일정 분류 */
//	private String skedCode;	    //일정분류코드
	private String skedCName;	    //일정분류명
	                                
	/*일정 색상*/                   
//	private String colorCode;	    //색상코드`
	private String rgbCode;		    //RGB코드
	private String colorName;	    //색상명
	
	
}

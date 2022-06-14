package com.workie.easy.sign.model.dto;

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
public class SignType {

	private String typeCode; //유형코드 (품의 : AA, 협조: BB, 휴가: CC)
	private String typeName; //유형명 (품의, 협조, 휴가)
}

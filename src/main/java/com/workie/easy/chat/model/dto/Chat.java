package com.workie.easy.chat.model.dto;



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
public class Chat {
	private int chatNo;
	private String message;
	private int toChat;
	private int fromChat;
	private String sendTime;
	private String changeName;
}

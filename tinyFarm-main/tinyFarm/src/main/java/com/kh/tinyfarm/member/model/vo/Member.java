package com.kh.tinyfarm.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class Member {
	private int userNo;
	private String userId;			
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private String address;
	private String originName;
	private String changeName;
	private String enrollDate;
	private String grade;
	private String status;
	
}

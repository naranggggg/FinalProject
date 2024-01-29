package com.kh.tinyfarm.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attachment {
	
	private int fileNo;
	private int refNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String createDate;
	private String status;
	private int fileType;
}

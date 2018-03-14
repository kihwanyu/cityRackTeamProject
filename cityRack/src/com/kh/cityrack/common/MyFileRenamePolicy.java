package com.kh.cityrack.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {
	
	public File rename(File oldFile) {
		
		File newFile = null;
		
		// 파일이 전송된 시간을 기준으로 리네임시켜줌
		long currentTime = System.currentTimeMillis();
		System.out.println("renamePolicy's currentTime : " + currentTime);
		// 출력결과 -> 1519720618065 즉, 이 이름으로 리네임시키는데 이건 잘 못알아들으니까 밑에처럼 (yyyyMMddHHmmss+랜덤수) 형식으로 저장
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNumber = (int)(Math.random()*100000);
		
		// 확장자명도 가져와서 붙여주기
		String name = oldFile.getName();
		String body = null; // 파일명
		String ext = null; // 확장자
		int dot = name.lastIndexOf(".");
		
		if(dot != -1) {
			// dot전까지를 바디에 저장
			body = name.substring(0, dot);
			
			// dot을 포함한 뒷부분도 포함
			ext = name.substring(dot);
		
		} else {
			// dot가 -1d이면 확장자가 없는경우 (리눅스에서)
			body = name;
			ext = "";
		}
		
		String fileName = ft.format(new Date(currentTime)) + randomNumber + ext;
		
		// 리턴을 위한 뉴파일 객체생성 (기존파일을 가지고 이름만 변경)
		newFile = new File(oldFile.getParent(), fileName);
		
		
		return newFile;
		
	}
	
}

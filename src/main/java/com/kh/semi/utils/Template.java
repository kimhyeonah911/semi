package com.kh.semi.utils;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class Template {
    public static String saveFile(MultipartFile file, HttpSession session, String path){
        //파일 원본명
        String originName = file.getOriginalFilename();

        //확장자
        String ext = originName.substring(originName.lastIndexOf("."));

        //확장자 제거한 원본명
        String fileNameWithoutExt = originName.substring(0, originName.lastIndexOf("."));

        String changeName = "product_" + fileNameWithoutExt + ext;

        //파일을 저장할 물리적 경로
        String savePath = session.getServletContext().getRealPath(path);

        try {
            file.transferTo(new File(savePath + changeName));
        } catch (IOException e) {
            throw new RuntimeException("파일 저장 중 오류 발생", e);
        }

        return changeName;
    }
}

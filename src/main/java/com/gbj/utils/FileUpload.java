package com.gbj.utils;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class FileUpload {
    public static String fileUpload(MultipartFile file) throws IllegalStateException, IOException{
        String path = "D:/photo";
        //获取文件名
        String real_name = file.getOriginalFilename();
        //获取后缀名
        String ext = FilenameUtils.getExtension(real_name);
        //生成新名字
        String name = UUID.randomUUID().toString().replaceAll("-" , "")+"."+ext;
        //建立一个空文件
        File fileEmpty = new File(path+"/"+name);
        file.transferTo(fileEmpty);
        return name;
    }
}

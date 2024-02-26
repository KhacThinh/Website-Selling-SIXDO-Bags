package com.bags.sixdoBag.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
@RequestMapping("test")
public class fileImages {

    @GetMapping("")
    public String test() {
        return "/quan-ly/san-pham/test";
    }

    private static String UPLOAD_DIR = "src/main/resources/static/images/";

    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String uploadPath = System.getProperty("user.dir") + "/src/main/resources/static/images/";
                // Lưu ảnh vào thư mục trong dự án của bạn hoặc thực hiện xử lý tùy chỉnh khác
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_DIR + file.getOriginalFilename())));
                stream.write(bytes);
                System.out.println(file.getOriginalFilename());
                stream.close();
                return "Upload successful";
            } catch (IOException e) {
                e.printStackTrace();
                return "Upload failed";
            }
        } else {
            return "File is empty";
        }
    }


}

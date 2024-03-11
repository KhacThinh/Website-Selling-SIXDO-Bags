package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.service.ChiTietSanPhamServivce;
import com.bags.sixdoBag.service.SanPhamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
@RequestMapping("test")
@RequiredArgsConstructor
public class fileImages {

    private final SanPhamService sanPhamService;

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

    @GetMapping("/quet-ma")
    public String hienThi(Model model) {
        return "/quan-ly/san-pham/quet-ma";
    }

    @PostMapping("/processQR")
    public @ResponseBody String processQR(Model model, @RequestParam(value = "qrData") String qrData){
        // Xử lý dữ liệu quét được và trả về kết quả cho JSP
        System.out.println("Scanner QR: " + qrData);
        return qrData;
    }


}

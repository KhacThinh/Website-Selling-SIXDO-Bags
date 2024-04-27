package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.KhachHang;
import com.bags.sixdoBag.model.entitys.SlideShow;
import com.bags.sixdoBag.service.SlideShowService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Controller
@RequestMapping("/sixdo-shop/slide-show")
@RequiredArgsConstructor
public class SlideShowController {

    private final SlideShowService slideShowService;


    @GetMapping("manager")
    public String chuyenTrangSlideShow() {
        return "/quan-ly/slide-show/slide-show";
    }

    @GetMapping("show")
    @ResponseBody
    public List<SlideShow> getSlideShow() {
        return slideShowService.getSlideShowManager();
    }

    @GetMapping("online")
    @ResponseBody
    public List<SlideShow> getSlideShowOnline() {
        return slideShowService.getListSlideShow();
    }

    @PostMapping("add")
    @ResponseBody
    public SlideShow addSlideShow(
            @RequestParam("textCollectionTitle") String textCollectionTitle,
            @RequestParam("textNewArrivals") String textNewArrivals,
            @RequestParam("linkChuyenTrang") String linkChuyenTrang,
            @RequestParam("trangThai") Integer trangThai,
            @RequestPart(value = "hinhAnh") MultipartFile hinhAnh) {
        if (textCollectionTitle == null || textCollectionTitle.isEmpty()) {
            throw new IllegalArgumentException("textCollectionTitle không được rỗng");
        }

        if (textNewArrivals == null || textNewArrivals.isEmpty()) {
            throw new IllegalArgumentException("textNewArrivals không được rỗng");
        }

        if (linkChuyenTrang == null || linkChuyenTrang.isEmpty()) {
            throw new IllegalArgumentException("linkChuyenTrang không được rỗng");
        }

        if (trangThai == null) {
            throw new IllegalArgumentException("trangThai không được rỗng");
        }
        SlideShow slideShow = new SlideShow();
        slideShow.setTextCollectionTitle(textCollectionTitle);
        slideShow.setTrangThai(trangThai);
        slideShow.setTextNewArrivals(textNewArrivals);
        slideShow.setLinkChuyenTrang(linkChuyenTrang);
        if (Objects.nonNull(hinhAnh) && !hinhAnh.isEmpty()) {
            try {
                byte[] bytes = hinhAnh.getBytes();
                String UPLOAD_DIR = "src/main/resources/static/images/banner/";
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_DIR + hinhAnh.getOriginalFilename())));
                stream.write(bytes);
                System.out.println(hinhAnh.getOriginalFilename());
                slideShow.setUrlHinhAnh("../static/images/banner/" + hinhAnh.getOriginalFilename() + "?" + UUID.randomUUID().toString());
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        System.out.println("/sixdo-shop/slide-show/ post");
        return slideShowService.addSlideShow(slideShow);
    }


    @PostMapping("sua")
    @ResponseBody
    public SlideShow editSlideShow(
            @RequestParam("idSlide") int id,
            @RequestParam("textCollectionTitle") String textCollectionTitle,
            @RequestParam("textNewArrivals") String textNewArrivals,
            @RequestParam("linkChuyenTrang") String linkChuyenTrang,
            @RequestParam("trangThai") Integer trangThai,
            @RequestParam(value = "hinhAnh", required = false) MultipartFile hinhAnh
    ) {
        try {
            System.out.println("/sixdo-shop/slide-show/edit" + id);
            if (textCollectionTitle == null || textCollectionTitle.isEmpty()) {
                throw new IllegalArgumentException("textCollectionTitle không được rỗng");
            }

            if (textNewArrivals == null || textNewArrivals.isEmpty()) {
                throw new IllegalArgumentException("textNewArrivals không được rỗng");
            }

            if (linkChuyenTrang == null || linkChuyenTrang.isEmpty()) {
                throw new IllegalArgumentException("linkChuyenTrang không được rỗng");
            }

            if (trangThai == null) {
                throw new IllegalArgumentException("trangThai không được rỗng");
            }
            SlideShow slideShow = slideShowService.getSlideShow(id);
            slideShow.setTextCollectionTitle(textCollectionTitle);
            slideShow.setTrangThai(trangThai);
            slideShow.setTextNewArrivals(textNewArrivals);
            slideShow.setLinkChuyenTrang(linkChuyenTrang);
            if (Objects.nonNull(hinhAnh) && !hinhAnh.isEmpty()) {
                try {
                    byte[] bytes = hinhAnh.getBytes();
                    String UPLOAD_DIR = "src/main/resources/static/images/banner/";
                    BufferedOutputStream stream =
                            new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_DIR + hinhAnh.getOriginalFilename())));
                    stream.write(bytes);
                    System.out.println(hinhAnh.getOriginalFilename());
                    slideShow.setUrlHinhAnh("../static/images/banner/" + hinhAnh.getOriginalFilename() + "?" + UUID.randomUUID().toString());

                    stream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            System.out.println("/sixdo-shop/slide-show/ edit");
            return slideShowService.edit(id, slideShow);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @PostMapping("delete")
    @ResponseBody
    public SlideShow deleteSlideShow(@RequestParam("id") int id) {
        return slideShowService.delete(id);
    }

    @PostMapping("findById")
    @ResponseBody
    public SlideShow findByIdSlideShow(@RequestParam("id") int id) {
        return slideShowService.getSlideShow(id);
    }

}

//<<<<<<< HEAD
////package com.bags.sixdoBag.controller;
////
////import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
////import com.bags.sixdoBag.service.SanPhamYeuThichService;
////import jakarta.validation.Valid;
////import lombok.RequiredArgsConstructor;
////import org.springframework.http.HttpStatus;
////import org.springframework.http.ResponseEntity;
////import org.springframework.web.bind.annotation.DeleteMapping;
////import org.springframework.web.bind.annotation.GetMapping;
////import org.springframework.web.bind.annotation.PathVariable;
////import org.springframework.web.bind.annotation.PostMapping;
////import org.springframework.web.bind.annotation.RequestBody;
////import org.springframework.web.bind.annotation.RequestMapping;
////import org.springframework.web.bind.annotation.RequestParam;
////import org.springframework.web.bind.annotation.RestController;
////
////@RestController
////@RequiredArgsConstructor
////@RequestMapping("/san_pham_yeu_thich")
////public class SanPhamYeuThichController {
////    public final SanPhamYeuThichService sanPhamYeuThichService;
////
////    @GetMapping("")
////    public ResponseEntity<?> getAll() {
////        return new ResponseEntity<>(sanPhamYeuThichService.getListSanPhamYeuThich(), HttpStatus.OK);
////    }
////
////
////
////    @PostMapping("")
////    public ResponseEntity<?> addSanPhamYT(@RequestBody @Valid SanPhamYeuThichRequest khuyenMai) {
////        return new ResponseEntity<>(sanPhamYeuThichService.addSanPhamYeuThich(khuyenMai), HttpStatus.OK);
////    }
////
////
////
////    @DeleteMapping("")
////    public ResponseEntity<?> deleteSanPhamYT(@RequestParam("idKh") Integer idKh , @RequestParam("idSp") Integer idSp) {
////        System.out.println(idKh +"abcccccc"+ idSp);
////        return new ResponseEntity<>(sanPhamYeuThichService.deleteSanPhamYeuThich(idKh,idSp), HttpStatus.OK);
////    }
////}
//=======
package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.dto.request.SanPhamYeuThichRequest;
import com.bags.sixdoBag.service.SanPhamYeuThichService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/san_pham_yeu_thich")
public class SanPhamYeuThichController {
    public final SanPhamYeuThichService sanPhamYeuThichService;

    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return new ResponseEntity<>(sanPhamYeuThichService.getListSanPhamYeuThich(), HttpStatus.OK);
    }



    @PostMapping("")
    public ResponseEntity<?> addSanPhamYT(@RequestBody @Valid SanPhamYeuThichRequest khuyenMai) {
        return new ResponseEntity<>(sanPhamYeuThichService.addSanPhamYeuThich(khuyenMai), HttpStatus.OK);
    }



    @DeleteMapping("")
    public ResponseEntity<?> deleteSanPhamYT(@RequestParam("idKh") Integer idKh , @RequestParam("idSp") Integer idSp) {
        System.out.println(idKh +"abcccccc"+ idSp);
        return new ResponseEntity<>(sanPhamYeuThichService.deleteSanPhamYeuThich(idSp,idKh), HttpStatus.OK);
    }
}
//>>>>>>> 1251dbe4665e9b3f18284e585dc8e4b975f3756c

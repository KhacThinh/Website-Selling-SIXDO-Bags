package com.bags.sixdoBag.controller;

import com.bags.sixdoBag.model.entitys.ChucVu;
import com.bags.sixdoBag.service.ChucVuService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/chucvu")
public class ChucVuController {

    public final ChucVuService chucVuService;


    @GetMapping("")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(chucVuService.getListChucVu());

    }
    @PostMapping("")
    public ResponseEntity<?>add(@RequestBody @Valid ChucVu cv ){
        return ResponseEntity.ok(chucVuService.addChucVu(cv));

    }

    @PutMapping("/{id}")
    public ResponseEntity<?>edit(@RequestBody @Valid ChucVu cv, @PathVariable int id){

        return ResponseEntity.ok(chucVuService.editChucVu(id,cv));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?>delete(@PathVariable int id){
        return ResponseEntity.ok(chucVuService.deleteChucVu(id));
    }
}

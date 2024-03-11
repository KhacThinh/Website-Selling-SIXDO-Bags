package com.bags.sixdoBag.config;

import com.bags.sixdoBag.interceptors.AuthenticateNhanVien;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfigNhanVien implements WebMvcConfigurer {
    @Autowired
    private AuthenticateNhanVien authenticateNhanVien;

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(authenticateNhanVien).
                addPathPatterns("/ban-tai-quay/**","/chi-tiet-san-pham/**","/chucvu/**","/danh-muc/**","/dia_chi_khach_hang/**",
                        "/doi-tuong-su-dung/**","/khach_hang/**","/khuyen-mai/**","/ma_giam_gia/**","/mau-sac/**",
                        "/nhan-vien/**","/san-pham/**","/san_pham_yeu_thich/**","/slide_show/**","/thoigianbaohanh/**","/thuonghieu/**").
                excludePathPatterns("/login/hien-thi");

    }
}

package com.bags.sixdoBag.config;

import com.bags.sixdoBag.controller.LoginController;
import com.bags.sixdoBag.interceptors.AuthenticateNhanVien;
import com.bags.sixdoBag.interceptors.AuthenticateQuanLy;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import java.nio.charset.StandardCharsets;
import java.util.Locale;

@Configuration
public class InterceptorConfigNhanVien implements WebMvcConfigurer {
    @Autowired
    private AuthenticateNhanVien authenticateNhanVien;
    @Autowired
    private AuthenticateQuanLy authenticateQuanLy;

    @Autowired
    private HttpSession session;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Disable caching for all resources
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/")
                .setCachePeriod(0);
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticateNhanVien)
                .addPathPatterns("/ban-tai-quay/demo","/hoa-don/nv-lich-su","/ban-tai-quay/nv-xac-nhan")
                .excludePathPatterns("/login/hien-thi");
        registry.addInterceptor(authenticateQuanLy)
                .addPathPatterns("/ban-tai-quay/", "/chi-tiet-san-pham/**", "/chucvu/**", "/danh-muc/**", "/dia_chi_khach_hang/**",
                        "/doi-tuong-su-dung/**", "/khach_hang/**", "/khuyen-mai/**" , "/mau-sac/**",
                        "/nhan-vien/**", "/san-pham/**", "/san_pham_yeu_thich/**", "/slide_show/**", "/thuonghieu/**","/thong-ke/**","/hoa-don/lich-su/**","/thoi_gian_bao_hanh/**")
                .excludePathPatterns("/login/hien-thi");
    }




    @Bean("messageSource")
    public MessageSource loadMessageSource() {
        ReloadableResourceBundleMessageSource source = new ReloadableResourceBundleMessageSource();
        source.setBasenames(
                "classpath:/message/valiate",
                "classpath:/i18n/home"
        );
        source.setDefaultEncoding(StandardCharsets.UTF_8.name());
        return source;
    }

    @Bean("localeResolver")
    public LocaleResolver localeResolver() {
        CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
        cookieLocaleResolver.setCookieMaxAge(60);
        cookieLocaleResolver.setCookiePath("/");
        cookieLocaleResolver.setDefaultLocale(new Locale("en"));
        return cookieLocaleResolver;
    }
}

package com.bags.sixdoBag.interceptors;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.io.IOException;
@Component
public class AuthenticateQuanLy implements HandlerInterceptor {
    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handle
    ) throws IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("quanLy")==null){
            session.setAttribute("error","quan ly null");
            response.sendRedirect(request.getContextPath()+"/login/hien-thi");
            return false;
        }
        return true;
    }
}

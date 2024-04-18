package com.kosta.bus_reserve.config.auth;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    //requestCache: 요청 캐시(사용자가 접근하려 했던 자원의 경로를 저장)
    private RequestCache requestCache = new HttpSessionRequestCache();

    //RedirectStrategy: 사용자를 특정 URL로 리다이렉트
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        // 사용자가 인증을 시도하기 이전에 접근을 시도했던 자원이 없을 경우 savedRequest는 null로 반환된다.
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        if(savedRequest != null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStrategy.sendRedirect(request, response, targetUrl);
        }else{
            // 접근하려고 했던 자원이 없는 경우 기본 타겟 URL로 리다이렉트
            redirectStrategy.sendRedirect(request, response, "/reserve/reserve_main");
        }
    }
}
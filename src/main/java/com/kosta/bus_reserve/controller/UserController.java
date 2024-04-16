package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.config.auth.PrincipalDetail;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController { //로그인한 유저의 정보를 가져오는 Restcontroller

    @GetMapping("/getUserId")
    public String getUserId() {
        // 현재 인증된 사용자 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        //System.out.println(authentication);

        // 사용자 정보 확인
        if (authentication != null && authentication.getPrincipal() instanceof PrincipalDetail) {
            // User 클래스를 이용하여 사용자 정보 가져오기
            PrincipalDetail userDetails = (PrincipalDetail) authentication.getPrincipal();
            String userId = userDetails.getUserId(); // 사용자 아이디
            System.out.println("UserController-현재 로그인한 사용자의 아이디: " + userId);
            return userId;
        } else {
            // 사용자 정보가 유효하지 않은 경우 또는 사용자가 로그인하지 않은 경우
            System.out.println("사용자가 로그인하지 않았거나 인증 정보가 유효하지 않습니다.");
            return "anonymousUser";
        }
    }

    @GetMapping("/user-authentication") //사용자가 로그인 상태인지 아닌지
    public boolean isAuthenticated(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof PrincipalDetail) {
                PrincipalDetail userDetails = (PrincipalDetail) principal;

                if (userDetails.getUsername().equals("anonymousUser")) { //로그인 하지 않은경우
                    return false;
                } else { // 사용자가 로그인한 경우
                    return true;
                }
            }
        }
        return false;
    }
}

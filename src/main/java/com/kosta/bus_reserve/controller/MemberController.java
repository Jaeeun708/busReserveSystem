package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.domain.UserVO;
import com.kosta.bus_reserve.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/member/*")
public class MemberController {

    @Autowired
    private MemberService service;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/login")
    public String login(){
        return "member/login";
    }

    @GetMapping("/member/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null){
            new SecurityContextLogoutHandler().logout(request,response,authentication);
        }
        return "redirect:/reserve/reserve_main"; // 로그아웃 성공 후 reserve_main 페이지로 리다이렉트
    }

    @GetMapping("/memberjoin")
    public String memberjoin(){
        return "member/memberjoin";
    }

    /*사용자 추가(회원가입)*/
    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody UserVO user){

        //해싱된 비밀번호 사용자 비밀번호에 설정
        String rawPassword = user.getPassword();
        //bCryptPasswordEncoder 객체를 사용하여 가져온 비밀번호 해싱
        String encPassword = bCryptPasswordEncoder.encode(rawPassword);
        user.setPassword(encPassword);

        service.saveMember(user);

        return new ResponseEntity<>("success", HttpStatus.OK);
    }
}

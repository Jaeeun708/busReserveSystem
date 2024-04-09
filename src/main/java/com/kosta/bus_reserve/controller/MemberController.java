package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.domain.UserVO;
import com.kosta.bus_reserve.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

package com.kosta.bus_reserve.service;


import com.kosta.bus_reserve.domain.UserVO;
import com.kosta.bus_reserve.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberMapper mapper;

    /*사용자 추가(회원가입)*/
    public void saveMember(UserVO user){
        mapper.saveMember(user);
    }

}

package com.kosta.bus_reserve.mapper;

import com.kosta.bus_reserve.domain.UserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    /*사용자 추가(회원가입)*/
    public void saveMember(UserVO user);

    /*사용자 조회(로그인)*/
    public UserVO getUser(String id);
}

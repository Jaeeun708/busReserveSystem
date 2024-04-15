package com.kosta.bus_reserve.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO implements Serializable {
    private String id;
    private String password;
    private String name;
    private String birth;
    private String phoneNo;
    private String email;
    private String type;  //권한

    //mycard와 관계설정
    private MyCardVO myCardVO;

}

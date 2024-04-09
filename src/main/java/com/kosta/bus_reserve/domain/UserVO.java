package com.kosta.bus_reserve.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserVO {
    private String id;
    private String password;
    private String name;
    private String birth;
    private String phoneNo;
    private String email;
    private String type;  //권한
}

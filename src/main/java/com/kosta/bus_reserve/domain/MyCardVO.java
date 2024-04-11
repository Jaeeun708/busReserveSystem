package com.kosta.bus_reserve.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyCardVO {
    private String id;
    private String cardNo;
    private String cardName;

}

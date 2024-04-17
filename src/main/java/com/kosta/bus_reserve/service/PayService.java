package com.kosta.bus_reserve.service;

import com.kosta.bus_reserve.domain.MyCardVO;
import com.kosta.bus_reserve.domain.PayDTO;
import com.kosta.bus_reserve.domain.UserVO;
import com.kosta.bus_reserve.mapper.PayMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class PayService {

    private PayMapper mapper;

    public int addPay(PayDTO pay) {
        return mapper.insertPay(pay);
    }

    public UserVO userAndCardInfo(String id) {
        return mapper.selectUserInfoAndCard(id);
    }

    public String getSeqPay(){
        return mapper.getSeqPay();
    }

}

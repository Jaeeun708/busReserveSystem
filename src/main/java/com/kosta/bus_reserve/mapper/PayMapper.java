package com.kosta.bus_reserve.mapper;

import com.kosta.bus_reserve.domain.MyCardVO;
import com.kosta.bus_reserve.domain.PayDTO;
import com.kosta.bus_reserve.domain.UserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayMapper {

    public String getTime();
    public int insertPay(PayDTO pay);
    public UserVO selectUserInfoAndCard(String id);

    public String getSeqPay();

}

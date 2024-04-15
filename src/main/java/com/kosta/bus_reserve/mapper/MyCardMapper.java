package com.kosta.bus_reserve.mapper;

import com.kosta.bus_reserve.domain.MyCardVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyCardMapper {

    /*자주쓰는 카드 조회*/
    public MyCardVO getMyCard(String id);

    /*자주쓰는 카드 등록*/
    public void saveMyCard(MyCardVO mycard);

    /*자주쓰는 카드 수정*/
    public void updateMyCard(String id, String cardNo, String cardName);

    /*자주쓰는 카드 삭제*/
    public void deleteMyCard(String id);

}

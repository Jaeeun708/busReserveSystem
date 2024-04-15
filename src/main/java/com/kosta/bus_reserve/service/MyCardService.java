package com.kosta.bus_reserve.service;

import com.kosta.bus_reserve.domain.MyCardVO;
import com.kosta.bus_reserve.mapper.MyCardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyCardService {

    @Autowired
    private MyCardMapper mapper;

    /*자주쓰는 카드 조회*/
    public MyCardVO getMyCard(String id){
        return mapper.getMyCard(id);
    }

    /*자주쓰는 카드 등록*/
    public MyCardVO saveMyCard(MyCardVO myCard){
        mapper.saveMyCard(myCard);
        return myCard;
    }

    /*자주쓰는 카드 수정*/
    public void updateMyCard(String id, String cardNo, String cardName){
        mapper.updateMyCard(id, cardNo, cardName);
    }

    /*자주쓰는 카드 삭제*/
    public void deleteMyCard(String id){
        mapper.deleteMyCard(id);
    }
}

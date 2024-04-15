package com.kosta.bus_reserve.service;

import com.kosta.bus_reserve.domain.BusVO;
import com.kosta.bus_reserve.domain.DispatchVO;
import com.kosta.bus_reserve.domain.PayDTO;
import com.kosta.bus_reserve.domain.TerminalVO;
import com.kosta.bus_reserve.mapper.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerService {

    @Autowired
    private ManagerMapper mapper;

    //배차관련
    public void insertDispatch(DispatchVO dispatchinfovo) {
        mapper.insertDispatch(dispatchinfovo);
    }

    public void updateDispatch(DispatchVO dispatchinfovo) {
        mapper.updateDispatch(dispatchinfovo);
    }

    public List<DispatchVO> getDispatchList() {
        return mapper.getDispatchList();
    }

    public List<BusVO> getBusList() {
        return mapper.getBusList();
    }

    public List<TerminalVO> getTerminalListManager() {
        return mapper.getTerminalListManager();
    }

    public List<String> getRegionList(){
        return mapper.getRegionList();
    }

	public int deleteDispatch(int dispatchNo) {
		return mapper.deleteDispatch(dispatchNo);
	}

    //결제내역 관련
    public List<PayDTO> getPaymentList(){
        System.out.println("service 테스트 : " + mapper.getPaymentList());
        return mapper.getPaymentList();
    }
}

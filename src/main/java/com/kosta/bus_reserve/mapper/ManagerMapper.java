package com.kosta.bus_reserve.mapper;

import com.kosta.bus_reserve.domain.BusVO;
import com.kosta.bus_reserve.domain.DispatchVO;
import com.kosta.bus_reserve.domain.PayDTO;
import com.kosta.bus_reserve.domain.TerminalVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ManagerMapper {
    //배차관련
    public int insertDispatch(DispatchVO dispatchinfovo);
    public int updateDispatch(DispatchVO dispatchinfovo);
    public List<DispatchVO> getDispatchList();
    public List<BusVO> getBusList();
    public List<TerminalVO> getTerminalListManager();
    public List<String> getRegionList();
    public int deleteDispatch(int dispatchNo);

    //결제내역 관련
    public List<PayDTO> getPaymentList();
}

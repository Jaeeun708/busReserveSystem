package com.kosta.bus_reserve.service;

import com.kosta.bus_reserve.domain.SearchedDispatch;
import com.kosta.bus_reserve.domain.TerminalVO;
import com.kosta.bus_reserve.domain.TicketVO;
import com.kosta.bus_reserve.mapper.ReserveMapper;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ReserveService {

    @Autowired
    private ReserveMapper reserveMapper;

    public List<TerminalVO> getTerminalList(){
        System.out.println("mapper: " + reserveMapper);
        List<TerminalVO> terminalList = null;
        terminalList = reserveMapper.getTerminalList();
        return terminalList;
    }

    public List<SearchedDispatch> getEndCandidate(String terminalName){  //출발지로 도착지후보터미널 목록 검색
        List<SearchedDispatch> dispatchList = null;
        dispatchList = reserveMapper.getEndCandidate(terminalName);
        return dispatchList;
    }

    public List<SearchedDispatch> getDispatchListBySearch(SearchedDispatch searchedDispatch){
        List<SearchedDispatch> searchedList = null;
        searchedList = reserveMapper.getDispatchList(searchedDispatch);
        return searchedList;
    }

    public List<TicketVO> getTicketsByDispatchNo(int dispatchNo){
        return reserveMapper.getTickets(dispatchNo);
    }

}

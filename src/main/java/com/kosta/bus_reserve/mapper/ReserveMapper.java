package com.kosta.bus_reserve.mapper;

import com.kosta.bus_reserve.domain.SearchedDispatch;
import com.kosta.bus_reserve.domain.TerminalVO;
import com.kosta.bus_reserve.domain.TicketVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReserveMapper {
    public List<TerminalVO> getTerminalList();

    //선택한 조건에 맞는 배차 정보들 검색.
    public List<SearchedDispatch> getDispatchList(SearchedDispatch searchedDispatch);

    //출발지에 대한 도착지검색(배차정보TB)
    public List<SearchedDispatch> getEndCandidate(String terminal);

    //배차번호로 해당 배차번호에 맞는 티켓들만 가져오기.
    public List<TicketVO> getTickets(int dispatchNo);

    //사용자 id로 기존에 예약했던 노선리스트 불러오기
    public List<SearchedDispatch> getRecordsByUserId(String userId);
}

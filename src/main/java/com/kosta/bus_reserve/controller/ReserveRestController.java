package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.domain.TicketVO;
import com.kosta.bus_reserve.service.ReserveService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/reserve/*")
public class ReserveRestController {
    private final ReserveService reserveService;

    @PostMapping("ticket")
    public ResponseEntity<String> insertTickets(@RequestBody List<TicketVO> ticketList){

        int insertCount = reserveService.insertTickets(ticketList);
        return insertCount >= 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}

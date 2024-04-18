package com.kosta.bus_reserve.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ReserveList {
    private String id;
    private int amount;
    private Date paymentDate;
    private int ticketNo;
    private String ticketStatus;
    private String startTerminal;
    private String endTerminal;
    private String departureTime;
    private String busType;
}

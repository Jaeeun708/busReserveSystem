package com.kosta.bus_reserve;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling//@Scheduled를 사용하기 위한 어노테이션
public class BusReserveApplication {

    public static void main(String[] args) {
        SpringApplication.run(BusReserveApplication.class, args);
    }

}

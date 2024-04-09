package com.kosta.bus_reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reserve/*")
public class ReserveController {

    @GetMapping("/reserve_main")
    public String managerInfo(){
        return "/reserve/reserve_main";
    }
}

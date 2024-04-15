package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.service.PayService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@AllArgsConstructor
@RequestMapping("/reserve/*")
public class PayController {

    private PayService service;

    @GetMapping("reserve_login")
    public String registerPay() {
        return "reserve/reserve_login";
    }

    @PostMapping("reserve_login")
    public String postRegisterPay(@RequestParam(value = "birth", required = false) String birth,
                                  @RequestParam(value = "phoneNo", required = false) String phoneNo,
                                  @RequestParam(value = "id", required = false) String id,
                                  @RequestParam(value = "startRegion", required = false) String startRegion,
                                  @RequestParam(value = "startTerminal", required = false) String startTerminal,
                                  @RequestParam(value = "endTerminal", required = false) String endTerminal,
                                  @RequestParam(value = "endRegion", required = false) String endRegion,
                                  @RequestParam(value = "busNo", required = false) String busNo,
                                  @RequestParam(value = "seatNo", required = false) String seatNo,
                                  @RequestParam(value = "people", required = false) String people,
                                  @RequestParam(value = "departureTime", required = false) String departureTime,
                                  @RequestParam(value = "price", required = false) String price,
                                  Model model) {
        System.out.println("birth: " + birth);
        System.out.println("phoneNo: " + phoneNo);
        System.out.println("id: " + id);

        // 모델에 birth와 phoneNo를 추가하여 JSP로 전달
        model.addAttribute("birth", birth);
        model.addAttribute("phoneNo", phoneNo);

        model.addAttribute("startTerminal", startTerminal);
        model.addAttribute("endTerminal", endTerminal);
        model.addAttribute("endRegion", endRegion);
        model.addAttribute("busNo", busNo);
        model.addAttribute("seatNo", seatNo);
        model.addAttribute("people", people);
        model.addAttribute("departureTime", departureTime);
        model.addAttribute("price", price);

        if (id != null) {
            return "redirect:reserve_pay/" + id;
        } else {
            return "reserve/reserve_pay";
        }
    }

    @GetMapping(value = {"reserve_pay/{id}", "reserve_pay"})
    public String mainRegisterPay(@PathVariable(value = "id") String id) {
        return "reserve/reserve_pay";
    }

}
package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.domain.UserVO;
import com.kosta.bus_reserve.service.PayService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@AllArgsConstructor
@RequestMapping("/pay/*")
public class PayController {

    private PayService service;

    @GetMapping("registerPay")
    public String registerPay() {
        return "registerPay";
    }

    @PostMapping("registerPay")
    public String postRegisterPay(@ModelAttribute("birth") String birth,
                                  @ModelAttribute("allPhoneNo") String phoneNo,
                                  @ModelAttribute("id") String id
    ) {
        System.out.println("birth: " + birth);
        System.out.println("phoneNo: " + phoneNo);
        System.out.println("userId: " + id);

        return "mainRegisterPay";
    }

    @GetMapping(value = {"mainRegisterPay", "mainRegisterPay/{id}"})
    public String mainRegisterPay() {
        return "mainRegisterPay";
    }

//    @PostMapping("registerPay")
//    public UserVO userAndCard(@PathVariable String id) {
//        return service.userAndCardInfo(id);
//    }

}

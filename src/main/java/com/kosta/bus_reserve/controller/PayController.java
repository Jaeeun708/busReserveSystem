package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.service.PayService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
                                  @RequestParam("id") String id,
                                  Model model
    ) {
        System.out.println("birth: " + birth);
        System.out.println("phoneNo: " + phoneNo);
        System.out.println("id: " + id);

        if (id != null) {
            model.addAttribute("userId", id);
        }

        return "redirect:mainRegisterPay/" + id;
    }

    @GetMapping("mainRegisterPay")
    public String mainRegisterPay(@RequestParam(name = "id", required = false) String id) {
        if (id != null) {
            System.out.println("RequestParam id: " + id);
        }
        return "mainRegisterPay"; // id가 있든 없든 페이지 이동 수행
    }

}

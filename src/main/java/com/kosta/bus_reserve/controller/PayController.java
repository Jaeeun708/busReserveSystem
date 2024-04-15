package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.service.MemberService;
import com.kosta.bus_reserve.service.PayService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
@RequestMapping("/reserve/*")
public class PayController {

    private PayService service;

    private MemberService memberService;

    @GetMapping("reserve_login")
    public String registerPay() {
        return "reserve/reserve_login";
    }

    @PostMapping("reserve_login")
    public String postRegisterPay(@RequestParam(value = "birth", required = false) String birth,
                                  @RequestParam(value = "phoneNo", required = false) String phoneNo,
                                  @RequestParam(value = "id", required = false) String id,
                                  Model model) {
        System.out.println("birth: " + birth);
        System.out.println("phoneNo: " + phoneNo);
        System.out.println("id: " + id);

        // 모델에 birth와 phoneNo를 추가하여 JSP로 전달
        model.addAttribute("birth", birth);
        model.addAttribute("phoneNo", phoneNo);

        if (id != null) {
            return "redirect:reserve_pay/" + id;
        } else {
            return "reserve/reserve_pay";
        }
    }

    @GetMapping(value = {"reserve_pay/{id}", "reserve_pay"})
    public String mainRegisterPay(@PathVariable(value = "id") String id,
                                  Model model,
                                  HttpSession session) {
        model.addAttribute("startRegion", session.getAttribute("startRegion"));
        model.addAttribute("startTerminal", session.getAttribute("startTerminal"));
        model.addAttribute("endTerminal", session.getAttribute("endTerminal"));
        model.addAttribute("endRegion", session.getAttribute("endRegion"));
        model.addAttribute("busNo", session.getAttribute("busNo"));
        model.addAttribute("seatNo", session.getAttribute("seatNo"));
        model.addAttribute("people", session.getAttribute("people"));
        model.addAttribute("departureTime", session.getAttribute("departureTime"));
        model.addAttribute("price", session.getAttribute("price"));

        return "reserve/reserve_pay";
    }

    @GetMapping("reserve_ok")
    public String endRegisterPay(Model model, HttpSession session) {
        model.addAttribute("startRegion", session.getAttribute("startRegion"));
        model.addAttribute("startTerminal", session.getAttribute("startTerminal"));
        model.addAttribute("endTerminal", session.getAttribute("endTerminal"));
        model.addAttribute("endRegion", session.getAttribute("endRegion"));
        model.addAttribute("busNo", session.getAttribute("busNo"));
        model.addAttribute("seatNo", session.getAttribute("seatNo"));
        model.addAttribute("people", session.getAttribute("people"));
        model.addAttribute("departureTime", session.getAttribute("departureTime"));
        model.addAttribute("price", session.getAttribute("price"));

        return "reserve/reserve_ok";
    }

}
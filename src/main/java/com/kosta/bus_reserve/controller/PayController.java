package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.config.auth.PrincipalDetail;
import com.kosta.bus_reserve.service.MemberService;
import com.kosta.bus_reserve.service.PayService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @PostMapping("reserve_login")  //비회원, reserve_login.jsp - MyForm제출 시 처리하는 컨트롤러
    public String postRegisterPay(@RequestParam(value = "birth") String birth,
                                  @RequestParam(value = "phoneNo") String phoneNo,
                                  Model model) {

        System.out.println("birth: " + birth);
        System.out.println("phoneNo: " + phoneNo);

        // 모델에 birth와 phoneNo를 추가하여 JSP로 전달
        model.addAttribute("birth", birth);
        model.addAttribute("phoneNo", phoneNo);

        return "reserve/reserve_pay";
    }

    @GetMapping("reserve_pay/{id}")  //회원 결제
    public String mainRegisterPay(@PathVariable(value = "id") String id,
                                  Model model,
                                  HttpSession session) {
        System.out.println("------reserve_pay getmapping");
        System.out.println("좌석번호 : "+session.getAttribute("seatNo"));
        model.addAttribute("startRegion", session.getAttribute("startRegion"));
        model.addAttribute("startTerminal", session.getAttribute("startTerminal"));
        model.addAttribute("endTerminal", session.getAttribute("endTerminal"));
        model.addAttribute("endRegion", session.getAttribute("endRegion"));
        model.addAttribute("busNo", session.getAttribute("busNo"));
        model.addAttribute("seatNo", session.getAttribute("seatNo"));
        model.addAttribute("people", session.getAttribute("people"));
        model.addAttribute("departureTime", session.getAttribute("departureTime"));
        model.addAttribute("dispatchNo", session.getAttribute("dispatchNo"));
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
        model.addAttribute("dispatchNo", session.getAttribute("dispatchNo"));
        model.addAttribute("price", session.getAttribute("price"));

        return "reserve/reserve_ok";
    }

    @GetMapping("seq-pay")
    @ResponseBody
    public String gesSeqPay(){
        return service.getSeqPay();
    }

}
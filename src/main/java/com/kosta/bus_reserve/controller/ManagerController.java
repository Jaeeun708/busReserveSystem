package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.domain.DispatchVO;
import com.kosta.bus_reserve.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

    @Autowired
    private ManagerService service;

    @GetMapping("/manager_info")
    public void managerMain() {
        System.out.println("manager_infoPage");
    }
    @GetMapping("/manager_route")
    public void getDispatchList(Model model) {
        model.addAttribute("dispatchList", service.getDispatchList());
        model.addAttribute("busList", service.getBusList());
        model.addAttribute("region", service.getRegionList());
        model.addAttribute("terminalList", service.getTerminalListManager());
    }

    @PostMapping(value = "/manager_route", consumes="application/json;")
    @ResponseBody
    public String saveDispatchInfo(@RequestBody DispatchVO dispatchInfoVo) {
        service.insertDispatch(dispatchInfoVo);
        return "save_success";
    }

//    @PostMapping("/remove")
//    public String deleteDispatch(@RequestBody int dispatchNo){
//        System.out.println("dispatchNo 테스트: " + dispatchNo);
//            service.deleteDispatch(dispatchNo);
//        return "redirect:/manager/manager_info";
//    }

    // 삭제 요청을 처리하는 핸들러
    @PostMapping("/delete")
    public ResponseEntity<String> deleteDispatch(@RequestParam("dispatchNo") int dispatchNo) {
        // 여기서는 단순히 dispatchNo를 사용하여 삭제를 수행한다고 가정합니다.
        // dispatch 삭제 로직을 구현해야 합니다. (예를 들어, dispatchNo를 가지고 DB에서 삭제하는 등)
        // 이 예시에서는 단순히 성공 여부만 반환합니다.
        if (dispatchNo > 0) {
            service.deleteDispatch(dispatchNo);
            // 성공적으로 삭제되었다는 응답 반환
            return ResponseEntity.ok("Dispatch deleted successfully");
        } else {
            // 삭제 실패했다는 응답 반환
            return ResponseEntity.badRequest().body("Failed to delete dispatch");
        }
    }

    @PutMapping("/manager_route")
    @ResponseBody
    public String modifyDispatchInfo(@RequestBody DispatchVO dispatchInfoVo) {
        service.updateDispatch(dispatchInfoVo);
        return "modify_success";
    }

    @GetMapping("/manager_payment")
    public void getPaymentList(Model model) {
        System.out.println("controller 테스트 : " + service.getPaymentList());
        model.addAttribute("paymentList", service.getPaymentList());
    }
}

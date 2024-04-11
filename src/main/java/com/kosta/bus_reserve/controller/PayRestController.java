package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.domain.PayDTO;
import com.kosta.bus_reserve.domain.UserVO;
import com.kosta.bus_reserve.service.PayService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/pay/*")
public class PayRestController {

    private PayService service;

    //결제정보를 입력하는 메서드
    @PostMapping("mainRegisterPay")
    public ResponseEntity<String> create(@RequestBody PayDTO dto) {

        System.out.println("restController: " + dto);

        int insertCount = service.addPay(dto);

        return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    //유저와 카드의 정보를 가져오는 테스트메서드
    @GetMapping("test/{id}")
    public UserVO infos(@PathVariable String id) {
        return service.userAndCardInfo(id);
    }

    //회원정보를 가져오는 메서드
//    @GetMapping("mainRegisterPay/{id}")
//    public ResponseEntity<UserVO> getUserAndCardInfo(@PathVariable String id) {
//        UserVO userVO = service.userAndCardInfo(id);
//
//        if (userVO != null) {
//            System.out.println("restController userVO");
//            return ResponseEntity.ok(userVO);
//        } else {
//            return ResponseEntity.notFound().build();
//        }
//    }

//    @GetMapping("mainRegisterPay/{id}")
//    public String mainRegisterPay(@PathVariable(required = false) String id) {
//        if (id != null) {
//            return "mainRegisterPay" + id;
//        } else {
//            return "mainRegisterPay";
//        }
//    }

}

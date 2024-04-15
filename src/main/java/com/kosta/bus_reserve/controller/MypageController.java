package com.kosta.bus_reserve.controller;

import com.kosta.bus_reserve.domain.MyCardVO;
import com.kosta.bus_reserve.service.MyCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/mypage/*")
public class MypageController {

    @Autowired
    private MyCardService service;

    //로그인한 사용자의 id 가져오는 메서드 생성
    private String getCurrentUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = authentication.getPrincipal();
        return ((UserDetails) principal).getUsername();
    }

    @GetMapping("/mypage_info")
    public String mypageInfo() {
        return "mypage/mypage_info";
    }

    /*자주쓰는 카드 조회*/
    @GetMapping("/mycard")
    public void getMyCard(Model model) {
        String userId = getCurrentUserId();
        System.out.println(userId);

        model.addAttribute("myCardInfo", service.getMyCard(userId));
    }

    /*자주쓰는 카드 등록페이지 이동*/
    @GetMapping("/mycard_insert")
    public String showMyCardInsertPage() {
        return "/mypage/mycard_insert";
    }

    /*자주쓰는 카드 등록*/
    @PostMapping("/mycard_insert")
    public ResponseEntity<String> saveMyCard(@RequestBody MyCardVO mycard) {
        String userId = getCurrentUserId();
        System.out.println(userId);

        mycard.setId(userId);

        MyCardVO myCard = service.saveMyCard(mycard);
        return ResponseEntity.ok("카드가 성공적으로 등록되었습니다.");
    }

    /*자주쓰는 카드 수정페이지 이동*/
    @GetMapping("/mycard_update")
    public String showMyCardUpdatePage(Model model) {
        String userId = getCurrentUserId();
        System.out.println(userId);

        MyCardVO mycardInfo = service.getMyCard(userId);
        model.addAttribute("myCardInfo", mycardInfo);
        return "/mypage/mycard_update";
    }

    /*자주쓰는 카드 수정*/
    @PostMapping("/mycard_update")
    public void updateMyCard(@RequestParam String cardNo, @RequestParam String cardName){
        String userId = getCurrentUserId();
        System.out.println(userId);

        service.updateMyCard(userId, cardNo, cardName);
    }

    /*자주쓰는 카드 삭제*/
    @DeleteMapping("/mycard_delete")
    public ResponseEntity<String> deleteMyCard(){
        String userId = getCurrentUserId();
        System.out.println(userId);

        service.deleteMyCard(userId);

        return ResponseEntity.ok("카드가 성공적으로 삭제되었습니다.");
    }
}


package com.shyam.gujarat_police.controllers;


import com.shyam.gujarat_police.dto.request.EventIdDto;
import com.shyam.gujarat_police.dto.request.PasswordHistoryDto;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.PasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/password-manager")
public class PasswordController {

    @Autowired
    private PasswordService passwordService;

    @PostMapping("/create-password")
    public APIResponse createPassword(@RequestBody EventIdDto dto){
        return APIResponse.ok(passwordService.generatePasswordForEvent(dto.getEventId()));
    }

    @PostMapping("/verify-password")
    public APIResponse verifyPassword(@RequestBody PasswordHistoryDto dto, HttpServletRequest req) {
           dto.setIp(req.getRemoteAddr());
           dto.setDeviceType(req.getHeader("User-Agent"));
           boolean isVerified = passwordService.verifyPassword(dto.getPassword(), dto.getEventId(), dto);
           return isVerified ? APIResponse.ok() : APIResponse.error("Invalid password");
    }

    @GetMapping("/history")
    public APIResponse getPasswordHistory(){
        return APIResponse.ok(passwordService.obtainPasswordHistory());
    }
}

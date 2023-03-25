package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.dto.request.PasswordHistoryDto;
import com.shyam.gujarat_police.dto.response.PasswordHistoriesList;
import com.shyam.gujarat_police.dto.response.PasswordsHistoryRespDto;
import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.entities.PasswordHistory;
import com.shyam.gujarat_police.entities.Passwords;
import com.shyam.gujarat_police.exceptions.CustomException;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.repositories.PasswordHistoryRepository;
import com.shyam.gujarat_police.repositories.PasswordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Service
public class PasswordService {
    @Autowired
    private PasswordRepository passwordRepository;

    @Autowired
    private PasswordHistoryRepository passwordHistoryRepository;

    @Autowired
    private EventService eventService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    public String generatePasswordForEvent(Long eventId){
        Event event = eventService.readSpecific(eventId);

        String password = generatePassword();
        String hashedPassword = passwordEncoder.encode(password);
        Passwords newPasswordForEvent = new Passwords();
        newPasswordForEvent.setHashedPassword(hashedPassword);
        newPasswordForEvent.setEventId(eventId);
        newPasswordForEvent.setCreatedAt(new Date());
        Calendar calendar = Calendar.getInstance();
        Date currentDate = calendar.getTime();
        calendar.add(Calendar.HOUR, 1);
        newPasswordForEvent.setValidityUpto(calendar.getTime());
        newPasswordForEvent.setExpired(false);

        passwordRepository.expireAllPasswordForEvent(eventId);
        passwordRepository.save(newPasswordForEvent);

        return password;
    }

    public boolean verifyPassword(String password, Long eventId, PasswordHistoryDto dto){
        Event event = eventService.readSpecific(eventId);
        Pageable pageable = PageRequest.of(0, 1);
        List<Passwords> passwords = passwordRepository.findMostRecentPassword(eventId, pageable).getContent();
        if (CollectionUtils.isEmpty(passwords)) {
            throw new DataNotFoundException("No new passwords found or passwords are expired, please contact admin");
        }
        Passwords lastPassword = passwords.get(0);
        Date now = new Date();
        if ((now.getTime() - lastPassword.getValidityUpto().getTime()) > 60*1000*1000){
            throw new CustomException("Password expired, please contact administrator");
        }

        // if password is valid expire currentPassword & create a password history
        if (passwordEncoder.matches(password, lastPassword.getHashedPassword())){
            lastPassword.setExpired(true);
            passwordRepository.save(lastPassword);
            PasswordHistory passwordHistory = new PasswordHistory();
            passwordHistory.setIp(dto.getIp());
            Integer accessType = dto.getAccessType() == null ? 0 : dto.getAccessType();
            passwordHistory.setAccessType(accessType);
            passwordHistory.setUsername(dto.getUsername());
            passwordHistory.setPhoneNumber(dto.getPhoneNumber());
            passwordHistory.setDeviceType(dto.getDeviceType());
            passwordHistory.setEventId(eventId);
            passwordHistoryRepository.save(passwordHistory);
            return true;
        } else {
            throw new CustomException("Password mismatch");
        }
    }

    private static String generatePassword() {
        final SecureRandom secureRandom = new SecureRandom();
        final int length = 8;
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(secureRandom.nextInt(10));
        }
        return sb.toString();
    }

    public PasswordHistoriesList obtainPasswordHistory(){
        List<PasswordHistory> passwordHistories = passwordHistoryRepository.findAll();
        if (CollectionUtils.isEmpty(passwordHistories)){
            throw new DataNotFoundException("No password history");
        }
        List<PasswordsHistoryRespDto> resp = new ArrayList<>();
        Event event = null;
        for(PasswordHistory ph : passwordHistories){
            PasswordsHistoryRespDto dto = new PasswordsHistoryRespDto();
            dto.setIp(ph.getIp());
            dto.setDeviceType(ph.getDeviceType());

            String accessType = ph.getAccessType() != null ? ph.getAccessType() == 1
                    ? "Manual Insert" : ph.getAccessType() == 2
                    ? "Excel Insert" : "Both Manual & Excel Inserts"
                    : "Not Accessed normally";
            dto.setAccessType(accessType);
            dto.setPhoneNumber(ph.getPhoneNumber());
            dto.setUsedAt(ph.getUsedAt());
            event = eventService.readSpecific(ph.getEventId());
            dto.setEventName(event.getEventName());
            dto.setUserName(ph.getUsername());
            resp.add(dto);
        }
        PasswordHistoriesList passwordHistoriesList = new PasswordHistoriesList();
        passwordHistoriesList.setPasswordsHistoryRespDtoList(resp);
        return passwordHistoriesList;
    }
}

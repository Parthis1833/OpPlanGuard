package com.shyam.gujarat_police.config;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shyam.gujarat_police.dto.request.PasswordHistoryDto;
import com.shyam.gujarat_police.exceptions.CustomException;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.PasswordService;
import com.shyam.gujarat_police.util.ObjectUtil;
import com.shyam.gujarat_police.util.RegExUtil;
import com.shyam.gujarat_police.util.TextUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ApplicationFilter extends OncePerRequestFilter {

    @Autowired
    private PasswordService passwordService;
    private static final Logger LOGGER = LoggerFactory.getLogger(ApplicationFilter.class);

    @Override
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = req;
        HttpServletResponse response = res;
        response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
        response.setHeader("Access-Control-Allow-Methods", "*");
        response.addHeader("Access-Control-Allow-Headers", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Max-Age", "3600");
        String url = request.getRequestURI();
        try {
            if (url.contains("police/upload-from-excel") && "POST".equals(request.getMethod())) {

                String userName = TextUtils.notBlankNotEmptyOrError(request.getHeader("username"), "username not found");
                String phoneNumber = TextUtils.notBlankNotEmptyOrError(request.getHeader("phone-number"), "phoneNumber not found");
                if (!RegExUtil.isNumber(phoneNumber)) {
                    throw new CustomException("Invalid Phone Number");
                }
                Object accessType = TextUtils.notBlankNotEmptyOrError(request.getHeader("access-type"), "Access Type not found");
                if (!RegExUtil.isAlphaNumeric(accessType.toString())) {
                    throw new CustomException("Data acess is invalid ");
                }
                String password = TextUtils.notBlankNotEmptyOrError(request.getHeader("password"), "password not found");
                Long eventId = Long.valueOf(TextUtils.notBlankNotEmptyOrError(request.getHeader("event-id"), "event id not found"));

                PasswordHistoryDto passwordHistoryDto = new PasswordHistoryDto();
                passwordHistoryDto.setUsername(userName);
                passwordHistoryDto.setPhoneNumber(phoneNumber);
                passwordHistoryDto.setAccessType(ObjectUtil.optInteger(accessType));
                passwordHistoryDto.setPassword(password);
                passwordHistoryDto.setEventId(eventId);
                passwordHistoryDto.setIp(req.getRemoteAddr());
                passwordHistoryDto.setDeviceType(req.getHeader("User-Agent"));

                passwordService.verifyPassword(password, eventId, passwordHistoryDto);
            }
            chain.doFilter(request, response);
        } catch (Exception e) {
            LOGGER.error("crashed in request " + request.getRequestURI());
            response.setStatus(HttpStatus.OK.value());
            response.getWriter().print(convertObjectToJson(APIResponse.error(e.getMessage())));
        }
    }

    public String convertObjectToJson(Object object) throws JsonProcessingException {
        if (object == null) {
            return null;
        }
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(object);
    }
}

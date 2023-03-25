package com.shyam.gujarat_police.dto.response;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class PasswordsHistoryRespDto {

    @JsonProperty("event-name")
    private String eventName;

    @JsonProperty("used-at")
    private Date usedAt;

    @JsonProperty("user-name")
    private String userName;

    @JsonProperty("ip")
    private String ip;

    @JsonProperty("phone-number")
    private String phoneNumber;

    @JsonProperty("device-type")
    private String deviceType;

    @JsonProperty("access-type")
    private String accessType;
}

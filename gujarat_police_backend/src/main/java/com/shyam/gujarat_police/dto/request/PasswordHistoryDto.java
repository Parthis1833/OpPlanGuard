package com.shyam.gujarat_police.dto.request;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Pattern;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class PasswordHistoryDto {

    @JsonProperty("id")
    private Long id;

    @JsonProperty("username")
    private String username;

    @Pattern(regexp="(0/91)?[6-9][0-9]{9}", message = "{validation.name.Size}")
    @JsonProperty("phone-number")
    private String phoneNumber;

    @JsonProperty("ip")
    private String ip;

    @JsonProperty("device-type")
    private String deviceType;

    @JsonProperty("event-id")
    private Long eventId;

    @JsonProperty("access-type")
    private Integer accessType; // manual 1, upload excel 2, both 2

    @JsonProperty("password")
    private String password;
}

package com.shyam.gujarat_police.dto.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreatePoliceDto {

    @JsonProperty("age")
    private String age= "";

    @JsonProperty("buckleNumber")
    private String buckleNumber= "";

    @JsonProperty("district")
    private String district= "";

    @JsonProperty("fullName")
    private String fullName= "";

    @JsonProperty("gender")
    private String gender= "";

    @JsonProperty("number")
    private String number= "";

    @JsonProperty("designation")
    private Long designation;

    @JsonProperty("policeStation")
    private Long policeStation;

    @JsonProperty("event-id")
    private Long eventId;
}

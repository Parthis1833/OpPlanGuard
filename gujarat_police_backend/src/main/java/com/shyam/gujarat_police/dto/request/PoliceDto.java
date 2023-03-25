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
public class PoliceDto {

    @JsonProperty("id")
    private Long id;

    @JsonProperty("full-name")
    private String fullName;

    @JsonProperty("buckle-number")
    private String buckleNumber;

    @JsonProperty("number")
    private String number;

    @JsonProperty("age")
    private int age;

    @JsonProperty("district")
    private String district;

    @JsonProperty("gender")
    private String gender;

    @JsonProperty("police-station-name")
    private String policeStationName;

    @JsonProperty("designation-name")
    private String designationName;

    @JsonProperty("assigned")
    private boolean isAssigned;
}

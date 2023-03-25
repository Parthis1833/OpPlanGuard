package com.shyam.gujarat_police.dto.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
@Setter
public class PoliceStationMinimalDto {

    @JsonProperty("district")
    private String district;

    @JsonProperty("district-in-gujarati")
    private String districtInGuj;

    @JsonProperty("taluko")
    private String taluko;

    @JsonProperty("taluko-in-gujarati")
    private String talukoInGuj;

    @JsonProperty("station-name")
    private String policeStationName;

    @JsonProperty("station-name-in-gujarati")
    private String policeStationNameInGujarati;


}

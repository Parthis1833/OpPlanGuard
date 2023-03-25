package com.shyam.gujarat_police.dto.response;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DistrictTalukaAndPoliceStationNameRespDto {

    @JsonProperty("district")
    private String district;

    @JsonProperty("district-in-gujarati")
    private String districtInGuj;

    @JsonProperty("taluko")
    private String taluko;

    @JsonProperty("taluko-in-gujarati")
    private String talukoInGuj;

    @JsonProperty("police-station-name-in-english")
    private String policeStationName;

    @JsonProperty("police-station-name-in-gujarati")
    private String policeStationNameInGujarati;
}

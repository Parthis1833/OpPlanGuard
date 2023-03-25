package com.shyam.gujarat_police.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.shyam.gujarat_police.entities.Police;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PoliceStationDto {
    @JsonProperty("police-in-station")
    private List<Police> police;

    @JsonProperty("district")
    private String district;

    @JsonProperty("taluko")
    private String taluko;

    @JsonProperty("contactNumber")
    private String contactNumber;

    @JsonProperty("address")
    private String address;

    @JsonProperty("police-station-name-in-english")
    private String policeStationName;

    @JsonProperty("police-station-name-in-gujarati")
    private String policeStationNameInGujarati;

    @JsonProperty("headPolice")
    private Police headPolice;
}

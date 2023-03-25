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
public class PoliceIdNameDesigNumDto {
    @JsonProperty("police-id")
    private Long policeId;

    @JsonProperty("police-name")
    private String policeName;

    @JsonProperty("police-designation")
    private String policeDesignation;

    @JsonProperty("police-number")
    private String policeNumber;

    @JsonProperty("police-district")
    private String policeDistrict;
}

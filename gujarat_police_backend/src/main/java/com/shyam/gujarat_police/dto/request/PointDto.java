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
public class PointDto {

    @JsonProperty("id")
    private Long id;

    @JsonProperty("taluka")
    private String taluka= "";

    @JsonProperty("district")
    private String district= "";

    @JsonProperty("pointName")
    private String pointName= "";

    @JsonProperty("accessories")
    private String accessories= "";

    @JsonProperty("remarks")
    private String remarks= "";

    @JsonProperty("zone")
    private Long zone;

    @JsonProperty("zone-name")
    private String zoneName;
}

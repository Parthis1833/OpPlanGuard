package com.shyam.gujarat_police.dto.response;

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
public class DesignationCountRespDto {
    @JsonProperty("designation-id")
    private Long designationId;
    @JsonProperty("designation-name")
    private String designationName;
    @JsonProperty("designation-count")
    private Integer designationCount;
}

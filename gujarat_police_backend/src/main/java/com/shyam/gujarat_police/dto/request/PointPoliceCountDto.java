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
public class PointPoliceCountDto {
    @JsonProperty("event-id")
    private Long eventId;

    @JsonProperty("point-id")
    private Long pointId;

    @JsonProperty("designation-id")
    private Long designationId;

    @JsonProperty("designation-count")
    private Integer designationCount;
}

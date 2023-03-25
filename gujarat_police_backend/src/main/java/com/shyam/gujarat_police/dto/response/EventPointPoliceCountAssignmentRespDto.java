package com.shyam.gujarat_police.dto.response;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class EventPointPoliceCountAssignmentRespDto {
    @JsonProperty("event-id")
    private Long eventId;

    @JsonProperty("point-id")
    private Long pointId;

    @JsonProperty("event-name")
    private String eventName="";

    @JsonProperty("point-name")
    private String pointName = "";

    @JsonProperty("assignments")
    private List<DesignationCountRespDto> assignments;
}

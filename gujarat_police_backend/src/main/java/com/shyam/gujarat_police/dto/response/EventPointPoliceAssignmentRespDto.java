package com.shyam.gujarat_police.dto.response;


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
public class EventPointPoliceAssignmentRespDto {
    @JsonProperty("event-id")
    private Long eventId;

    @JsonProperty("point-id")
    private Long pointId;

    @JsonProperty("assignment-count")
    private Integer assignmentCount;

    @JsonProperty("assigned-police-list")
    private List<PoliceInPointAndEventDto> assignedPoliceList;
}

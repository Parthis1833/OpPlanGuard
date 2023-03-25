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
public class AssignmentListRespDto {
    @JsonProperty("assignments-list")
    private List<EventPoliceCountAssignmentRowDto> assignmentsList;
}

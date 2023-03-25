package com.shyam.gujarat_police.dto.response;


import com.fasterxml.jackson.annotation.JsonProperty;
import com.shyam.gujarat_police.annotations.ExcelValue;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PointPoliceAssignmentRespDto {

    @ExcelValue(position = 0, name = "Point id")
    @JsonProperty("point-id")
    private Long pointId;

    @ExcelValue(position = 1, name = "Point name")
    @JsonProperty("point-name")
    private String pointName;

    @ExcelValue(position = 2, name = "Point Accessories")
    @JsonProperty("point-accessories")
    private String pointAccessories;

    @ExcelValue(position = 3, name = "Point remarks")
    @JsonProperty("point-remarks")
    private String pointRemarks;

    @ExcelValue(position = 4, name = "Zone name")
    @JsonProperty("zone-name")
    private String zoneName;

    @ExcelValue(position = 5, name = "Total assigned")
    @JsonProperty("assignment-count")
    private Integer assignmentCount;

    @JsonProperty("assigned-police-list")
    private List<PoliceInPointAndEventDto> assignedPoliceList;
}

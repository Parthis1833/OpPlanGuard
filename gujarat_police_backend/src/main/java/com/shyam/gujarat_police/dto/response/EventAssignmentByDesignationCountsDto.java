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
public class EventAssignmentByDesignationCountsDto {

    @JsonProperty("designation-id")
    private Long designationId;

    @JsonProperty("name")
    private String name;

    @JsonProperty("name-in-gujarati")
    private String nameInGujarati;

    @JsonProperty("assigned-count")
    private int assignedCount = 0;

    @JsonProperty("total-police-count")
    private int totalPoliceCount = 0;

    @JsonProperty("total-asked-count")
    private int totalAskedCount = 0;
}

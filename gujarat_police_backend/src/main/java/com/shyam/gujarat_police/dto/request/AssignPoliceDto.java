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
public class AssignPoliceDto {
    @JsonProperty("police-ids")
    private long policeId;

    @JsonProperty("point-id")
    private long pointId;

//    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
    @JsonProperty("assigned-date")
    private String assignedDate;

    @JsonProperty("duty-start-date")
    private String dutyStartDate;

    @JsonProperty("duty-end-date")
    private String dutyEndDate;

    @JsonProperty("event-id")
    private long eventId;


}

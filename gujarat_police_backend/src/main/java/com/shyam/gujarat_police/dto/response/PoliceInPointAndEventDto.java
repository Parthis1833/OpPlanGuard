package com.shyam.gujarat_police.dto.response;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.shyam.gujarat_police.annotations.ExcelValue;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PoliceInPointAndEventDto {
    @ExcelValue(position = 0, name = "Police id")
    @JsonProperty("police-id")
    private Long policeId;

    @ExcelValue(position = 1, name = "Duty Start")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
    @JsonProperty("duty-start-date")
    private Date dutyStartDate;

    @ExcelValue(position = 2, name = "Duty End")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
    @JsonProperty("duty-end-date")
    private Date dutyEndDate;

    @ExcelValue(position = 3, name = "Name")
    @JsonProperty("police-name")
    private String policeName;

    @ExcelValue(position = 4, name = "Police Station")
    @JsonProperty("police-station-name")
    private String policeStationName;

    @ExcelValue(position = 5, name = "Buckle No")
    @JsonProperty("buckle-number")
    private String buckleNumber;

    @ExcelValue(position = 6, name = "Gender")
    @JsonProperty("gender")
    private String gender;

    @ExcelValue(position = 7, name = "Number")
    @JsonProperty("number")
    private String number;

    @ExcelValue(position = 8, name = "Age")
    @JsonProperty("age")
    private String age;

    @ExcelValue(position = 9, name = "District")
    @JsonProperty("district")
    private String district;

    @ExcelValue(position = 10, name = "Designation")
    @JsonProperty("designation")
    private String designation;
}

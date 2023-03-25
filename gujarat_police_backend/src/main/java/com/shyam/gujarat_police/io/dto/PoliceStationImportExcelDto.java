package com.shyam.gujarat_police.io.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.shyam.gujarat_police.util.ImportUtil;
import com.shyam.gujarat_police.util.TextUtils;
import lombok.Getter;
import lombok.Setter;
import org.apache.poi.ss.usermodel.Row;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
@Setter
public class PoliceStationImportExcelDto {
    private Row row;

    private int rowNumber;

    private Map<String, Integer> header;

    private String serialNo;

    @Override
    public String toString() {
        return "PoliceStationImportExcelDto{" +
                "serialNo='" + serialNo + '\'' +
                ", city='" + city + '\'' +
                ", cityInGuj='" + cityInGuj + '\'' +
                ", postName='" + postName + '\'' +
                ", postNameInGuj='" + postNameInGuj + '\'' +
                ", taluko='" + taluko + '\'' +
                ", talukoInGuj='" + talukoInGuj + '\'' +
                ", contactNumber='" + contactNumber + '\'' +
                ", address='" + address + '\'' +
                '}';
    }

    private String city;

    private String cityInGuj;

    private String postName;

    private String postNameInGuj;

    private String taluko;

    private String talukoInGuj;

    private String contactNumber;

    private String address;
    private PoliceStationImportExcelDtoTemplate Police;
    private StringBuilder errorRowDetail;
    private boolean isPoliceStationValid = true;



    private String getValue(PoliceStationImportExcelDto.PoliceStationImportExcelDtoTemplate columnName) {
        Integer v = header.get(columnName.toString());
        if (v == null) {
            return null;
        }
        return ImportUtil.parseCellValue(ImportUtil.cellValue(row.getCell(v)));
    }

    PoliceStationImportExcelDto(){}

    public PoliceStationImportExcelDto(Map<String, Integer> header, Row row, int rowNumber){
        if (rowNumber >= 0) {
            this.rowNumber = rowNumber;
        }
        this.header = header;
        this.row = row;
        initCollectionData();
    }

    public int getRowNumber() {
        return rowNumber;
    }
    public void initCollectionData() {
        serialNo = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceStationImportExcelDto.PoliceStationImportExcelDtoTemplate.Serial_NO), "0");
        city = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceStationImportExcelDtoTemplate.City), "");
        cityInGuj = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceStationImportExcelDtoTemplate.CityInGuj), "");
        postName = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceStationImportExcelDtoTemplate.PostName), "");
        postNameInGuj = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceStationImportExcelDtoTemplate.PostNameInGuj), "");
        taluko = "-";
        talukoInGuj = "-";
        contactNumber = "";
        address = "-";

        if (TextUtils.isBlank(serialNo) || TextUtils.isBlank(city) || TextUtils.isBlank(cityInGuj)
                || TextUtils.isBlank(postName) || TextUtils.isBlank(postNameInGuj)) {
            isPoliceStationValid = false;
            if (TextUtils.isBlank(serialNo)) errorRowDetail.append(PoliceStationImportExcelDtoTemplate.Serial_NO).append(", ");
            if (TextUtils.isBlank(city)) errorRowDetail.append(PoliceStationImportExcelDtoTemplate.City).append(", ");
            if (TextUtils.isBlank(cityInGuj)) errorRowDetail.append(PoliceStationImportExcelDtoTemplate.CityInGuj).append(", ");
            if (TextUtils.isBlank(postName)) errorRowDetail.append(PoliceStationImportExcelDtoTemplate.PostName).append(", ");
            if (TextUtils.isBlank(postNameInGuj)) errorRowDetail.append(PoliceStationImportExcelDtoTemplate.PostNameInGuj).append(", ");

        }

    }

    public enum PoliceStationImportExcelDtoTemplate {
        Serial_NO("Sr. No."), City("City/District"), CityInGuj("શહેર/જિલ્લા"), PostName("Po.St. Name"), PostNameInGuj("પો.સ્ટે. .");

        private final String value;
        PoliceStationImportExcelDtoTemplate(String value) {this.value = value;}
        @Override
        public String toString() {return this.value;}

        public static List<String> list(){
            List<String> list = new ArrayList<>();
            for (PoliceStationImportExcelDto.PoliceStationImportExcelDtoTemplate policeTemplate : values()) {
                list.add(policeTemplate.value);
            }
            return list;
        }
    }
}

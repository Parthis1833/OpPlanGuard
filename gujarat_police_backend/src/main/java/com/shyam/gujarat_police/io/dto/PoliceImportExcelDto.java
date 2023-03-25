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
public class PoliceImportExcelDto {
    private Row row;

    private int rowNumber;

    private Map<String, Integer> header;

    private String serialNo;
    private String designation;
    private String officerName;
    private String buckleNo;
    private String mobileNumber;
    private String policeStationName;
    private String district;
    private String gender;

    private StringBuilder errorRowDetail;

    @Override
    public String toString() {
        return "PoliceImportExcelDto{" +
                "row=" + row +
                ", rowNumber=" + rowNumber +
                ", header=" + header +
                ", serialNo='" + serialNo + '\'' +
                ", designation='" + designation + '\'' +
                ", officerName='" + officerName + '\'' +
                ", buckleNo='" + buckleNo + '\'' +
                ", mobileNumber='" + mobileNumber + '\'' +
                ", policeStationName='" + policeStationName + '\'' +
                ", district='" + district + '\'' +
                ", gender='" + gender + '\'' +
                ", age='" + age + '\'' +
                ", isPoliceValid=" + isPoliceValid +
                '}';
    }

    private String age;

    private boolean isPoliceValid = true;
    private String getValue(PoliceImportExcelDtoTemplate columnName) {
        Integer v = header.get(columnName.toString());
        if (v == null) {
            return null;
        }
        return ImportUtil.parseCellValue(ImportUtil.cellValue(row.getCell(v)));
    }

    PoliceImportExcelDto(){}

    public PoliceImportExcelDto(Map<String, Integer> header, Row row, int rowNumber){
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

    public void initCollectionData(){
        serialNo = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.Serial_NO), "0");
        designation = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.Designation), "");
        officerName = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.Name), "");
        buckleNo = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.Buckle_No), "");
        mobileNumber = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.Mobile_Number), "");
        policeStationName = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.Police_Station_Name), "");
        district = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.District), "-");
        gender = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.Gender), "-");
        age = TextUtils.notBlankNotEmptyWithDefault(getValue(PoliceImportExcelDtoTemplate.Age), "0");

        if (TextUtils.isBlank(serialNo) || TextUtils.isBlank(designation)
                || TextUtils.isBlank(officerName) || TextUtils.isBlank(buckleNo)
                || TextUtils.isBlank(mobileNumber) || TextUtils.isBlank(policeStationName)){
            isPoliceValid = false;
            if (TextUtils.isBlank(serialNo)) errorRowDetail.append(PoliceImportExcelDtoTemplate.Serial_NO).append(", ");
            if (TextUtils.isBlank(designation)) errorRowDetail.append(PoliceImportExcelDtoTemplate.Designation).append(", ");
            if (TextUtils.isBlank(officerName)) errorRowDetail.append(PoliceImportExcelDtoTemplate.Name).append(", ");
            if (TextUtils.isBlank(buckleNo)) errorRowDetail.append(PoliceImportExcelDtoTemplate.Buckle_No).append(", ");
            if (TextUtils.isBlank(mobileNumber)) errorRowDetail.append(PoliceImportExcelDtoTemplate.Mobile_Number).append(", ");

        }
    }

    public StringBuilder getErrorRowDetail() {
        return errorRowDetail;
    }

    public void setErrorRowDetail(StringBuilder errorRowDetail) {
        this.errorRowDetail = errorRowDetail;
    }

    public enum PoliceImportExcelDtoTemplate {
//        Order_ID("Order Id"), New_Sku_Id("New Sku"), Old_Sku_Id("Delete Sku"), Type("Type");
        Serial_NO("Sr no"), Designation("Designation"), Name("Officer's Name"), Buckle_No("Buckle No"),
        Mobile_Number("Mobile Number"), Police_Station_Name("Police Station Name"), District("District"),
        Gender("Gender"), Age("Age");

        private final String value;

        PoliceImportExcelDtoTemplate(String value) {this.value = value;}

        @Override
        public String toString() {return this.value;}

        public static List<String> list(){
            List<String> list = new ArrayList<>();
            for (PoliceImportExcelDtoTemplate policeTemplate : values()) {
                list.add(policeTemplate.value);
            }
            return list;
        }
    }

}

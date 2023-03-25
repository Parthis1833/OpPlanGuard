package com.shyam.gujarat_police.helper;

import com.shyam.gujarat_police.entities.Designation;
import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.entities.Police;
import com.shyam.gujarat_police.entities.PoliceStation;
import com.shyam.gujarat_police.exceptions.ExcelException;
import com.shyam.gujarat_police.services.DesignationService;
import com.shyam.gujarat_police.services.PoliceStationService;
import com.shyam.gujarat_police.util.ObjectUtil;
import com.shyam.gujarat_police.util.RegExUtil;
import com.shyam.gujarat_police.util.TextUtils;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

@Component
public class ExcelHelper {
    static Logger logger = Logger.getLogger(ExcelHelper.class.getName());

    public static class PoliceIndex {
        public static final int POLICE_DESIGNATION = 1;
        public static final int POLICE_FULLNAME = 2;
        public static final int POLICE_BUCKLE_NUMBER = 3;
        public static final int POLICE_MOBILE_NUMBER = 4;
        public static final int POLICE_STATION = 5;
        public static final int POLICE_DISTRICT = 6;
        public static final int POLICE_GENDER = 7;
        public static final int POLICE_AGE = 8;
    }

    public static class PoliceStationIndex {
        public static final int POLICESTATION_DISTRICT = 2;
        public static final int POLICESTATION_DISTRICT_IN_GUJ = 3;
        public static final int POLICESTATION_NAME = 4;
        public static final int POLICESTATION_NAME_IN_GUJ = 5;
    }

    public static String TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    static String[] HEADERs = {"designation", "fullName", "buckleNumber", "number", "policeStationName",
            "district", "gender", "age"};
    static String SHEET = "SHEET1";

    @Autowired
    private DesignationService designationService;

    @Autowired
    private PoliceStationService policeStationService;

    public static boolean hasExcelFormat(MultipartFile file) {
        return TYPE.equals(file.getContentType());
    }

    public List<Police> excelToPolice(InputStream is, Event event){

        try {
            Workbook workbook = new XSSFWorkbook(is);

            Sheet sheet = workbook.getSheet(SHEET);
            Iterator<Row> rows = sheet.iterator();

            List<Police> policeListFromExcel = new ArrayList<>();

            int rowNumber = 0;
            while (rows.hasNext()) {
                Row currentRow = rows.next();

                // skip header
                if (rowNumber == 0) {
                    rowNumber++;
                    continue;
                }

                Iterator<Cell> cellsInRow = currentRow.iterator();

                Police police = new Police();

                int cellIdx = 1;
                try {
                    cellsInRow.next();
                    while (cellsInRow.hasNext()) {
                        DataFormatter formatter = new DataFormatter(); //creating formatter using the default locale
                        Cell currentCell = cellsInRow.next();
                        String cellValue = formatter.formatCellValue(currentCell).trim(); //Returns the formatted value of a cell as a String regardless of the cell type.


                        switch (cellIdx) {
                            case PoliceIndex.POLICE_DESIGNATION -> {
//                                System.out.println(cellValue);
                                Designation designation = designationService.getDesignationByNameOrNameInGujarati(cellValue);
                                police.setDesignation(designation);
                            }
                            case PoliceIndex.POLICE_FULLNAME -> police.setFullName(cellValue);
                            case PoliceIndex.POLICE_BUCKLE_NUMBER -> police.setBuckleNumber(cellValue);
                            case PoliceIndex.POLICE_MOBILE_NUMBER -> {
                                if (RegExUtil.validPhone(cellValue)){
                                    police.setNumber(cellValue);
                                } else {
                                    System.out.println(cellValue);
                                    throw new ExcelException("Invalid phone number: " + cellValue);
//                                    police.setNumber("0000000000");
                                }
                            }
                            case PoliceIndex.POLICE_STATION -> {
                                PoliceStation policeStation = policeStationService.readSpecificByNameOrDemo(cellValue);
                                police.setPoliceStation(policeStation);
                            }
                            case PoliceIndex.POLICE_DISTRICT -> police.setDistrict(cellValue);
                            case PoliceIndex.POLICE_GENDER -> police.setGender(cellValue);
                            case PoliceIndex.POLICE_AGE -> police.setAge(ObjectUtil.optIntegerDashToZero(cellValue,90));
                            default -> {
                                logger.info("Unknown cell type: " + currentCell.getStringCellValue());
                            }
                        }
                        cellIdx++;
                    }
                } catch (Exception e) {
                    throw new ExcelException(e.getMessage() + " : " + e.getCause() + " : " + e.getLocalizedMessage() + " : " + Arrays.toString(e.getStackTrace()));
                }
                police.setEvent(event);
                policeListFromExcel.add(police);
            }

            workbook.close();

            return policeListFromExcel;
        } catch (IOException e) {
            throw new RuntimeException("fail to parse Excel file: " + e.getMessage());
        }
    }

    public List<PoliceStation> excelToPoliceStation(InputStream inputStream) {

        try {
            Workbook workbook = new XSSFWorkbook(inputStream);

            Sheet sheet = workbook.getSheet(SHEET);
            Iterator<Row> rows = sheet.iterator();

            List<PoliceStation> policeStationListFromExcel = new ArrayList<>();

            int rowNumber = 0;
            while (rows.hasNext()) {
                Row currentRow = rows.next();

                // skip header
                if (rowNumber == 0) {
                    rowNumber++;
                    continue;
                }

                Iterator<Cell> cellsInRow = currentRow.iterator();

                PoliceStation policeStation = new PoliceStation();

                int cellIdx = 1;
                try {
                    while (cellsInRow.hasNext()) {
                        Cell currentCell = cellsInRow.next();

                        if (cellIdx == 1) {
                            cellIdx++;
                            continue;
                        }
                        DataFormatter formatter = new DataFormatter(); //creating formatter using the default locale

                        String cellValue = formatter.formatCellValue(currentCell).trim(); //Returns the formatted value of a cell as a String regardless of the cell type.

                        switch (cellIdx) {
                            case PoliceStationIndex.POLICESTATION_DISTRICT -> {
                                policeStation.setDistrict(cellValue);
//                                System.out.println(cellValue);
                            }
                            case PoliceStationIndex.POLICESTATION_DISTRICT_IN_GUJ -> {
                                policeStation.setDistrictInGuj(cellValue);
//                                System.out.println(cellValue);
                            }
                            case PoliceStationIndex.POLICESTATION_NAME -> {
                                policeStation.setPoliceStationName(cellValue);
//                                System.out.println(cellValue);
                            }
                            case PoliceStationIndex.POLICESTATION_NAME_IN_GUJ -> {
                                policeStation.setPoliceStationNameInGujarati(cellValue);
//                                System.out.println(cellValue);
                            }

//                            default -> {
//                                logger.info("Unknown cell type: " + currentCell.getStringCellValue() + " " + cellIdx);
//                            }
                        }
                        cellIdx++;
                    }
                } catch (Exception e) {
                    throw new ExcelException(e.getMessage() + " : " + e.getCause() + " : " + e.getLocalizedMessage() + " : " + Arrays.toString(e.getStackTrace()));
                }

                policeStation.setAddress("-");
                policeStation.setTaluko("-");
                policeStation.setTalukoInGuj("-");
                policeStation.setContactNumber("");
                if (TextUtils.notBlankNotEmpty(policeStation.getPoliceStationName()) &&
                        TextUtils.notBlankNotEmpty(policeStation.getPoliceStationNameInGujarati()) &&
                        TextUtils.notBlankNotEmpty(policeStation.getDistrict()) &&
                        TextUtils.notBlankNotEmpty(policeStation.getDistrictInGuj())) {
                    policeStationListFromExcel.add(policeStation);
                }
            }

            workbook.close();

            return policeStationListFromExcel;
        } catch (IOException e) {
            throw new RuntimeException("fail to parse Excel file: " + e.getMessage());
        }
    }
}

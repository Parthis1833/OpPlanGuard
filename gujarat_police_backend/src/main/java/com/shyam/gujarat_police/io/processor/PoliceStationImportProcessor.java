package com.shyam.gujarat_police.io.processor;

import com.shyam.gujarat_police.dto.request.CreatePoliceDto;
import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.exceptions.CustomException;
import com.shyam.gujarat_police.io.ExcelDataObject;
import com.shyam.gujarat_police.io.dto.PoliceImportExcelDto;
import com.shyam.gujarat_police.io.dto.PoliceStationImportExcelDto;
import com.shyam.gujarat_police.io.read.ExcelReadProcessor;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.PoliceStationService;
import com.shyam.gujarat_police.util.ImportUtil;
import com.shyam.gujarat_police.util.ObjectUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Component("police_station_import_processor")
public class PoliceStationImportProcessor implements ExcelReadProcessor<Sheet>  {
    private static final Logger LOGGER = LoggerFactory.getLogger(PoliceStationImportProcessor.class);

    @Lazy
    @Autowired
    private PoliceStationService policeStationService;

    @Override
    public ExcelDataObject processSheet(Sheet rows, ExcelDataObject obj, Object param) throws CustomException {

        LOGGER.info("Processing sheet for importing police station in event");
        if (Objects.nonNull(rows)) {
            int rowNumber = 1;
            boolean firstRow = true;
            Map<Integer, String> errorMap = new HashMap<>();
            Map<String, Integer> header = null;
            for(Row row : rows){
                if(!ImportUtil.isEmptyRow(row)) {
                    if (firstRow) {
                        firstRow = false;
                        header = ImportUtil.columnNameColumnIndex(row);
                        List<String> list = ImportUtil.verifyHeader(header, PoliceStationImportExcelDto.PoliceStationImportExcelDtoTemplate.list());

                        if (list != null && list.size() > 0) {
                            obj.getErrorList().add("Header column missing" +list.stream().map(Object::toString).collect(Collectors.joining(", ")));
                            return obj;
                        }
                    } else {
                        PoliceStationImportExcelDto policeStationImport = new PoliceStationImportExcelDto(header, row, rowNumber);
                        if (!policeStationImport.isPoliceStationValid()){
                            errorMap.put(rowNumber, "row Number::" + rowNumber + " :: " + "Invalid police information at perticular row" + policeStationImport.getErrorRowDetail().toString());
                        } else {
                            APIResponse resp = policeStationService.savePoliceStationFromExcel(policeStationImport);
                            if (resp.getResponse() != null && resp.getResponse().getError() != 0) {
                                errorMap.put(rowNumber, "row Number::" + rowNumber + " :: " + resp.getResponse().getMessage());
                                obj.setFailureCount(obj.getFailureCount() + 1);
                            } else {
                                obj.setSuccessCount(obj.getSuccessCount() + 1);
                            }
                        }
                    }
                }
                rowNumber++;
            }


            if (errorMap.size() > 0) {
                obj.getErrorList().addAll(errorMap.values());
            }

            return obj;
        }
        obj.getErrorList().add("No Rows found");
        return obj;
    }

    @Override
    public void initMethod(String firebaseNode) {

    }
}

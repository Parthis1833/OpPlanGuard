package com.shyam.gujarat_police.io.processor;

import com.shyam.gujarat_police.dto.request.CreatePoliceDto;
import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.exceptions.CustomException;
import com.shyam.gujarat_police.io.ExcelDataObject;
import com.shyam.gujarat_police.io.dto.PoliceImportExcelDto;
import com.shyam.gujarat_police.io.read.ExcelReadProcessor;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.EventService;
import com.shyam.gujarat_police.services.PoliceService;
import com.shyam.gujarat_police.util.ImportUtil;
import com.shyam.gujarat_police.util.ObjectUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.stream.Collectors;

@Component("police_import_processor")
@Primary
public class PoliceImportProcessor implements ExcelReadProcessor<Sheet> {
    private static final Logger LOGGER = LoggerFactory.getLogger(PoliceImportProcessor.class);

    @Lazy
    @Autowired
    private PoliceService policeService;

    @Autowired
    private EventService eventService;

    @Override
    public ExcelDataObject processSheet(Sheet rows, ExcelDataObject obj, Object param) throws CustomException {
        Long eventId = ObjectUtil.optLong(param);
        Event event = eventService.readSpecific(eventId); // will throw error if not found

        LOGGER.info("Processing sheet for importing police in event");
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
                        List<String> list = ImportUtil.verifyHeader(header, PoliceImportExcelDto.PoliceImportExcelDtoTemplate.list());

                        if (list != null && list.size() > 0) {
                            obj.getErrorList().add("Header column missing" +list.stream().map(Object::toString).collect(Collectors.joining(", ")));
                            return obj;
                        }
                    } else {
                        PoliceImportExcelDto policeImport = new PoliceImportExcelDto(header, row, rowNumber);
                        if (!policeImport.isPoliceValid()){
                            errorMap.put(rowNumber, "row Number::" + rowNumber + " :: " + "Invalid police information at perticular row" + policeImport.getErrorRowDetail().toString());
                        } else {
                            APIResponse resp = policeService.savePoliceFromExcel(policeImport, event);
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

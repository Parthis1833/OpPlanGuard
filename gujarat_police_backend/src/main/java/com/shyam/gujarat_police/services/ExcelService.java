package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.entities.Police;
import com.shyam.gujarat_police.entities.PoliceStation;
import com.shyam.gujarat_police.exceptions.DataInsertionException;
import com.shyam.gujarat_police.helper.ExcelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class ExcelService {

    @Autowired
    private PoliceService policeService;

    @Autowired
    private ExcelHelper excelHelper;

    @Autowired
    private EventService eventService;

    @Autowired
    private PoliceStationService policeStationService;



    public int savePoliceFromExcel(MultipartFile file, Long eventId) throws IOException {
        Event event = eventService.readSpecific(eventId);
        List<Police> policeListFromExcel = excelHelper.excelToPolice(file.getInputStream(), event);
        return policeService.saveMultiple(policeListFromExcel);
    }

    public int savePoliceStationFromExcel(MultipartFile file) throws IOException{
        List<PoliceStation> policeStationListFromExcel = excelHelper.excelToPoliceStation(file.getInputStream());
        try {
            return policeStationService.saveMultiple(policeStationListFromExcel);
        } catch (Exception e) {
            throw new DataInsertionException(e.getMessage() + " : " + "Police Station from excel failed");
        }
    }
}

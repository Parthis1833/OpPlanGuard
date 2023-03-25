package com.shyam.gujarat_police.controllers;

import com.shyam.gujarat_police.dto.response.DistrictTalukaAndPoliceStationNameRespDto;
import com.shyam.gujarat_police.entities.PoliceStation;
import com.shyam.gujarat_police.helper.ExcelHelper;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.ExcelService;
import com.shyam.gujarat_police.services.PoliceStationService;
import com.shyam.gujarat_police.util.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/police-station")
public class PoliceStationController {

    @Autowired
    private PoliceStationService policeStationService;


    @Autowired
    private ExcelService excelService;

    private static final Logger LOGGER = LoggerFactory.getLogger(PoliceStationController.class);


    @GetMapping("/")
    public APIResponse getAllPoliceStation(){
        return APIResponse.ok(policeStationService.getAllPoliceStation());
    }

    @PostMapping("/")
    public APIResponse savePoliceStation(@RequestBody @Valid PoliceStation station){
        PoliceStation dto = policeStationService.savePoliceStation(station);
        return APIResponse.ok(dto);
    }

    @PutMapping("/{stationId}")
    public APIResponse updatePoliceStation(@RequestBody @Valid PoliceStation policeStation, @PathVariable("stationId") Long stationId){
        PoliceStation dto = policeStationService.updatePoliceStation(policeStation, stationId);
        return APIResponse.ok(dto);
    }

    @GetMapping("/{stationId}")
    public APIResponse readSpecific(@PathVariable("stationId") Long stationId){
        PoliceStation dto = policeStationService.readSpecificById(stationId);
        return APIResponse.ok(dto);
    }

    @DeleteMapping("/{stationId}")
    public APIResponse deleteSpecific(@PathVariable("stationId") Long stationId) {
        policeStationService.deletePoliceStation(stationId);
        return APIResponse.ok( "policeStation deleted successfully with id " + stationId );
    }
//JPZKvQGHuhJyGxE+6gU+/lncJMDIKl8W6VW5GlQe
    @PostMapping("/upload-from-excel")
    public APIResponse uploadFromExcel(@RequestParam("file") MultipartFile multiPartFile) throws IOException {
        String message = "";

//        if (ExcelHelper.hasExcelFormat(file)){
//            int totalPoliceStationInserted = excelService.savePoliceStationFromExcel(file);
//            message = "Police station Uploaded from Excel successfully " + totalPoliceStationInserted;
////            return ResponseEntity.ok(message);
//            return APIResponse.ok(message);
//        }
////        return ResponseEntity.ok("Something went wrong");
//        return APIResponse.error(message);
        if (!multiPartFile.isEmpty()) {
            File file = FileUtils.multipartToFile(multiPartFile, multiPartFile.getName());
            return policeStationService.uploadFromExcel(file);
        }
//            if (ExcelHelper.hasExcelFormat(file)){
//            int totalPoliceInserted = excelService.savePoliceFromExcel(file, eventId);
//            message = "Police Uploaded from Excel successfully " + totalPoliceInserted;
//            return APIResponse.ok(message);
//        }
        return APIResponse.error("Something went wrong");
    }

    @GetMapping("/district-taluka-station")
    public APIResponse getPoliceStationInDistTalukaAndName(){
        List<DistrictTalukaAndPoliceStationNameRespDto> dto = policeStationService.getDistrictTalukaAndPoliceStation();
        return APIResponse.ok(dto);
    }

    @GetMapping("/download-sample-station-excel")
    public APIResponse downloadSamplePoliceExcel() {
        LOGGER.info("downloadSamplePoliceExcel");
        return APIResponse.ok(policeStationService.downloadSamplePoliceStationExcel());
    }
}

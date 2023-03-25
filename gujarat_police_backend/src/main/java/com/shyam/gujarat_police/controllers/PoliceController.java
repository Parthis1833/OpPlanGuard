package com.shyam.gujarat_police.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.shyam.gujarat_police.dto.request.CreatePoliceDto;
import com.shyam.gujarat_police.dto.request.PoliceDto;
import com.shyam.gujarat_police.entities.Police;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.ExcelService;
import com.shyam.gujarat_police.services.PoliceService;
import com.shyam.gujarat_police.util.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.File;
import java.io.IOException;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/police")
public class PoliceController {

    @Autowired
    private PoliceService policeService;

    @Autowired
    private ExcelService excelService;

    private static final Logger LOGGER = LoggerFactory.getLogger(PoliceController.class);


    @GetMapping("/")
    public APIResponse getAllPolice(){
        return APIResponse.ok(policeService.getAllPolice());
    }

    @GetMapping("/police-in-event/{id}")
    public APIResponse getAllPoliceInEvent(@NotNull @PathVariable Long id){
        return APIResponse.ok(policeService.getAllPoliceInEvent(id));
    }


    @PostMapping("/")
    public APIResponse savePolice(@RequestBody CreatePoliceDto police){
        Police savedPolice = policeService.savePolice(police);
        return APIResponse.ok(savedPolice);
    }

    @DeleteMapping("/{id}")
    public APIResponse deletePolice(@NotNull @PathVariable Long id){
        LOGGER.info("Delete " + id);
        policeService.deletePolice(id);
        return APIResponse.ok("Police was successfully deleted");
    }

    @PutMapping("/{policeId}")
    public APIResponse updatePolice(@RequestBody PoliceDto police,
                               @PathVariable("policeId") Long policeId){

        Police updatedPolice = policeService.updatePolice(police, policeId);
        return APIResponse.ok(updatedPolice);
    }

    @GetMapping("/{policeId}")
    public APIResponse readSpecific(@NotNull @PathVariable("policeId") Long policeId){
        Police police = policeService.readSpecific(policeId);
        return APIResponse.ok(police);
    }

    @GetMapping("/officer-data")
    public APIResponse officerData() throws JsonProcessingException {
        return policeService.officerData();
    }

    @PostMapping("/upload-from-excel")
    public APIResponse uploadFromExcel(@RequestParam("file") MultipartFile multiPartFile,
                                       @RequestParam("event-id") Long eventId) throws IOException {
        String message = "";
        System.out.println(eventId);
        if (!multiPartFile.isEmpty()) {
            File file = FileUtils.multipartToFile(multiPartFile, multiPartFile.getName());
            return policeService.uploadFromExcel(file, eventId);
        }
//            if (ExcelHelper.hasExcelFormat(file)){
//            int totalPoliceInserted = excelService.savePoliceFromExcel(file, eventId);
//            message = "Police Uploaded from Excel successfully " + totalPoliceInserted;
//            return APIResponse.ok(message);
//        }
        return APIResponse.error("Something went wrong");
    }

    @GetMapping("/count")
    public APIResponse countPolice() throws JsonProcessingException {
        return policeService.countPolice();
    }

    @GetMapping("/count-by-event/{event-id}")
    public APIResponse countPoliceByEvent(@NotNull @PathVariable("event-id") Long eventId) {
        return policeService.countPoliceByEvent(eventId);
    }

    @GetMapping("/download-sample-police-excel")
    public APIResponse downloadSamplePoliceExcel() {
        LOGGER.info("downloadSamplePoliceExcel");
        return APIResponse.ok(policeService.downloadSamplePoliceExcel());
    }
}

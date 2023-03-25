package com.shyam.gujarat_police.controllers;

import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.InternalPurposeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/internal_purpose")
public class InternalPurpose {

    @Autowired
    private InternalPurposeService internalPurposeService;

    @DeleteMapping("/assign-police/reset-event-police/{eventId}")
    public APIResponse deleteAssignmentsInEntireEvent(@PathVariable("eventId") Long eventId) {
        return internalPurposeService.deleteAssignmentsInEntireEvent(eventId);
    }

    @GetMapping("/parth")
    public APIResponse kuchtohDedeReBaba(){
        return APIResponse.ok("PArth variable");
    }
    @GetMapping("/downloadExcel")
    public ResponseEntity<Resource> downloadExcel() throws IOException {
        File file =  ResourceUtils.getFile("classpath:files/police_insert_demo.xlsx");;

        InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=police_insert_demo.xlsx");

        return ResponseEntity.ok()
                .headers(headers)
                .contentLength(file.length())
                .contentType(MediaType.parseMediaType("application/vnd.ms-excel"))
                .body(resource);
    }
}




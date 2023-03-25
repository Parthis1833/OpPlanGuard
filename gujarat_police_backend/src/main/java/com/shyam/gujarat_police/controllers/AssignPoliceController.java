package com.shyam.gujarat_police.controllers;

import com.shyam.gujarat_police.dto.request.*;
import com.shyam.gujarat_police.dto.response.EventPointPoliceAssignmentRespDto;
import com.shyam.gujarat_police.dto.response.EventPoliceAssignmentRespDto;
import com.shyam.gujarat_police.entities.AssignPolice;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.AssignPoliceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/assign-police")
public class AssignPoliceController {

    @Autowired
    private AssignPoliceService assignPoliceService;

    private static final Logger LOGGER = LoggerFactory.getLogger(AssignPoliceController.class);

    @GetMapping("/")
    public APIResponse getAllAssignedPolice(){
        LOGGER.info("getAllAssignedPolice");
        return APIResponse.ok(assignPoliceService.getAllAssignedPolice());
    }

    @PostMapping("/")
    public APIResponse saveAssignPolice(@RequestBody AssignPoliceDto assignPolice){
        LOGGER.info("saveAssignPolice");
        return APIResponse.error("depreciated");
//        AssignPolice dto = assignPoliceService.saveAssignPolice(assignPolice);
//        return APIResponse.ok(dto);
    }
    @PostMapping("/V2")
    public APIResponse saveAssignPoliceV2(@RequestBody AssignPoliceDto assignPolice){
        LOGGER.info("saveAssignPoliceV2");
        AssignPolice dto = assignPoliceService.saveAssignPoliceV2(assignPolice);
        return APIResponse.ok(dto);
    }

//    @PostMapping("/assign_police")
//    public APIResponse assignMultiplePolice(@RequestBody AssignMultiplePoliceDto dto){
//        APIResponse resp = assignPoliceService.assignMultiplePolice(dto);
//        return APIResponse.ok(resp);
//    }

    @PostMapping("/assign_multiple")
    public APIResponse saveAssignPoliceByPoliceIdList(@RequestBody AssignMultiplePoliceDto dto){
        LOGGER.info("saveAssignPoliceByPoliceIdList");
        return assignPoliceService.assignMultiplePolice(dto);

    }

    @GetMapping("/count-police-in-event")
    public APIResponse countPoliceInEvent(@RequestBody EventIdDto dto){
        LOGGER.info("countPoliceInEvent");
        Long respDto = assignPoliceService.countPoliceInEvent(dto);
        return APIResponse.ok(respDto);
    }

    @PostMapping("/count-police-in-point-event")
    public APIResponse countPoliceByEventAndPoint(@RequestBody EventAndPointIdDto dto){
        LOGGER.info("countPoliceByEventAndPoint");
        Long respDto = assignPoliceService.countPoliceByEventAndPoint(dto);
        return APIResponse.ok(respDto);
    }

    @PostMapping("/police-in-point-event")
    public APIResponse policeByEventAndPoint(@RequestBody EventAndPointIdDto dto){
        LOGGER.info("policeByEventAndPoint");
        EventPointPoliceAssignmentRespDto resp = assignPoliceService.policeByEventAndPoint(dto);
        return APIResponse.ok(resp);
    }

    @PostMapping("/police-in-event")
    public APIResponse policeByEvent(@RequestBody EventAndPointIdDto dto){
        LOGGER.info("policeByEvent");
        // when displaying the police we will automatically assign them
        if (dto.getEventId() == null){
            throw new DataNotFoundException("Please provide correct event");
        }
        assignAutomaticallyAllPoints(dto.getEventId());
        EventPoliceAssignmentRespDto resp = assignPoliceService.policeByEvent(dto);
        if(resp.getPointAssignments().size() > 0) {
            String filename = assignPoliceService.policeByEventExcel(resp);
            resp.setFileName(filename);
        } else {
            return APIResponse.error("No assignments were found");
        }
        return APIResponse.ok(resp);
    }

    @PostMapping("/police-in-event/excel")
    public APIResponse policeInEventInExcel(@RequestBody EventAndPointIdDto dto){
        LOGGER.info("policeInEventInExcel");
        // when displaying the police we will automatically assign them
        if (dto.getEventId() == null){
            throw new DataNotFoundException("Please provide correct event");
        }
//        assignAutomaticallyAllPoints(dto.getEventId());
        String resp = assignPoliceService.policeByEventExcel(dto);
        return APIResponse.ok(resp);
    }

    @PostMapping("by-designation")
    public APIResponse saveAssignPoliceByDesignation(@RequestBody AssignPoliceByDesignationCountDto dto){
        LOGGER.info("saveAssignPoliceByDesignation");
        List<AssignPolice> respDto = assignPoliceService.saveAssignPoliceByDesignation(dto);
        return APIResponse.ok(respDto);
    }

    @GetMapping("point-assignment")
    public APIResponse savePointAssignment(@RequestBody AssignPoliceDto dto){
        LOGGER.info("savePointAssignment");
//        List<Police> resp = assignPoliceService.pointEventLevelAssignment(dto);
        Object o = assignPoliceService.pointEventLevelAssignment(dto);
        return APIResponse.ok(o);
    }

    @GetMapping("assign_automatically_all_points/{eventId}")
    public APIResponse assignAutomaticallyAllPoints(@PathVariable("eventId") Long eventId){
        LOGGER.info("assignAutomaticallyAllPoints");
        return assignPoliceService.assignAutomaticallyAllPoints(eventId);
    }
}

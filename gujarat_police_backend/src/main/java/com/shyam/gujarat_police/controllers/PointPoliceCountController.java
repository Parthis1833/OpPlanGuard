package com.shyam.gujarat_police.controllers;


import com.shyam.gujarat_police.dto.request.EventAndPointIdDto;
import com.shyam.gujarat_police.dto.request.PointPoliceCountDto;
import com.shyam.gujarat_police.dto.response.EventPointPoliceAssignmentRespDto;
import com.shyam.gujarat_police.dto.response.EventPointPoliceCountAssignmentRespDto;
import com.shyam.gujarat_police.entities.PointPoliceCount;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.PointPoliceCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/point_police_count")
public class PointPoliceCountController {

    @Autowired
    PointPoliceCountService pointPoliceCountService;

    @GetMapping("/")
    public APIResponse getAllEventsPoliceCount(){
        List<PointPoliceCount> resp = pointPoliceCountService.getAllPointPoliceCount();
        return APIResponse.ok(resp);
    }

    //    @PostMapping("/")
//    public APIResponse saveEventPoliceCount(@RequestParam(value = "event-id") Long eventId, @RequestParam Map<Long, Long> designationCount){
    @RequestMapping(value="/",
            method= RequestMethod.POST)
    public APIResponse saveMultipleEventPoliceCount(@RequestBody Map<String,Object> body){
        List<PointPoliceCount> resp = pointPoliceCountService.saveMultiplePointPoliceCount(body);
        return APIResponse.ok(resp);
    }

    /**
     * Merging save & update code
     * */
    public APIResponse saveEventPoliceCountIndividual(@RequestBody PointPoliceCountDto dto){
        PointPoliceCount resp = pointPoliceCountService.savePointPoliceCountIndividual(dto, Boolean.TRUE);
        return APIResponse.ok(resp);
    }

    //    @PutMapping("/{eventPoliceCountId}")
//    public APIResponse updateEventPoliceCount(@RequestBody @Valid EventPoliceCountDto eventPoliceCount,
//                                   @PathVariable("eventPoliceCountId") Long eventPoliceCountId){
//        EventPoliceCount dto = eventPoliceCountService.updateEventPoliceCount(eventPoliceCount, eventPoliceCountId);
//        return APIResponse.ok(dto);
//    }
    @PutMapping("/")
    public APIResponse updateMultipleEventPoliceCount(@RequestBody Map<String,Object> body){
        List<PointPoliceCount> resp = pointPoliceCountService.updateMultiplePointPoliceCount(body);
        return APIResponse.ok(resp);
    }

    @DeleteMapping("/")
    public APIResponse deleteEventPoliceCount(@RequestBody EventAndPointIdDto dto){
        Long eventId = dto.getEventId();
        Long pointId = dto.getPointId();
        pointPoliceCountService.deletePointPoliceCount(eventId, pointId);
        return APIResponse.ok("all requirements for event " + eventId + " and point + " + pointId +" deleted successfully");
    }

//    @GetMapping("/{eventPoliceCountId}")
//    public APIResponse readSpecific(@PathVariable("eventPoliceCountId") Long eventPoliceCountId){
//        EventPoliceCount dto = eventPoliceCountService.readSpecific(eventPoliceCountId);
//        return APIResponse.ok(dto);
//    }

    @GetMapping("/event-and-point")
    public APIResponse readAllByEvent(@RequestBody EventAndPointIdDto dto){
//        Long eventId = dto.getEventId();
//        Long pointId = dto.getPointId();
//        List<PointPoliceCount> resp = pointPoliceCountService.readAllByEventAndPoint(eventId, pointId);
//        return APIResponse.ok(resp);
        return APIResponse.error("deprecated & need work on backend to reconstruct it.");
    }

    @PostMapping("/designation-counts")
    public APIResponse readAllByEventPointDesignationCountsAndEventName(@RequestBody EventAndPointIdDto dto){
        Long eventId = dto.getEventId();
        Long pointId = dto.getPointId();
        EventPointPoliceCountAssignmentRespDto resp = pointPoliceCountService.readAllByPointDesignationCountsAndEventName(eventId, pointId);
        return APIResponse.ok(resp);
    }

    @PostMapping("/all-point-designation-counts-in-event")
    public APIResponse readAllByEventDesignationCountsAndEventName(@RequestBody EventAndPointIdDto dto) {
        Long evenId = dto.getEventId();
        List<EventPointPoliceCountAssignmentRespDto> resp = pointPoliceCountService.readAllPointAssignmentsInEvent(evenId);
        return APIResponse.ok(resp);
    }

    @PostMapping("/save-update")
    public APIResponse reAssignPolice(@RequestBody EventPointPoliceCountAssignmentRespDto dto) {
        pointPoliceCountService.reAssignInPointOfEvent(dto);
        return APIResponse.ok();
    }
//    @GetMapping("/assignments")
//    public APIResponse readAllInAssignmentFormat(){
//        List<EventPoliceCountAssignmentRowDto> resp = pointPoliceCountService.readAllInAssignmentFormat();
//        return APIResponse.ok(resp);
//    }
}

package com.shyam.gujarat_police.controllers;


import com.shyam.gujarat_police.entities.Zone;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.ZoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/zone")
public class ZoneController {

    @Autowired
    ZoneService zoneService;

    @GetMapping("/")
    public APIResponse getAllZones(){
        List<Zone> resp = zoneService.getAllZones();
        return APIResponse.ok(resp);
    }

    @PostMapping("/")
    public APIResponse saveZone(@RequestBody @Valid Zone zone){
        Zone dto = zoneService.saveZone(zone);
        return APIResponse.ok(dto);
    }

    @PutMapping("/{zoneId}")
    public APIResponse updateZone(@RequestBody @Valid Zone zone,
                                              @PathVariable("zoneId") Long zoneId){
        Zone dto = zoneService.updateZone(zone, zoneId);
        return APIResponse.ok(dto);
    }

    @DeleteMapping("/{zoneId}")
    public APIResponse deleteZone(@PathVariable("zoneId") Long zoneId){
        zoneService.deleteZone(zoneId);
        return APIResponse.ok("Event deleted successfully with id " + zoneId);
    }

    @GetMapping("/{zoneId}/")
    public APIResponse readSpecific(@PathVariable("zoneId") Long zoneId){
        Zone dto = zoneService.readSpecifiZone(zoneId);
        return APIResponse.ok(dto);
    }
}

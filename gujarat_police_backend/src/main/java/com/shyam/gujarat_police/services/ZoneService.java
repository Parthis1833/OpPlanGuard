package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.entities.Zone;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.exceptions.DataSavingException;
import com.shyam.gujarat_police.repositories.ZoneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class ZoneService {
    @Autowired
    private ZoneRepository zoneRepository;

    public List<Zone> getAllZones() {
        return zoneRepository.findAll();
    }

    public Zone saveZone(Zone zone) {
        Optional<Zone> optionalZone = zoneRepository.findByName(zone.getName());
        if (optionalZone.isPresent()) {
            throw new DataSavingException("Data already exists for zone " + zone.getName());
        }
        return zoneRepository.save(zone);
    }

    public Zone updateZone(Zone zone, Long zoneId) {
        if (Objects.isNull(zoneId)){
            throw new DataNotFoundException("zone id not found with id " + zoneId);
        }
        Optional<Zone> optionalZone = zoneRepository.findById(zoneId);
        if (optionalZone.isEmpty()) {
            throw new DataNotFoundException("Zone id not found with id " + zoneId);
        } else {
            Zone obtainedZone = optionalZone.get();
            obtainedZone.setName(zone.getName());
            return zoneRepository.save(obtainedZone);
        }
    }

    public void deleteZone(Long zoneId) {
        zoneRepository.deleteById(zoneId);
    }

    public Zone readSpecifiZone(Long zoneId) {
        return zoneRepository.findById(zoneId)
                .orElseThrow(()-> new DataNotFoundException("Zone not found with id : " + zoneId ));
    }
}

package com.shyam.gujarat_police.services.impl;

import com.shyam.gujarat_police.repositories.AssignPoliceRepository;
import com.shyam.gujarat_police.repositories.PoliceRepository;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.services.InternalPurposeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InternalPurposeServiceImpl implements InternalPurposeService {

    @Autowired
    private AssignPoliceRepository assignPoliceRepository;

    @Autowired
    private PoliceRepository policeRepository;


    @Override
    public APIResponse deleteAssignmentsInEntireEvent(Long eventId) {
        int deletedAssignmentCount = assignPoliceRepository.deleteByEventId(eventId);
        int updatedPoliceCount = policeRepository.unAssignFromEventId(eventId);

        return APIResponse.ok("total deleted assignments " + deletedAssignmentCount + " & updated police to unassigned " + updatedPoliceCount);
    }
}

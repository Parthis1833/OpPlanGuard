package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.dto.request.DesignationCountDto;
import com.shyam.gujarat_police.dto.response.DesignationCountRespDto;
import com.shyam.gujarat_police.entities.Police;

import java.util.Date;
import java.util.List;

public interface AssignPoliceBaseRepository {
    List<Police> findFreePoliceOrNotAssigned(Date eventDate);

    List<Police> findFreePoliceOrNotAssignedByDesignation(DesignationCountDto designationCountDto);

    boolean isPoliceAssigned(Long id, Date dutyStartDate, Long id1);

    void removeAssignedPoliceFromPointInEvent(Long eventId, Long pointId);
}

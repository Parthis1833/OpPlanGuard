package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.dto.request.PoliceDto;
import com.shyam.gujarat_police.dto.response.DesignationCountRespDto;
import com.shyam.gujarat_police.entities.Police;

import java.util.List;

public interface PoliceBaseRepository {
    boolean isPoliceExists(Police station);

    List<DesignationCountRespDto> getFreePoliceMappingByDesignation(Long eventId);
}

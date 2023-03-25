package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.dto.request.DesignationDto;
import com.shyam.gujarat_police.dto.request.EventIdAndSearchKeyWordDto;
import com.shyam.gujarat_police.dto.request.EventPoliceCountDto;
import com.shyam.gujarat_police.dto.request.PoliceIdNameDesigNumDto;
import com.shyam.gujarat_police.dto.request.PoliceNameIdDto;
import com.shyam.gujarat_police.dto.response.DesignationCountRespDto;
import com.shyam.gujarat_police.dto.response.EventAssignmentByDesignationCountsDto;
import com.shyam.gujarat_police.dto.response.EventPoliceCountAssignmentRowDto;
import com.shyam.gujarat_police.entities.Designation;
import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.entities.EventPoliceCount;
import com.shyam.gujarat_police.entities.Police;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.exceptions.DataSavingException;
import com.shyam.gujarat_police.repositories.EventPoliceCountRepository;
import com.shyam.gujarat_police.repositories.PoliceRepository;
import com.shyam.gujarat_police.util.CollectionUtil;
import com.shyam.gujarat_police.util.TextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@Service
public class EventPoliceCountService {

    @Autowired
    private EventPoliceCountRepository eventPoliceCountRespository;

    @Autowired
    private DesignationService designationService;

    @Autowired
    private EventService eventService;

    @Autowired
    private PoliceRepository policeRepository;

    public List<EventPoliceCount> getAllEventPoliceCount() {
        return (List<EventPoliceCount>) eventPoliceCountRespository.findAll();
    }

    /**
     * isSave boolean flag is used when saving is required other wise the method will act as an conversion
     * which will not save but return dto to model object
     */
    public EventPoliceCount saveEventPoliceCountIndividual(EventPoliceCountDto dto, Boolean isSave) {
        // check event exists
        // check designation exists
        designationService.getDesignationById(dto.getDesignationId());
        Event event = eventService.readSpecific(dto.getEventId());

        // TODO:event validation check in eventPoliceCount, if exists then data already there please try update methood

        EventPoliceCount eventPoliceCount = new EventPoliceCount();
        eventPoliceCount.setDesignationCount(dto.getDesignationCount());
        eventPoliceCount.setEvent(event);
        eventPoliceCount.setDesignationId(dto.getDesignationId());

        if (isSave){
            return eventPoliceCountRespository.save(eventPoliceCount);
        } else {
            return eventPoliceCount;
        }
    }

    // update code for individual eventPoliceCount, we need for entire event so making another code.
//    public EventPoliceCount updateEventPoliceCount(EventPoliceCountDto dto, Long eventPoliceCountId) {
//        if (Objects.isNull(eventPoliceCountId)){
//            throw new DataNotFoundException("EventPoliceCount id not found with id " + eventPoliceCountId);
//        }
//        Optional<EventPoliceCount> optionalEventPoliceCount = eventPoliceCountRespository.findById(eventPoliceCountId);
//        if (optionalEventPoliceCount.isEmpty()) {
//            throw new DataNotFoundException("EventPoliceCount not found with id " + eventPoliceCountId);
//        } else {
//            EventPoliceCount obtainedObj = optionalEventPoliceCount.get();
//
//            // check event exists
//            // check designation exists
//            designationService.getDesignationById(dto.getDesignationId());
//            Event event = eventService.readSpecific(dto.getEventId());
//
//            obtainedObj.setDesignationCount(dto.getDesignationCount());
//            obtainedObj.setDesignationId(dto.getDesignationId());
//            obtainedObj.setEvent(event);
//            return eventPoliceCountRespository.save(obtainedObj);
//        }
//    }

    public void deleteEventPoliceCount(Long eventPoliceCountId) {
        eventPoliceCountRespository.deleteById(eventPoliceCountId);
    }

    public EventPoliceCount readSpecific(Long eventPoliceCountId) {
        return eventPoliceCountRespository.findById(eventPoliceCountId)
                .orElseThrow(()-> new DataNotFoundException("EventPoliceCount not found with id: " + eventPoliceCountId) );
    }

    public List<EventPoliceCount> saveMultipleEventPoliceCount(Map<String, Object> body) {
        List<EventPoliceCount> resp = new ArrayList<>();

        Event event = eventService.readSpecific(Long.valueOf(body.get("event-id").toString()));
        Map<String, String> designationCounts = (Map<String, String>) body.get("designations");
        // TODO:event validation check in eventPoliceCount, if exists then data already there please try update methood
        boolean isEventAllocationExists = eventPoliceCountRespository.getAllByEvent(event.getId()).size() > 0;

        // data already exists
        if (isEventAllocationExists){
            throw new DataSavingException("Data already exists for event " + event.getEventName() + " try updating the event");
        }

        for (Map.Entry<String, String> designationCount : designationCounts.entrySet()){
            Long designationId = Long.parseLong(designationCount.getKey());
            Integer count = Integer.parseInt(designationCount.getValue());
            EventPoliceCountDto dto = new EventPoliceCountDto();
            dto.setEventId(event.getId());
            dto.setDesignationId(designationId);
            dto.setDesignationCount(count);
            EventPoliceCount eventPoliceCount = saveEventPoliceCountIndividual(dto, Boolean.FALSE);
            resp.add(eventPoliceCount);
        }
        return (List<EventPoliceCount>) CollectionUtil.makeCollection(eventPoliceCountRespository.saveAll(resp));
    }

    public List<EventPoliceCount> updateMultipleEventPoliceCount(Map<String, Object> body) {
        List<EventPoliceCount> resp = new ArrayList<>();

        Event event = eventService.readSpecific(Long.valueOf(body.get("event-id").toString()));
        Map<String, String> designationCounts = (Map<String, String>) body.get("designations");
        List<EventPoliceCount> eventPoliceCounts = eventPoliceCountRespository.getAllByEvent(event.getId());

        // if designation id exists then update, otherwise add.
        for (Map.Entry<String, String> designationCount : designationCounts.entrySet()){
            Long designationId = Long.parseLong(designationCount.getKey());
            Integer count = Integer.parseInt(designationCount.getValue());

            EventPoliceCountDto dto = new EventPoliceCountDto();
            dto.setEventId(event.getId());
            dto.setDesignationId(designationId);
            dto.setDesignationCount(count);
            EventPoliceCount eventPoliceCount = saveEventPoliceCountIndividual(dto, Boolean.FALSE);
            boolean isDesignationPreviouslyExists = false;
            for(EventPoliceCount oldEventPoliceCount : eventPoliceCounts){
                if (Objects.equals(oldEventPoliceCount.getDesignationId(), designationId)){
                    isDesignationPreviouslyExists = true;
                    oldEventPoliceCount.setDesignationCount(count);
                    resp.add(oldEventPoliceCount);
                }
            }
            if (!isDesignationPreviouslyExists){
                resp.add(eventPoliceCount);
            }
        }
        return (List<EventPoliceCount>) CollectionUtil.makeCollection(eventPoliceCountRespository.saveAll(resp));
    }

    public List<EventPoliceCount> readAllByEvent(Long eventId) {
        // check event exists
        Event event = eventService.readSpecific(eventId);
        // check if data exists
        List<EventPoliceCount> data = eventPoliceCountRespository.getAllByEvent(eventId);
        if (data.size() == 0) {
            throw new DataNotFoundException("No data found for event " + event.getEventName());
        } else {
            return data;
        }
    }

    public EventPoliceCountAssignmentRowDto readAllByEventDesignationCountsAndEventName(Long eventId) {
        // check event exists
        Event event = eventService.readSpecific(eventId);
        // check if data exists
        List<EventPoliceCount> data = eventPoliceCountRespository.getAllByEvent(eventId);
        if (data.size() == 0) {
            throw new DataNotFoundException("No data found for event " + event.getEventName());
        }
        EventPoliceCountAssignmentRowDto resp = new EventPoliceCountAssignmentRowDto();
        resp.setEventId(eventId);
        resp.setEventName(event.getEventName());
        List<DesignationCountRespDto> designationCountRespDtos = new ArrayList<>();
        data.forEach(eventPoliceCount -> {
            DesignationCountRespDto dto = new DesignationCountRespDto();
            dto.setDesignationId(eventPoliceCount.getDesignationId());
            dto.setDesignationName(designationService.getDesignationById(eventPoliceCount.getDesignationId()).getName());
            dto.setDesignationCount(eventPoliceCount.getDesignationCount());
            designationCountRespDtos.add(dto);
        });
        resp.setAssignments(designationCountRespDtos);
        return resp;
    }

    public List<EventPoliceCountAssignmentRowDto> readAllInAssignmentFormat() {
        List<Long> eventIds = eventPoliceCountRespository.getAllEventIds();
        List<EventPoliceCountAssignmentRowDto> rows = new ArrayList<>();
        eventIds.forEach(id -> {
            EventPoliceCountAssignmentRowDto row = readAllByEventDesignationCountsAndEventName(id);
            rows.add(row);
        });
        return rows;
    }

    public List<PoliceNameIdDto> getUnassignedPoliceInEvent(Long eventId) {
        List<Police> unassinedPolice = policeRepository.getUnassignedPoliceInEvent(eventId);
        return unassinedPolice.stream().map(p -> {
            PoliceNameIdDto policeNameIdDto = new PoliceNameIdDto();
            policeNameIdDto.setPoliceId(p.getId());
            policeNameIdDto.setPoliceName(p.getFullName());
            return policeNameIdDto;
        }).collect(Collectors.toList());
//        sout
    }

    public List<PoliceIdNameDesigNumDto> getUnassignedPoliceBySearchWithDetailsInEvent(EventIdAndSearchKeyWordDto dto) {
        List<Police> unassinedPolice = new ArrayList<>();
        if (TextUtils.notBlankNotEmpty(dto.getSearchPoliceName())){
            unassinedPolice = policeRepository.getUnassignedPoliceBySearchInEvent(dto.getEventId(), dto.getSearchPoliceName());
        } else {
            unassinedPolice = policeRepository.getUnassignedPoliceInEvent(dto.getEventId());
        }
        return unassinedPolice.stream().map(p -> {
            PoliceIdNameDesigNumDto resp = new PoliceIdNameDesigNumDto();
            resp.setPoliceId(p.getId());
            resp.setPoliceName(p.getFullName());
            resp.setPoliceDesignation(p.getDesignation().getName());
            resp.setPoliceDistrict(p.getDistrict());
            resp.setPoliceNumber(p.getNumber());
            return resp;
        }).collect(Collectors.toList());
    }
    public List<EventAssignmentByDesignationCountsDto> getPoliceCountInEventByDesignation(Long eventId) {
        List<DesignationDto> allDesignations = designationService.getAllDesignations();
        return allDesignations.stream().map(designation -> {
            Optional<EventPoliceCount> optAskedCount = eventPoliceCountRespository.getByEventIdAndDesignationId(eventId, designation.getId());
            EventAssignmentByDesignationCountsDto dto = new EventAssignmentByDesignationCountsDto();
            AtomicInteger assignedPoliceCount = new AtomicInteger();
            AtomicInteger totalPoliceCount = new AtomicInteger();
            List<Police> allPoliceInEvent = policeRepository.getPoliceByEventIdAndDesignation(eventId, designation.getId());
            allPoliceInEvent.forEach(police -> {
                if (police.isAssigned()) { assignedPoliceCount.getAndIncrement(); }
                totalPoliceCount.getAndIncrement();
            });
            dto.setDesignationId(designation.getId());
            dto.setAssignedCount(assignedPoliceCount.get());
            dto.setTotalPoliceCount(totalPoliceCount.get());
            dto.setName(designation.getName());
            dto.setNameInGujarati(designation.getNameInGujarati());
            optAskedCount.ifPresent(eventPoliceCount -> dto.setTotalAskedCount(eventPoliceCount.getDesignationCount() == null ? 0 : eventPoliceCount.getDesignationCount()));
            return dto;
        }).collect(Collectors.toList());
    }

}

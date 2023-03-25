package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.dto.request.AssignPoliceDto;
import com.shyam.gujarat_police.dto.request.DesignationDto;
import com.shyam.gujarat_police.dto.request.PointPoliceCountDto;
import com.shyam.gujarat_police.dto.response.DesignationCountRespDto;
import com.shyam.gujarat_police.dto.response.EventPointPoliceCountAssignmentRespDto;
import com.shyam.gujarat_police.dto.response.EventPoliceCountAssignmentRowDto;
import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.entities.Point;
import com.shyam.gujarat_police.entities.PointPoliceCount;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.exceptions.DataSavingException;
import com.shyam.gujarat_police.exceptions.InsufficientDataException;
import com.shyam.gujarat_police.repositories.AssignPoliceRepository;
import com.shyam.gujarat_police.repositories.PointPoliceCountRepository;
import com.shyam.gujarat_police.repositories.PoliceRepository;
import com.shyam.gujarat_police.util.CollectionUtil;
import com.shyam.gujarat_police.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.stream.Collectors;

@Service
public class PointPoliceCountService {
    
    @Autowired
    private EventService eventService;
    
    @Autowired
    private PointService pointService;
    
    @Autowired
    private DesignationService designationService;
    
    @Autowired
    private PointPoliceCountRepository pointPoliceCountRepository;

    @Autowired
    private AssignPoliceRepository assignPoliceRepository;

    @Lazy
    @Autowired
    private AssignPoliceService assignPoliceService;

    @Autowired
    private PoliceRepository policeRepository;

    private static final Logger LOGGER = LoggerFactory.getLogger(PointPoliceCountService.class);


    public List<PointPoliceCount> getAllPointPoliceCount() {
        return (List<PointPoliceCount>) pointPoliceCountRepository.findAll();
    }

    public List<PointPoliceCount> getAllPointCountsByEvent(Long eventId) {
        return pointPoliceCountRepository.findByEventId(eventId);
    }
    public PointPoliceCount savePointPoliceCountIndividual(PointPoliceCountDto dto, Boolean isSave) {
        // check event exists
        // check designation exists
        // check point exists
        designationService.getDesignationById(dto.getDesignationId());
        eventService.readSpecific(dto.getEventId());
        
        PointPoliceCount pointPoliceCount = new PointPoliceCount();
        pointPoliceCount.setDesignationCount(dto.getDesignationCount());
        pointPoliceCount.setEventId(dto.getEventId());
        pointPoliceCount.setDesignationId(dto.getDesignationId());
        pointPoliceCount.setPointId(dto.getPointId());
        
        if (isSave) {
            return pointPoliceCountRepository.save(pointPoliceCount);
        } else {
            return pointPoliceCount;
        }
    }


    public List<PointPoliceCount> saveMultiplePointPoliceCount(Map<String, Object> body) {
        List<PointPoliceCount> resp = new ArrayList<>();
        Event event = eventService.readSpecific(Long.valueOf(body.get("event-id").toString()));
        Point point = pointService.readSpecific(Long.valueOf(body.get("point-id").toString()));
        Map<String, String> designationCounts = (Map<String, String>) body.get("designations");

        // TODO:event and point validation check in pointPoliceCount, if exists then data already there please try update methood
        boolean isEventAndPointAllocationExists = pointPoliceCountRepository.checkEventAndPointAllocationExists(event.getId(), point.getId());

        // data already exists
        if (isEventAndPointAllocationExists){
            throw new DataSavingException("Data already exists for event " + event.getEventName() + " try updating the event's point allocation of point name " + point.getPointName());
        }

        for (Map.Entry<String, String> designationCount : designationCounts.entrySet()) {
            Long designationId = Long.parseLong(designationCount.getKey());
            Integer count = Integer.parseInt(designationCount.getValue());
            PointPoliceCountDto dto = new PointPoliceCountDto();
            dto.setEventId(event.getId());
            dto.setDesignationId(designationId);
            dto.setDesignationCount(count);
            dto.setPointId(point.getId());
            if (dto.getDesignationCount() > 0) {
                PointPoliceCount pointPoliceCount = savePointPoliceCountIndividual(dto, Boolean.FALSE);
                resp.add(pointPoliceCount);
            }
        }
        return (List<PointPoliceCount>) CollectionUtil.makeCollection(pointPoliceCountRepository.saveAll(resp));
    }

    public List<PointPoliceCount> updateMultiplePointPoliceCount(Map<String, Object> body) {
        List<PointPoliceCount> resp = new ArrayList<>();
        Event event = eventService.readSpecific(Long.valueOf(body.get("event-id").toString()));
        Point point = pointService.readSpecific(Long.valueOf(body.get("point-id").toString()));
        Map<String, String> designationCounts = (Map<String, String>) body.get("designations");
        List<PointPoliceCount> pointPoliceCounts = pointPoliceCountRepository.getAllByEventAndPointId(event.getId(), point.getId());

        // if designation id exists then update, otherwise add.
        for (Map.Entry<String, String> designationCount : designationCounts.entrySet()){
            Long designationId = Long.parseLong(designationCount.getKey());
            Integer count = Integer.parseInt(designationCount.getValue());

            PointPoliceCountDto dto = new PointPoliceCountDto();
            dto.setEventId(event.getId());
            dto.setDesignationId(designationId);
            dto.setDesignationCount(count);
            dto.setPointId(point.getId());
            PointPoliceCount pointPoliceCount = savePointPoliceCountIndividual(dto, Boolean.FALSE);
            boolean isDesignationPreviouslyExists = false;

            for(PointPoliceCount oldPointPoliceCount : pointPoliceCounts){
                if(Objects.equals(oldPointPoliceCount.getDesignationId(), designationId)){
                    isDesignationPreviouslyExists = true;
                    oldPointPoliceCount.setDesignationCount(count);
                    resp.add(oldPointPoliceCount);
                }
            }
            if(!isDesignationPreviouslyExists){
                resp.add(pointPoliceCount);
            }
        }
        return (List<PointPoliceCount>) CollectionUtil.makeCollection(pointPoliceCountRepository.saveAll(resp));
    }

    public void deletePointPoliceCount(Long eventId, Long pointId) {
        List<PointPoliceCount> pointPoliceCountList = pointPoliceCountRepository.getAllByEventAndPointId(eventId, pointId);
        pointPoliceCountRepository.deleteAll(pointPoliceCountList);
    }

    public List<PointPoliceCount> readAllByEventAndPoint(Long eventId, Long pointId) {
        return null;
    }

    public EventPointPoliceCountAssignmentRespDto readAllByPointDesignationCountsAndEventName(Long eventId, Long pointId) {
        Event event = eventService.readSpecific(eventId);
        Point point = pointService.readSpecific(pointId);
        List<PointPoliceCount> data = pointPoliceCountRepository.getAllByEventAndPointId(eventId, pointId);
        List<DesignationDto> allDesignations = designationService.getAllDesignations();
//        if (data.size() == 0) {
//            throw new DataNotFoundException("No data found for event " + event.getEventName() + " with point " + point.getPointName());
//        }
        EventPointPoliceCountAssignmentRespDto resp = new EventPointPoliceCountAssignmentRespDto();
        resp.setEventId(eventId);
        resp.setPointId(pointId);
        List<DesignationCountRespDto> designationCountRespDtos = new ArrayList<>();
        allDesignations.stream().forEach(d -> {
            DesignationCountRespDto dto = new DesignationCountRespDto();

            if (CollectionUtil.nonNullNonEmpty(data)){
                PointPoliceCount ppc = data.stream().filter(p -> p.getDesignationId().equals(d.getId())).findAny().orElse(null);
                dto.setDesignationCount(ppc != null ? ppc.getDesignationCount() : 0);
            } else {
                // make designation count 0
                dto.setDesignationCount(0);
            }
            dto.setDesignationId(d.getId());
            dto.setDesignationName(d.getName());
            designationCountRespDtos.add(dto);
        });
//        data.forEach( pointPoliceCount -> {
//            DesignationCountRespDto dto = new DesignationCountRespDto();
//            dto.setDesignationId(pointPoliceCount.getDesignationId());
//            dto.setDesignationName(designationService.getDesignationById(pointPoliceCount.getDesignationId()).getName());
//            dto.setDesignationCount(pointPoliceCount.getDesignationCount());
//            designationCountRespDtos.add(dto);
//        });
        resp.setAssignments(designationCountRespDtos.stream().sorted(Comparator.comparing(DesignationCountRespDto::getDesignationId)).collect(Collectors.toList()));
        resp.setEventName(event.getEventName());
        resp.setPointName(point.getPointName());
        return resp;
//        return null;
    }

    public List<EventPoliceCountAssignmentRowDto> readAllInAssignmentFormat() {
        return null;
    }

    public List<EventPointPoliceCountAssignmentRespDto> getAllPointPoliceCountForEvent(Long eventId) {
        List<Long> pointsInEvent = pointPoliceCountRepository.getAllPointIdsForEvent(eventId);
        List<EventPointPoliceCountAssignmentRespDto> eventAssignmentList = new ArrayList<>();
        pointsInEvent.stream().forEach(point -> {
            EventPointPoliceCountAssignmentRespDto dto = readAllByPointDesignationCountsAndEventName(eventId, point);
            eventAssignmentList.add(dto);
        });
        return eventAssignmentList;
    }

    public List<EventPointPoliceCountAssignmentRespDto> readAllPointAssignmentsInEvent(Long evenId) {
        List<Long> pointsInEvent = pointPoliceCountRepository.getAllPointIdsForEvent(evenId);
        return pointsInEvent.stream().map(pointId->readAllByPointDesignationCountsAndEventName(evenId, pointId)).collect(Collectors.toList());
    }

    /**
     * @Description deletes existing assigned police and reassign new police
     * if requested police <= existing free(police) + assigned(assigned_police)
     * */
    public void reAssignInPointOfEvent(EventPointPoliceCountAssignmentRespDto dto) {
        if (dto.getEventId() == null || dto.getPointId() == null) {
            throw new DataNotFoundException("Event id or point id not provided");
        }
//        /** validating edge case: only zeros provided? */
//        AtomicBoolean invalidInput = new AtomicBoolean(true);
//        dto.getAssignments().stream().forEach(assignment -> {
//            if (assignment.getDesignationCount() > 0) {
//                invalidInput.set(false);
//            }
//        });
//        if (invalidInput.get()) throw new InsufficientDataException("Data missing in assignment, please provided valid assignment");

        /** validating event and point exists */
        Point point = pointService.readSpecific(dto.getPointId());
        Event event = eventService.readSpecific(dto.getEventId());

        List<DesignationCountRespDto> totalFreePolice = policeRepository.getFreePoliceMappingByDesignation(dto.getEventId());
        List<PointPoliceCount> totalRequestedPolice = pointPoliceCountRepository.getAllByEventAndPointId(dto.getEventId(), dto.getPointId());
        Map<String, String> designationCounts = new HashMap();

        /** Validating sufficient police */
        dto.getAssignments().stream().forEach(requested -> {
            int freePoliceOfDesignation = totalFreePolice.stream().filter(t->t.getDesignationId().equals(requested.getDesignationId())).map(DesignationCountRespDto::getDesignationCount).findAny().orElse(0);
            int assignedPoliceOfDesignation = totalRequestedPolice.stream().filter(t->t.getDesignationId().equals(requested.getDesignationId())).map(t->t.getDesignationCount()).findAny().orElse(0);

            if ( requested.getDesignationCount() > (assignedPoliceOfDesignation + freePoliceOfDesignation)) {
                System.out.println(freePoliceOfDesignation + " " + assignedPoliceOfDesignation + " " + requested.getDesignationCount());
                throw new InsufficientDataException("Insufficient Police with designation : " + requested.getDesignationName());
            }
            designationCounts.put(requested.getDesignationId().toString(), requested.getDesignationCount().toString());
        });

        assignPoliceRepository.removeAssignedPoliceFromPointInEvent(dto.getEventId(), dto.getPointId());
        Map<String, Object> param = new HashMap<>();
        param.put("designations", designationCounts);
        param.put("event-id", dto.getEventId());
        param.put("point-id", dto.getPointId());
        /** saving in records table */
        saveMultiplePointPoliceCount(param);

        AssignPoliceDto param2 = new AssignPoliceDto();
        param2.setDutyStartDate(DateUtil.dateToISTString(event.getEventStartDate(), "dd/MM/yyyy"));
        param2.setDutyEndDate(DateUtil.dateToISTString(event.getEventEndDate(), "dd/MM/yyyy"));
        param2.setAssignedDate(DateUtil.dateToISTString(new Date(), "dd/MM/yyyy"));
        param2.setEventId(event.getId());
        param2.setPointId(point.getId());

        /** assiging in the point as per updated record*/
        assignPoliceService.pointEventLevelAssignment(param2);
    }

    public void incrementDesignationCountByAssignedPolice(Long eventId, Long pointId, Map<Long, Integer> designationCount) {
        LOGGER.info("incrementDesignationCountByAssignedPolice");
        System.out.println(designationCount);
        List<PointPoliceCount> existingCounts = pointPoliceCountRepository.getAllByEventAndPointId(eventId, pointId);
//        existingCounts.forEach(e -> {
//            Integer count = designationCount.get(e.getDesignationId());
//            if (count != null) {
//                e.setDesignationCount(e.getDesignationCount() + count);
//            }
//        });
        List<PointPoliceCount> finalExistingCounts = existingCounts;
        existingCounts = designationCount.entrySet().stream().map(d -> {
            PointPoliceCount ppc = finalExistingCounts.stream().filter(e->e.getDesignationId() == d.getKey()).findAny().orElse(new PointPoliceCount());
            ppc.setPointId(pointId);
            ppc.setEventId(eventId);
            if (ppc.getDesignationCount() == null) {
                ppc.setDesignationId(d.getKey());
                ppc.setDesignationCount(0);
            }
            ppc.setDesignationCount(ppc.getDesignationCount() + d.getValue());
            return ppc;
        }).filter(e -> e.getDesignationCount() > 0).collect(Collectors.toList());
        System.out.println(existingCounts);
        pointPoliceCountRepository.saveAll(existingCounts);
    }
}

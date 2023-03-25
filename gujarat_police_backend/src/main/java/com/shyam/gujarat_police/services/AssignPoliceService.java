package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.dto.request.*;
import com.shyam.gujarat_police.dto.response.*;
import com.shyam.gujarat_police.entities.*;
import com.shyam.gujarat_police.exceptions.*;
import com.shyam.gujarat_police.io.write.AssignedPoliceInEventWriter;
import com.shyam.gujarat_police.io.write.ExportWriterFactory;
import com.shyam.gujarat_police.repositories.AssignPoliceRepository;
import com.shyam.gujarat_police.repositories.PoliceRepository;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.util.CollectionUtil;
import com.shyam.gujarat_police.util.DateUtil;
import com.shyam.gujarat_police.util.FileUtils;
import ma.glasnost.orika.MapperFacade;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@Service
public class AssignPoliceService {

    @Autowired
    private AssignPoliceRepository assignPoliceRepository;

    @Autowired
    private PoliceService policeService;

    @Autowired
    private PointService pointService;

    @Autowired
    private EventService eventService;

    @Autowired
    private DesignationService designationService;

    @Autowired
    private PointPoliceCountService pointPoliceCountService;

    @Autowired
    private PoliceRepository policeRepository;

    @Autowired
    private ModelMapper mapper;

    private static final Logger LOGGER = LoggerFactory.getLogger(AssignPoliceService.class);



    public List<AssignPolice> getAllAssignedPolice() {
        return (List<AssignPolice>) assignPoliceRepository.findAll();
    }

    public AssignPolice saveAssignPolice(AssignPoliceDto dto) {
        // if exists police, point and event.
        Police police = policeService.readSpecific(dto.getPoliceId());
        Point point = pointService.readSpecific(dto.getPointId());
        Event event = eventService.readSpecific(dto.getEventId());
        if (Objects.nonNull(police)
                && Objects.nonNull(point)
                && Objects.nonNull(event)) {
            AssignPolice assignPolice = new AssignPolice();
            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getAssignedDate())) {
                assignPolice.setAssignedDate(DateUtil.stringToDate("dd/MM/yyyy", dto.getAssignedDate()));
            }
            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getDutyStartDate())) {
                assignPolice.setDutyStartDate(DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyStartDate()));
            }
            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getDutyEndDate())) {
                assignPolice.setDutyEndDate(DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyEndDate()));
            }

            assignPolice.setPolice(police);
            assignPolice.setPoint(point);
            assignPolice.setEvent(event);
            if (!isPoliceAssigned(assignPolice)){
                policeRepository.updatePoliceAssignStatusAssigned(List.of(police.getId()));
                return assignPoliceRepository.save(assignPolice);
            } else {
                 throw new PoliceAlreadyAssignedException("Police already assigned");
            }
        } else {
            throw new DataSavingException("Could not save assigned police information with police id " + dto.getPoliceId());
        }

    }

    /*
    * used to assign individual police.
    * */
    public AssignPolice saveAssignPoliceV2(AssignPoliceDto dto) {
        List<Event> eventsBetweenGivenEvent = eventService.getEventsBetweenGivenEvent(dto.getEventId());
        List<Long> eventIds = eventsBetweenGivenEvent.stream().map(Event::getId).toList();
        // if exists police, point and event.
        Police police = policeService.readSpecific(dto.getPoliceId());
        Point point = pointService.readSpecific(dto.getPointId());
        Event event = eventService.readSpecific(dto.getEventId());
        if (Objects.nonNull(police)
                && Objects.nonNull(point)
                && Objects.nonNull(event)) {
            AssignPolice assignPolice = new AssignPolice();
            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getAssignedDate())) {
                assignPolice.setAssignedDate(DateUtil.stringToDate("dd/MM/yyyy", dto.getAssignedDate()));
            }
            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getDutyStartDate())) {
                Calendar cal = Calendar.getInstance(); // creates calendar
                cal.setTime(DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyStartDate()));               // sets calendar time/date
                cal.add(Calendar.HOUR_OF_DAY, 6);      // adds one hour
                assignPolice.setDutyStartDate(cal.getTime());
            }
            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getDutyEndDate())) {
                assignPolice.setDutyEndDate(DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyEndDate()));
            }

            // check if duty dates is in range of event date.
            if (!(event.getEventStartDate().before(assignPolice.getDutyStartDate()) && event.getEventEndDate().after(assignPolice.getDutyEndDate()))) {
                throw new DateMisMatchException("Date is not in range of event date : " + event.getEventStartDate() + " : " + event.getEventEndDate() + " police assignment dates : " + assignPolice.getDutyStartDate() + " " + assignPolice.getDutyEndDate());
            }

            assignPolice.setPolice(police);
            assignPolice.setPoint(point);
            assignPolice.setEvent(event);

            if (!isPoliceAssignedV2(assignPolice, eventIds)){
                System.out.println(eventsBetweenGivenEvent);
                return assignPoliceRepository.save(assignPolice);
//                return assignPolice;
            } else {
                throw new PoliceAlreadyAssignedException("Police already assigned");
            }
        } else {
            throw new DataSavingException("Could not save assigned police information with police id " + dto.getPoliceId());
        }
    }


    public AssignPolice updateAssignPolice(AssignPolice assignPolice, Long assignPoliceId) {
        if (Objects.isNull(assignPoliceId)) {
            throw new DataNotFoundException("assignPoliceId is null for id " + assignPoliceId);
        }
        Optional<AssignPolice> assignPoliceOptional = assignPoliceRepository.findById(assignPoliceId);
        if (assignPoliceOptional.isEmpty()) {
            throw new DataNotFoundException("assignPolice is not found for id " + assignPoliceId);
        } else {
            AssignPolice obtainedAssignPolice = assignPoliceOptional.get();
            obtainedAssignPolice.setPolice(assignPolice.getPolice());
            obtainedAssignPolice.setEvent(assignPolice.getEvent());
            obtainedAssignPolice.setPoint(assignPolice.getPoint());
            obtainedAssignPolice.setAssignedDate(assignPolice.getAssignedDate());
            return assignPoliceRepository.save(obtainedAssignPolice);
        }
    }

    public AssignPolice readSpecific(Long assignPoliceId) {
        return assignPoliceRepository.findById(assignPoliceId)
                .orElseThrow(() -> new DataNotFoundException("AssignPolice not found with id: " + assignPoliceId));
    }

    public void deletePolice(Long assignPoliceId) {
        assignPoliceRepository.deleteById(assignPoliceId);
    }


    private boolean isPoliceAssigned(AssignPolice assignPolice) {
        // if police not in assign police then assign
        // if duty start date > event end date then assign
        // if duty start date > last event end date then assign

        boolean result = assignPoliceRepository.isPoliceAssignedForSpecificEvent(assignPolice.getPolice().getId() ,assignPolice.getDutyStartDate(), assignPolice.getEvent().getId());
        if (Objects.nonNull(result)){
            return result;
        } else {
            return false;
        }
    }

    private boolean isPoliceAssignedV2(AssignPolice assignPolice, List<Long> eventIds) {
        // if police not in assign police then assign
        // if duty start date > event end date then assign
        // if duty start date > last event end date then assign
        System.out.println(eventIds);
        System.out.println("duty start date: " + assignPolice.getDutyStartDate());
        // past code
//        int result = assignPoliceRepository.isPoliceAssignedForSpecificEvents(assignPolice.getPolice().getId() ,assignPolice.getDutyStartDate(), eventIds);
        return assignPoliceRepository.isPoliceAssignedForSpecificEvents(assignPolice.getPolice().getId() ,assignPolice.getDutyStartDate(), eventIds);
//        System.out.println(result);
//        return result > 0;
    }


    public Long countPoliceInEvent(EventIdDto dto) {
        // check if event exists else throw
        Event eventOptional = eventService.readSpecific(dto.getEventId());
        return assignPoliceRepository.countPoliceInEvent(dto.getEventId());
    }

    public Long countPoliceByEventAndPoint(EventAndPointIdDto dto) {
        // check if event exists else throw
        Event eventOptional = eventService.readSpecific(dto.getEventId());
        return assignPoliceRepository.countPoliceByEventAndPoint(dto.getEventId(), dto.getPointId());
    }

    /**
     * @author shyam
     *
     *
     * */
//    public List<AssignPolice> saveAssignPoliceByDesignation(AssignPoliceByDesignationCountDto dto) {
//        // check if event exists
//        Event event = eventService.readSpecific(dto.getEventId());
//        // check if point exists
//        Point point = pointService.readSpecific(dto.getPointId());
//
//        // check if designation exists
//        Designation designation = designationService.getDesignationByNameOrNameInGujarati(dto.getDesignationName());
////        Date dutyStartDate = new Date();
//        Date dutyStartDate = DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyStartDate());
//        Date dutyEndDate = DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyEndDate());
//        Date assignedDate = DateUtil.stringToDate("dd/MM/yyyy", dto.getAssignedDate());
//
//        // find available police in these designations
//        // we have to first find all police with designation and search them all
////        List<Long> policeWithDesignationIds = designation.getPolice().stream().map(Police::getId).toList();
//        List<Police> policeWithDesignation = designation.getPolice();
////        List<Police> policeWithDesignation = designation.getPolice().stream().filter(p -> p.getEvent().getId().equals(event.getId())).toList();
//
//
//        if (policeWithDesignation.size() == 0 ){
//            throw new DataNotFoundException("No police associated with designation " + designation.getName() );
//        }
//
//        // get all events occuring between given event.
//        List<Event> eventsBetweenGivenEvent = eventService.getEventsBetweenGivenEvent(dto.getEventId());
//        List<Long> eventIds = eventsBetweenGivenEvent.stream().map(Event::getId).toList();
//
////        if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getDutyStartDate())) {
////            Calendar cal = Calendar.getInstance(); // creates calendar
////            cal.setTime(DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyStartDate()));               // sets calendar time/date
////            cal.add(Calendar.HOUR_OF_DAY, 6);      // adds one hour
////            dutyStartDate = cal.getTime();
////        }
//        // check if these police are free
//        List<Police> availablePoliceIdsWithDesignation = new ArrayList<>(policeWithDesignation.stream().filter(police -> !assignPoliceRepository.isPoliceAssignedForSpecificEvents(police.getId(), dutyStartDate, eventIds)).toList());
//        if (dto.getPoliceCount() > availablePoliceIdsWithDesignation.size()) {
//            throw new InsufficientDataException("Insufficient police Only " + availablePoliceIdsWithDesignation.size() + " police is available out of " + dto.getPoliceCount());
//        }
//        Collections.shuffle(availablePoliceIdsWithDesignation);
//        List<AssignPolice> assignedPoliceList = new ArrayList<AssignPolice>();
//
//        for(int i = 0; i < dto.getPoliceCount(); i++){
//            AssignPolice assignPolice = new AssignPolice();
//            assignPolice.setEvent(event);
//            assignPolice.setPoint(point);
//            assignPolice.setDutyStartDate(dutyStartDate);
//            assignPolice.setDutyEndDate(dutyEndDate);
//            assignPolice.setAssignedDate(assignedDate);
//            assignPolice.setPolice(availablePoliceIdsWithDesignation.get(i));
//            assignedPoliceList.add(assignPolice);
//        }
//        assignPoliceRepository.saveAll(assignedPoliceList);
//        return assignedPoliceList;
//    }

    /*
    * This method will assign police in given point automatically, but count must be given
    * */
    public List<AssignPolice> saveAssignPoliceByDesignation(AssignPoliceByDesignationCountDto dto) {
        // check if event exists
        Event event = eventService.readSpecific(dto.getEventId());
        // check if point exists
        Point point = pointService.readSpecific(dto.getPointId());

        // check if designation exists
        Designation designation = designationService.getDesignationByNameOrNameInGujarati(dto.getDesignationName());
//        Date dutyStartDate = new Date();
        Date dutyStartDate = DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyStartDate());
        Date dutyEndDate = DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyEndDate());
        Date assignedDate = DateUtil.stringToDate("dd/MM/yyyy", dto.getAssignedDate());

        // find available police in these designations
        // we have to first find all police with designation and search them all
//        List<Long> policeWithDesignationIds = designation.getPolice().stream().map(Police::getId).toList();
        List<Police> policeWithDesignation = designation.getPolice();
//        List<Police> policeWithDesignation = designation.getPolice().stream().filter(p -> p.getEvent().getId().equals(event.getId())).toList();


        if (policeWithDesignation.size() == 0 ){
            throw new DataNotFoundException("No police associated with designation " + designation.getName() );
        }

        // get all events occuring between given event.
        List<Event> eventsBetweenGivenEvent = eventService.getEventsBetweenGivenEvent(dto.getEventId());
        List<Long> eventIds = eventsBetweenGivenEvent.stream().map(Event::getId).toList();

//        if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getDutyStartDate())) {
//            Calendar cal = Calendar.getInstance(); // creates calendar
//            cal.setTime(DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyStartDate()));               // sets calendar time/date
//            cal.add(Calendar.HOUR_OF_DAY, 6);      // adds one hour
//            dutyStartDate = cal.getTime();
//        }
        // check if these police are free
        List<Police> availablePoliceIdsWithDesignation = new ArrayList<>(policeWithDesignation.stream().filter(police -> !assignPoliceRepository.isPoliceAssignedForSpecificEvents(police.getId(), dutyStartDate, eventIds)).toList());
        if (dto.getPoliceCount() > availablePoliceIdsWithDesignation.size()) {
            throw new InsufficientDataException("Insufficient police Only " + availablePoliceIdsWithDesignation.size() + " police is available out of " + dto.getPoliceCount());
        }
        Collections.shuffle(availablePoliceIdsWithDesignation);
        List<AssignPolice> assignedPoliceList = new ArrayList<AssignPolice>();
        List<Long> assignedPoliceIds = new ArrayList<>();
        for(int i = 0; i < dto.getPoliceCount(); i++){
            AssignPolice assignPolice = new AssignPolice();
            assignPolice.setEvent(event);
            assignPolice.setPoint(point);
            assignPolice.setDutyStartDate(dutyStartDate);
            assignPolice.setDutyEndDate(dutyEndDate);
            assignPolice.setAssignedDate(assignedDate);
            assignPolice.setPolice(availablePoliceIdsWithDesignation.get(i));
            assignedPoliceIds.add(availablePoliceIdsWithDesignation.get(i).getId());
            assignedPoliceList.add(assignPolice);
        }
        assignPoliceRepository.saveAll(assignedPoliceList);
        policeRepository.updatePoliceAssignStatusAssigned(assignedPoliceIds);
        return assignedPoliceList;
    }

    public Object pointEventLevelAssignment(AssignPoliceDto dto){
        Event event = eventService.readSpecific(dto.getEventId());
        Point point = pointService.readSpecific(dto.getPointId());

        EventPointPoliceCountAssignmentRespDto pointLevelAssignmentDto =
                pointPoliceCountService.readAllByPointDesignationCountsAndEventName(event.getId(), point.getId());

        List<DesignationCountRespDto> designationCountRespDtoList = pointLevelAssignmentDto.getAssignments();
//        System.out.println(designationCountRespDtoList.get(0).getDesignationId());
        AtomicInteger totalAssignedPolice = new AtomicInteger();
        designationCountRespDtoList.forEach(d -> {
            List<Police> assignedPolice = assignByDesignationCountForPoint(d, dto, false);
            totalAssignedPolice.addAndGet(assignedPolice.size());
        });
        return totalAssignedPolice;
//        return assignByDesignationCountForPoint(designationCountRespDtoList.get(0), dto);
//        designationCountRespDtoList.get(0).get


    }
    /*
    * It does not compare with previous assignments & assignments given in PointPoliceCount Entity
    * */
    private List<Police> assignByDesignationCountForPoint(DesignationCountRespDto designationCount, AssignPoliceDto dto, boolean isAutoAssignment){
        Point point = pointService.readSpecific(dto.getPointId());
        Event event = eventService.readSpecific(dto.getEventId());
        dto.setAssignedDate(dto.getAssignedDate() == null ? DateUtil.dateToString(new Date(),"dd/MM/yyyy") : dto.getAssignedDate());
        dto.setDutyStartDate(dto.getDutyStartDate() == null ? DateUtil.dateToString(event.getEventStartDate(), "dd/MM/yyyy") : dto.getDutyStartDate());
        dto.setDutyEndDate(dto.getDutyEndDate() == null ? DateUtil.dateToString(event.getEventEndDate(), "dd/MM/yyyy") : dto.getDutyEndDate());

        // check if police is already assigned for specified designation
        Integer previousAssignment = assignPoliceRepository.getPreviousAssignmentForDesignation(dto.getEventId(), dto.getPointId(), designationCount.getDesignationId());
        // find free police of event's and of designation which are unassigned
        int requiredCount = designationCount.getDesignationCount()-previousAssignment;
        List<Police> unassignedPoliceOfDesignation = policeService.getUnassignedPoliceOfDesignation(dto.getEventId(),designationCount.getDesignationId());
        // if required police are more then throw error
        if( requiredCount > unassignedPoliceOfDesignation.size()){
            // returning null when autoassignment operation running. as want to assign best case.
            if (isAutoAssignment){return null;}
            throw new InsufficientDataException("Unavailable police with designation " + designationCount.getDesignationName() + " count " + designationCount.getDesignationCount() + " only available are " + unassignedPoliceOfDesignation.size());
        }
        List<Police> policeToBeAssignedList = new ArrayList<Police>();
        List<AssignPolice> assignPoliceList = new ArrayList<AssignPolice>();

        Collections.shuffle(unassignedPoliceOfDesignation);
        for (int i = 0; i < requiredCount; i++) {
            Police policeToBeAssigned = unassignedPoliceOfDesignation.get(i);
            policeToBeAssigned.setAssigned(true);

            AssignPolice assignPolice = new AssignPolice();
            assignPolice.setPoint(point);
            assignPolice.setEvent(event);
            assignPolice.setPolice(policeToBeAssigned);

            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getAssignedDate())) {
                assignPolice.setAssignedDate(DateUtil.stringToDate("dd/MM/yyyy", dto.getAssignedDate()));
            }
            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getDutyStartDate())) {
                assignPolice.setDutyStartDate(DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyStartDate()));
            }
            if (DateUtil.isValidFormat("dd/MM/yyyy", dto.getDutyEndDate())) {
                assignPolice.setDutyEndDate(DateUtil.stringToDate("dd/MM/yyyy", dto.getDutyEndDate()));
            }
            policeToBeAssignedList.add(policeToBeAssigned);
            assignPoliceList.add(assignPolice);
        }
        policeRepository.saveAll(policeToBeAssignedList);
        assignPoliceRepository.saveAll(assignPoliceList);
        return policeToBeAssignedList;
//        return unassignedPoliceOfDesignation;
    }

    public EventPointPoliceAssignmentRespDto policeByEventAndPoint(EventAndPointIdDto dto) {
        Point point = pointService.readSpecific(dto.getPointId());
        Event event = eventService.readSpecific(dto.getEventId());

        EventPointPoliceAssignmentRespDto resp = new EventPointPoliceAssignmentRespDto();
        resp.setPointId(point.getId());
        resp.setEventId(event.getId());

        List<AssignPolice> assignments = assignPoliceRepository.assignedPoliceByEventAndPoint(dto.getEventId(), dto.getPointId());
        List<PoliceInPointAndEventDto> assignedPoliceForce = assignments.stream().map( assignment -> {
            PoliceInPointAndEventDto police = new PoliceInPointAndEventDto();
            police.setPoliceId(assignment.getPolice().getId());
            police.setDutyStartDate(assignment.getDutyStartDate());
            police.setDutyEndDate(assignment.getDutyEndDate());
            police.setPoliceName(assignment.getPolice().getFullName());
            police.setPoliceStationName(assignment.getPolice().getPoliceStation().getPoliceStationName());
            police.setBuckleNumber(assignment.getPolice().getBuckleNumber());
            police.setGender(assignment.getPolice().getGender());
            police.setNumber(assignment.getPolice().getNumber());
            police.setAge(Integer.toString(assignment.getPolice().getAge()));
            police.setDistrict(assignment.getPolice().getDistrict());
            police.setDesignation(assignment.getPolice().getDesignation().getName());
            return police;
        }).toList();
        resp.setAssignedPoliceList(assignedPoliceForce);
        resp.setAssignmentCount(assignedPoliceForce.size());
        return resp;
    }

    public APIResponse assignMultiplePolice(AssignMultiplePoliceDto dto) {
        // check if already these police ids are not assigned
        List<Event> eventsBetweenGivenEvent = eventService.getEventsBetweenGivenEvent(dto.getEventId());
        List<Police> policeList = policeService.getPoliceByIds(dto.getPoliceIds());

        for(Police p : policeList){
            System.out.println(p.getId() + " " + p.getFullName() + " " + p.isAssigned());
            if (p.isAssigned()){
                return APIResponse.error("Police is already assigned please remove " + p.getFullName());
            }
        }
        Point point = pointService.readSpecific(dto.getPointId());
        Event event = eventService.readSpecific(dto.getEventId());
        Map<Long, Integer> designationCountToBeIncremented = new HashMap<>();
        if (!policeList.isEmpty() && Objects.nonNull(point)
                && Objects.nonNull(event)){
            List<AssignPolice> assignPoliceList = new ArrayList<>();
            policeList.stream().forEach( police -> {
                AssignPolice assignPolice = new AssignPolice();
                assignPolice.setAssignedDate(dto.getAssignedDate());
                Calendar cal = Calendar.getInstance(); // creates calendar
                cal.setTime(dto.getDutyStartDate());               // sets calendar time/date
                cal.add(Calendar.HOUR_OF_DAY, 6);      // adds six hour
                assignPolice.setDutyStartDate(dto.getDutyStartDate());
                assignPolice.setDutyEndDate(dto.getDutyEndDate());


                if ((!DateUtil.isDateBeforeOrEqual(event.getEventStartDate(), assignPolice.getDutyStartDate())) || (!DateUtil.isDateAfterOrEqual(event.getEventEndDate(), assignPolice.getDutyEndDate()))) {
                    throw new DateMisMatchException("Date is not in range of event date : " + DateUtil.dateToString(event.getEventStartDate(),"dd-MM-YYYY") + " : " + DateUtil.dateToString(event.getEventEndDate(), "dd-MM-YYYY") + " police assignment dates : " + DateUtil.dateToString(assignPolice.getDutyStartDate(), "dd-MM-yyyy") + " " + DateUtil.dateToString(assignPolice.getDutyEndDate(), "dd-MM-YYYY"));
                }

                assignPolice.setPolice(police);
                assignPolice.setPoint(point);
                assignPolice.setEvent(event);
                designationCountToBeIncremented.put(police.getDesignation().getId(),
                        designationCountToBeIncremented.get(police.getDesignation().getId()) == null ? 1
                                : designationCountToBeIncremented.get(police.getDesignation().getId())+1);
                assignPoliceList.add(assignPolice);
            });
            assignPoliceRepository.saveAll(assignPoliceList);
            policeRepository.updatePoliceAssignStatusAssigned(policeList.stream().map(Police::getId).collect(Collectors.toList()));
            pointPoliceCountService.incrementDesignationCountByAssignedPolice(event.getId(), point.getId(), designationCountToBeIncremented);
            return APIResponse.ok("Total of " + assignPoliceList.size() + " police were assigned in event " + event.getEventName());
        } else {
            throw new DataSavingException("Could not save assigned police information");
        }
    }

    public EventPoliceAssignmentRespDto policeByEvent(EventAndPointIdDto dto) {
        Event event = eventService.readSpecific(dto.getEventId());
        EventPoliceAssignmentRespDto resp = new EventPoliceAssignmentRespDto();
        resp.setEventId(event.getId());
        List<PointPoliceAssignmentRespDto> pointAssignmentList = new ArrayList<>();
        List<PointDto> allPoints = pointService.getPoints();
//        List<Long> pointIds = allPoints.stream().map(PointDto::getId).toList();


        allPoints.stream().forEach(point -> {
            PointPoliceAssignmentRespDto pointAssignment = new PointPoliceAssignmentRespDto();
            List<AssignPolice> assignments = assignPoliceRepository.assignedPoliceByEventAndPoint(dto.getEventId(), point.getId());
//            System.out.println(assignments.size());
            if (assignments.size() > 0){
                List<PoliceInPointAndEventDto> assignedPoliceForce = assignments.stream().map( assignment -> {
                    PoliceInPointAndEventDto police = new PoliceInPointAndEventDto();
                    police.setPoliceId(assignment.getPolice().getId());
                    police.setDutyStartDate(assignment.getDutyStartDate());
                    police.setDutyEndDate(assignment.getDutyEndDate());
                    police.setPoliceName(assignment.getPolice().getFullName());
                    police.setPoliceStationName(assignment.getPolice().getPoliceStation().getPoliceStationName());
                    police.setBuckleNumber(assignment.getPolice().getBuckleNumber());
                    police.setGender(assignment.getPolice().getGender());
                    police.setNumber(assignment.getPolice().getNumber());
                    police.setAge(Integer.toString(assignment.getPolice().getAge()));
                    police.setDistrict(assignment.getPolice().getDistrict());
                    police.setDesignation(assignment.getPolice().getDesignation().getName());
                    return police;
                }).toList();
                pointAssignment.setAssignedPoliceList(assignedPoliceForce);
                pointAssignment.setPointId(point.getId());
                pointAssignment.setPointName(point.getPointName());
                pointAssignment.setPointAccessories(point.getAccessories());
                pointAssignment.setPointRemarks(point.getRemarks());
                pointAssignment.setZoneName(point.getZoneName());
                pointAssignment.setAssignmentCount(assignments.size());
                pointAssignmentList.add(pointAssignment);
            }
        });
        resp.setPointAssignments(pointAssignmentList);
        return resp;
    }

    /*
    *   assign police in best of designations given from total police by designation
    *   police should be automatically assigned <= pointPoliceCount
    * */
    public APIResponse assignAutomaticallyAllPoints(Long eventId) {
        Event event = eventService.readSpecific(eventId);
        List<PointDto> allPoints = pointService.getPoints();
        // it has all information about which point requires how many police of designation
        List<EventPointPoliceCountAssignmentRespDto> pointPoliceCounts = pointPoliceCountService.getAllPointPoliceCountForEvent(eventId);
        AtomicInteger newAssignedCount = new AtomicInteger();
        AtomicInteger totalRequestedPolice = new AtomicInteger();
        pointPoliceCounts.stream().forEach(requiredPointPoliceCount -> {
            requiredPointPoliceCount.getAssignments().stream().forEach(
                    assignment -> {
                        totalRequestedPolice.addAndGet(assignment.getDesignationCount());
                        // if previous assignment is less than current requirement than assign more
                        Integer previousAssignment = assignPoliceRepository.getPreviousAssignmentForDesignation(eventId, requiredPointPoliceCount.getPointId(), assignment.getDesignationId());
                        previousAssignment = previousAssignment == null ? 0 : previousAssignment;

                        if (previousAssignment < assignment.getDesignationCount()) {
                            DesignationCountRespDto designationCount = new DesignationCountRespDto();
                            designationCount.setDesignationCount(assignment.getDesignationCount()-previousAssignment);
                            designationCount.setDesignationId(assignment.getDesignationId());
                            designationCount.setDesignationName(assignment.getDesignationName());

                            AssignPoliceDto assignPoliceDto = new AssignPoliceDto();
                            assignPoliceDto.setEventId(eventId);
                            assignPoliceDto.setPointId(requiredPointPoliceCount.getPointId());
                            List<Police> assignedPolice = assignByDesignationCountForPoint(designationCount, assignPoliceDto, true);
                            if (CollectionUtil.nonNullNonEmpty(assignedPolice)) {
                                assert assignedPolice != null;
                                newAssignedCount.addAndGet(assignedPolice.size());
                            }
                        }
                    }
            );
        });
        return APIResponse.ok("new Police assigned " + newAssignedCount.get() + ", total asked " + totalRequestedPolice.get());
    }

    public String policeByEventExcel(EventAndPointIdDto dto) {
        EventPoliceAssignmentRespDto result = policeByEvent(dto);
        String fileName = null;
        try {
            fileName = FileUtils.createTempFile("xls");
        } catch (IOException e1) {
            return null;
        }
        AssignedPoliceInEventWriter writer = (AssignedPoliceInEventWriter) new ExportWriterFactory<PointPoliceAssignmentRespDto>()
                .getExportFile(ExportWriterFactory.ASSIGNED_POLICE_EXPORT, fileName, mapper);
        LOGGER.info("export_assigned_police_started");
        writer.setAssignments(result.getPointAssignments());
//        writer.exportToExcel(writer.getAssignments().get(0).getAssignedPoliceList());
        writer.exportToExcel(result.getPointAssignments());
        if (writer != null) {
            writer.close();
        }
        return fileName;
    }

    public String policeByEventExcel(EventPoliceAssignmentRespDto result) {
        String fileName = null;
        try {
            fileName = FileUtils.createTempFile("xls");
        } catch (IOException e1) {
            return null;
        }
        AssignedPoliceInEventWriter writer = (AssignedPoliceInEventWriter) new ExportWriterFactory<PointPoliceAssignmentRespDto>()
                .getExportFile(ExportWriterFactory.ASSIGNED_POLICE_EXPORT, fileName, mapper);
        LOGGER.info("export_assigned_police_started");
        writer.setAssignments(result.getPointAssignments());
//        writer.exportToExcel(writer.getAssignments().get(0).getAssignedPoliceList());
        writer.exportToExcel(result.getPointAssignments());
        if (writer != null) {
            writer.close();
        }
        return fileName;
    }

}

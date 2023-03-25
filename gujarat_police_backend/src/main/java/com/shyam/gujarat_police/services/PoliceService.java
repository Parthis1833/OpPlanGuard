package com.shyam.gujarat_police.services;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.shyam.gujarat_police.dto.request.CreatePoliceDto;
import com.shyam.gujarat_police.dto.request.PoliceDto;
import com.shyam.gujarat_police.entities.Designation;
import com.shyam.gujarat_police.entities.Event;
import com.shyam.gujarat_police.entities.Police;
import com.shyam.gujarat_police.entities.PoliceStation;
import com.shyam.gujarat_police.exceptions.DataAlreadyExistException;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.exceptions.ExcelException;
import com.shyam.gujarat_police.io.ExcelDataObject;
import com.shyam.gujarat_police.io.XlsReader;
import com.shyam.gujarat_police.io.dto.PoliceImportExcelDto;
import com.shyam.gujarat_police.io.read.ExcelReadProcessor;
import com.shyam.gujarat_police.repositories.PoliceRepository;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.util.FileUtils;
import com.shyam.gujarat_police.util.ImportUtil;
import com.shyam.gujarat_police.util.ObjectUtil;
import com.shyam.gujarat_police.util.RegExUtil;
import com.shyam.gujarat_police.util.TextUtils;
import org.apache.poi.ss.usermodel.Sheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class PoliceService {

    private static final Logger LOGGER = LoggerFactory.getLogger(PoliceService.class);
    @Autowired
    private PoliceRepository policeRepository;
    @Autowired
    private DesignationService designationService;
    @Autowired
    private PoliceStationService policeStationService;
    @Autowired
    private EventService eventService;
    @Autowired
    @Qualifier("police_import_processor")
    private ExcelReadProcessor<Sheet> policeImportProcessor;

    public List<Police> getAllPolice() {
        return (List<Police>) policeRepository.findAll();
    }

    public Police savePolice(CreatePoliceDto dto) {
        // unique buckle number && designation exists? && policeStation exists?
        if (isUniqueBuckleNumberInEvent(dto.getBuckleNumber(), dto.getEventId())) {
            Police police = createPoliceFromDto(dto);
            return policeRepository.save(police);
        } else {
            throw new DataAlreadyExistException("Police already exists with buckleNumber "
                    + dto.getBuckleNumber() + " with police Name : " + dto.getFullName());
        }
    }

    // create new method to save police
    public APIResponse savePoliceForExcel(CreatePoliceDto dto) {
        if (isUniqueBuckleNumberInEvent(dto.getBuckleNumber(), dto.getEventId())) {
            Police police = createPoliceFromDto(dto);
            policeRepository.save(police);
            return APIResponse.ok();
        } else {
            throw new DataAlreadyExistException("Police already exists with buckleNumber "
                    + dto.getBuckleNumber() + " with police Name : " + dto.getFullName() + " in event");
        }
    }

    private Police createPoliceFromDto(CreatePoliceDto dto) {
        Event event = eventService.readSpecific(dto.getEventId());
        Police police = new Police();
        police.setAge(Integer.parseInt(dto.getAge()));
        police.setBuckleNumber(dto.getBuckleNumber());
        police.setDistrict(dto.getDistrict());
        police.setFullName(dto.getFullName());
        police.setGender(dto.getGender());
        police.setNumber(dto.getNumber());
        Designation designation = designationService.getDesignationById(dto.getDesignation());
        police.setDesignation(designation);
        PoliceStation policeStation = policeStationService.readSpecificById(dto.getPoliceStation());
        police.setPoliceStation(policeStation);
        police.setEvent(event);
        return police;
    }

    public void deletePolice(Long id) {
        policeRepository.deleteById(id);
    }

    public Police updatePolice(PoliceDto police, Long policeId) {
        if (Objects.isNull(policeId)) {
            throw new DataNotFoundException("Police Id not found with id " + policeId);
        }
        Optional<Police> optionalPolice = policeRepository.findById(policeId);
        if (TextUtils.isBlank(police.getDesignationName()))
            throw new DataNotFoundException("Designation cannot be empty");
        Designation designation = designationService.getDesignationByNameOrNameInGujarati(police.getDesignationName());
        if (optionalPolice.isEmpty()) {
            throw new DataNotFoundException("Police not found with id " + policeId);
        } else {
            Police obtainedPolice = optionalPolice.get();
            if (!TextUtils.isBlank(police.getFullName())) {
                obtainedPolice.setFullName(police.getFullName());
            }
            if (!TextUtils.isBlank(police.getBuckleNumber())) {

                obtainedPolice.setBuckleNumber(police.getBuckleNumber());
            }

            if (!TextUtils.isBlank(police.getNumber())) {
                obtainedPolice.setNumber(police.getNumber());
            }

            if (!RegExUtil.isNumber(police.getAge())) {
                obtainedPolice.setAge(police.getAge());
            }

            if (!TextUtils.isBlank(police.getDistrict())) {
                obtainedPolice.setDistrict(police.getDistrict());
            }

            if (!TextUtils.isBlank(police.getGender())) {
                obtainedPolice.setGender(police.getGender());
            }


            obtainedPolice.setDesignation(designation);
//            obtainedPolice.setPoliceStation(police.getPoliceStation());
//            obtainedPolice.setEvent(police.getEvent());
            return policeRepository.save(obtainedPolice);
        }
    }

    public Police readSpecific(Long policeId) {
        return policeRepository.findById(policeId)
                .orElseThrow(() -> new DataNotFoundException("Police not found with id: " + policeId));
    }

    public APIResponse officerData() throws JsonProcessingException {
        List<Police> policeList = (List<Police>) policeRepository.findAll();
        return APIResponse.ok(policeList);
    }

    private boolean isUniqueBuckleNumberInEvent(String buckleNumber, Long eventId) {
        Optional<Police> isPoliceExists = policeRepository.getByBuckleNumberAndEventId(buckleNumber, eventId);
        return isPoliceExists.isEmpty();
    }

    public int saveMultiple(List<Police> policeListFromExcel) {
        List<Police> uniquePolice = policeListFromExcel.stream().
                filter(police -> !isPoliceExists(police)).toList();
        policeRepository.saveAll(uniquePolice);
        return uniquePolice.size();
    }

    private boolean isPoliceExists(Police station) {
        return policeRepository.isPoliceExists(station);
    }

    public APIResponse countPolice() {
        return APIResponse.ok(policeRepository.count());
    }

    public APIResponse countPoliceByEvent(Long eventId) {
        Event event = eventService.readSpecific(eventId);
        Integer policeObtainedForEvent = event.getPoliceList().size();
        return APIResponse.ok(policeObtainedForEvent);
    }

    public List<Police> getUnassignedPoliceOfDesignation(Long eventId, Long designationId) {

        List<Police> unassignedPolice = policeRepository.getUnassignedPoliceOfDesignation(eventId, designationId);
//        if (unassignedPolice.size() == 0) {
////            throw new DataNotFoundException("No free Police found for designation with id " + designationId);
//        }
        return unassignedPolice;
    }

    public List<Police> getPoliceByIds(List<Long> policeIds) {
        return (List<Police>) policeRepository.findAllById(policeIds);
    }

    public APIResponse savePoliceFromExcel(PoliceImportExcelDto policeImport, Event event) {
        if (!RegExUtil.isNumber(policeImport.getMobileNumber())) {
            return APIResponse.error("Police number must be a valid mobile number of police" + policeImport.getMobileNumber());
        }
        if (isUniqueBuckleNumberInEvent(policeImport.getBuckleNo(), event.getId())) {
            Police police = new Police();
            Designation designation = designationService.getDesignationByNameOrNameInGujarati(policeImport.getDesignation());
            PoliceStation policeStation = policeStationService.readSpecificByNameOrDemo(policeImport.getPoliceStationName());

            police.setEvent(event);
            police.setPoliceStation(policeStation);
            police.setDesignation(designation);
            police.setGender(policeImport.getGender());
            police.setNumber(policeImport.getMobileNumber());
            Integer age = ObjectUtil.optInteger(policeImport.getAge());
            age = age == null ? 0 : age;
            police.setAge(age);
            police.setDistrict(policeImport.getDistrict());
            police.setAssigned(false);
            police.setBuckleNumber(policeImport.getBuckleNo());
            police.setFullName(policeImport.getOfficerName());
            try {
                policeRepository.save(police);
            } catch (Exception e) {
                LOGGER.info(police.toString());
                LOGGER.error(e.getMessage());
            }
            return APIResponse.ok();
        } else {
            APIResponse.error("Police already exists with buckle number " + policeImport.getBuckleNo() + " with name " + policeImport.getOfficerName() + " in event : " + event.getEventName());
        }
        return APIResponse.error("something went Wrong or all police in excel already exists");
    }

    public APIResponse uploadFromExcel(File file, Long eventId) {
        XlsReader reader = new XlsReader(policeImportProcessor);
        ExcelDataObject data = reader.read(file, eventId);
        String fileName = ImportUtil.createOrderUpdateErrorFile(data);
        LOGGER.error("Upload_police_from_excel completed::success" + data.getSuccessCount() + ":failure::" + data.getFailureCount());
        return APIResponse.ok(fileName);
    }

    public List<PoliceDto> getAllPoliceInEvent(Long eventId) {
        List<Police> policeListInEvent = policeRepository.getByEventId(eventId);
        return policeListInEvent.stream().map(p -> {
            PoliceDto dto = new PoliceDto();
            dto.setId(p.getId());
            dto.setFullName(p.getFullName());
            dto.setBuckleNumber(p.getBuckleNumber());
            dto.setNumber(p.getNumber());
            dto.setAge(p.getAge());
            dto.setDistrict(p.getDistrict());
            dto.setGender(p.getGender());
            dto.setPoliceStationName(p.getPoliceStation().getPoliceStationName());
            dto.setDesignationName(p.getDesignation().getName());
            dto.setAssigned(p.isAssigned());
            return dto;
        }).toList().stream().sorted(Comparator.comparing(PoliceDto::getId)).toList();
    }

    public String downloadSamplePoliceExcel() {
        File policeDemoFile = null;
        File tmpFile = null;
        try {
            tmpFile = FileUtils.createAndGetTempFile("xlsx");
            policeDemoFile = ResourceUtils.getFile("classpath:files/police_insert_demo.xlsx");
            FileUtils.copyExcelFile(policeDemoFile.getAbsolutePath(), tmpFile.getAbsolutePath());
        } catch (IOException e) {
            throw new ExcelException("Excel could not be downloaded");
        }
        return tmpFile.getAbsolutePath();
    }
}

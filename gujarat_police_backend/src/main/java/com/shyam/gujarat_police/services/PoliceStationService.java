package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.dto.response.DistrictTalukaAndPoliceStationNameRespDto;
import com.shyam.gujarat_police.entities.Police;
import com.shyam.gujarat_police.entities.PoliceStation;
import com.shyam.gujarat_police.exceptions.DataAlreadyExistException;
import com.shyam.gujarat_police.exceptions.DataNotFoundException;
import com.shyam.gujarat_police.exceptions.ExcelException;
import com.shyam.gujarat_police.io.ExcelDataObject;
import com.shyam.gujarat_police.io.XlsReader;
import com.shyam.gujarat_police.io.dto.PoliceStationImportExcelDto;
import com.shyam.gujarat_police.io.processor.PoliceImportProcessor;
import com.shyam.gujarat_police.io.read.ExcelReadProcessor;
import com.shyam.gujarat_police.repositories.PoliceRepository;
import com.shyam.gujarat_police.repositories.PoliceStationRepository;
import com.shyam.gujarat_police.response.APIResponse;
import com.shyam.gujarat_police.util.FileUtils;
import com.shyam.gujarat_police.util.ImportUtil;
import org.apache.poi.ss.usermodel.Sheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class PoliceStationService {

    @Autowired
    private PoliceStationRepository policeStationRepository;

    @Autowired
    private PoliceRepository policeRepository;


    @Autowired
    @Qualifier("police_station_import_processor")
    private ExcelReadProcessor<Sheet> policeStationImportProcessor;

    private static final Logger LOGGER = LoggerFactory.getLogger(PoliceStationService.class);


    public List<PoliceStation> getAllPoliceStation() {
        return (List<PoliceStation>) policeStationRepository.findAll();
    }

    public PoliceStation savePoliceStation(PoliceStation station) {
        if (isUniqueName(station.getPoliceStationName(), station.getPoliceStationNameInGujarati())){
            return policeStationRepository.save(station);
        } else {
            throw new DataAlreadyExistException("PoliceStation already exists " + station.getPoliceStationName());
        }
    }

    public PoliceStation updatePoliceStation(PoliceStation policeStation, Long stationId) {
        Optional<PoliceStation> optionalPoliceStation = policeStationRepository.findById(stationId);
        PoliceStation obtainedPoliceStation = null;
        if (optionalPoliceStation.isEmpty()) {
            throw new DataNotFoundException("Police Station not found");
        } else {
            obtainedPoliceStation = optionalPoliceStation.get();
            obtainedPoliceStation.setDistrict(policeStation.getDistrict());
            obtainedPoliceStation.setTaluko(policeStation.getTaluko());
            obtainedPoliceStation.setContactNumber(policeStation.getContactNumber());
            obtainedPoliceStation.setAddress(policeStation.getAddress());
            obtainedPoliceStation.setPoliceStationName(policeStation.getPoliceStationName());
            if (policeStation.getHeadPolice() != null) {
                Police headPolice = policeRepository.findById(policeStation.getHeadPolice().getId())
                        .orElseThrow(() -> new DataNotFoundException("Head Police Not Found"));
                obtainedPoliceStation.setHeadPolice(headPolice);
            }
            return obtainedPoliceStation;
        }

    }

    public PoliceStation readSpecificById(Long stationId) {
        return policeStationRepository.findById(stationId)
                .orElseThrow(()->new DataNotFoundException("No station found for stationId: " + stationId));
    }

    public PoliceStation readSpecificByName(String stationName){
        List<PoliceStation> policeStationListFromExcel = policeStationRepository.findbyPoliceStationNameOrNameInGuj(stationName);
        if (policeStationListFromExcel.size() == 0 ){
            throw new DataNotFoundException("No station found for stationName: " + stationName);
        } else {
            return policeStationListFromExcel.get(0);
        }
    }
    public PoliceStation readSpecificByNameOrDemo(String stationName){
        List<PoliceStation> policeStationListFromExcel = policeStationRepository.findbyPoliceStationNameOrNameInGuj(stationName);
        if (policeStationListFromExcel.size() == 0 ){
            return policeStationRepository.findByPoliceStationName("demo").orElseThrow(()->
                    new DataNotFoundException("No station name found for station " + stationName));
        } else {
            return policeStationListFromExcel.get(0);
        }
    }

    public void deletePoliceStation(Long stationId){
        policeStationRepository.deleteById(stationId);
    }

    private boolean isUniqueName(String nameInGujarati, String nameInEnglish){
        return policeStationRepository.findByNameInGujaratiOrEnglish(nameInEnglish, nameInGujarati).size() == 0;
    }

    public int saveMultiple(List<PoliceStation> policeStations){
        List<PoliceStation> uniquePoliceStation = policeStations.stream().
                filter(station -> !isPoliceStationExists(station)).toList();
        policeStationRepository.saveAll(uniquePoliceStation);
        return uniquePoliceStation.size();
    }

    public boolean isPoliceStationExists(PoliceStation station){
        return policeStationRepository.isStationExists(station);
    }
    public boolean isPoliceStationExists(String stationName){
        return policeStationRepository.isStationExists(stationName);
    }

    public List<DistrictTalukaAndPoliceStationNameRespDto> getDistrictTalukaAndPoliceStation() {
        return policeStationRepository.getDistrictTalukaAndPoliceStation();
    }

    public APIResponse savePoliceStationFromExcel(PoliceStationImportExcelDto dto) {
        LOGGER.info("savePoliceStationFromExcel");
        if(isUniqueName(dto.getPostNameInGuj(), dto.getPostName())){
            PoliceStation policeStation = new PoliceStation();
            policeStation.setPoliceStationName(dto.getPostName());
            policeStation.setPoliceStationNameInGujarati(dto.getPostNameInGuj());
            policeStation.setDistrict(dto.getCity());
            policeStation.setDistrictInGuj(dto.getCityInGuj());
            policeStation.setTaluko(dto.getTaluko());
            policeStation.setTalukoInGuj(dto.getTalukoInGuj());
            policeStation.setAddress(dto.getAddress());
            policeStation.setContactNumber(dto.getContactNumber());

            policeStationRepository.save(policeStation);
            System.out.println(dto.getSerialNo());
            return APIResponse.ok();
        }
        return APIResponse.error("Already exists station " + dto.getPostName());
    }

    public APIResponse uploadFromExcel(File file) {
        XlsReader reader = new XlsReader(policeStationImportProcessor);
        ExcelDataObject data = reader.read(file, null);
        String fileName = ImportUtil.createOrderUpdateErrorFile(data);
        LOGGER.error("Upload_police_station_from_excel completed::success" + data.getSuccessCount() + ":failure::" + data.getFailureCount());
        return APIResponse.ok(fileName);
    }

    public String downloadSamplePoliceStationExcel() {
        File policeDemoFile = null;
        File tmpFile = null;
        try {
            tmpFile = FileUtils.createAndGetTempFile("xlsx");
            policeDemoFile = ResourceUtils.getFile("classpath:files/police_station_demo.xlsx");
            FileUtils.copyExcelFile(policeDemoFile.getAbsolutePath(), tmpFile.getAbsolutePath());
        } catch (IOException e) {
            throw new ExcelException("Excel could not be downloaded");
        }
        return tmpFile.getAbsolutePath();
    }
}

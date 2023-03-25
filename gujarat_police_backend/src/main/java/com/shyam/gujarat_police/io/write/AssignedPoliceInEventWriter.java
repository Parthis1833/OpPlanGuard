package com.shyam.gujarat_police.io.write;

import com.shyam.gujarat_police.dto.response.PointPoliceAssignmentRespDto;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class AssignedPoliceInEventWriter implements ExportWriter<PointPoliceAssignmentRespDto>{
    private static final Logger LOGGER = LoggerFactory.getLogger(AssignedPoliceInEventWriter.class);

    ModelMapper mapper;
    ExportXlsEventAssignmentView exportXlsEventAssignmentView;
    List<PointPoliceAssignmentRespDto> assignRespDtoList;

    public AssignedPoliceInEventWriter(String fileName, ModelMapper mapper) {
        exportXlsEventAssignmentView = new ExportXlsEventAssignmentView(fileName);
        this.mapper = mapper;
    }

    @Override
    public void exportToExcel(List<PointPoliceAssignmentRespDto> t) {
        exportXlsEventAssignmentView.writeToExcelLevel2(t);
    }

    public void setAssignments(List<PointPoliceAssignmentRespDto> pointAssignments) {
        this.assignRespDtoList = pointAssignments;
    }

    public List<PointPoliceAssignmentRespDto> getAssignments() {
        return assignRespDtoList;
    }

    public void close() {
        if (exportXlsEventAssignmentView != null) {
            exportXlsEventAssignmentView.finishWriting();
        }
    }
}

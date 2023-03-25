package com.shyam.gujarat_police.io.write;

import com.shyam.gujarat_police.exceptions.ExcelException;
import ma.glasnost.orika.MapperFacade;
import org.modelmapper.ModelMapper;

public class ExportWriterFactory<T> {
    public static final int ASSIGNED_POLICE_EXPORT = 1;
    public ExportWriter<?> getExportFile(int exportType, String fileName, ModelMapper mapper) {
        switch (exportType) {
            case ASSIGNED_POLICE_EXPORT -> {
                return new AssignedPoliceInEventWriter(fileName, mapper);
            }
            default -> throw new ExcelException("Unsupported export type: " + exportType);
        }
    }
}

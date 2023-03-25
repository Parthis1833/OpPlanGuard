package com.shyam.gujarat_police.controllers;

import com.shyam.gujarat_police.exceptions.*;
import com.shyam.gujarat_police.response.APIResponse;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import java.util.logging.Logger;

@RestControllerAdvice
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class ExceptionController {

    private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(ExceptionController.class);

    @ExceptionHandler(value = DataNotFoundException.class)
    public APIResponse dataNotFound(DataNotFoundException dataNotFoundException){
        LOGGER.error(dataNotFoundException.getMessage());
        return APIResponse.error(dataNotFoundException.getMessage());
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public APIResponse handleMaxSizeException(MaxUploadSizeExceededException exc) {
//        return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body("File too large!");
        LOGGER.error(exc.getMessage());
        return APIResponse.error("File too large!");
    }


    @ExceptionHandler(value = ExcelException.class)
    public APIResponse excelProblem(ExcelException excelException){
//        return new ResponseEntity<>(excelException.getMessage(), HttpStatus.EXPECTATION_FAILED);
        LOGGER.error(excelException.getMessage());
        return APIResponse.error(excelException.getMessage());
    }


    @ExceptionHandler(value = DataAlreadyExistException.class)
    public APIResponse dataAlreadyExists(DataAlreadyExistException dataNotFoundException){
//        return new ResponseEntity<>(dataNotFoundException.getMessage(), HttpStatus.EXPECTATION_FAILED);
        LOGGER.error(dataNotFoundException.getMessage());
        return APIResponse.error(dataNotFoundException.getMessage());
    }

    @ExceptionHandler(value = DataInsertionException.class)
    public APIResponse dataInsertionException(DataInsertionException dataInsertionException){
//        return new ResponseEntity<>(dataInsertionException.getMessage(), HttpStatus.EXPECTATION_FAILED);
        LOGGER.error(dataInsertionException.getMessage());

        return APIResponse.error(dataInsertionException.getMessage());
    }

    @ExceptionHandler(value = InvalidDateFormatException.class)
    public APIResponse invalidDateFormatException(InvalidDateFormatException dateFormatException){
        LOGGER.error(dateFormatException.getMessage());
        return APIResponse.error(dateFormatException.getMessage());
    }

    @ExceptionHandler(value = PoliceAlreadyAssignedException.class)
    public APIResponse policeAlreadyAssignedException(PoliceAlreadyAssignedException policeAlreadyAssignedException){
        LOGGER.error(policeAlreadyAssignedException.getMessage());
        return APIResponse.error(policeAlreadyAssignedException.getMessage());
    }

    @ExceptionHandler(value = DateMisMatchException.class)
    public APIResponse dateMisMatchException(DateMisMatchException dateMisMatchException){
        LOGGER.error(dateMisMatchException.getMessage());
        return APIResponse.error(dateMisMatchException.getMessage());
    }
    @ExceptionHandler(value = InsufficientDataException.class)
    public APIResponse insufficientDataException(InsufficientDataException insufficientDataException){
        LOGGER.error(insufficientDataException.getMessage());
        return APIResponse.error(insufficientDataException.getMessage());
    }

    @ExceptionHandler(value = DataSavingException.class)
    public APIResponse dataSavingException(DataSavingException dataSavingException){
        LOGGER.error(dataSavingException.getMessage());
        return APIResponse.error(dataSavingException.getMessage());
    }
}

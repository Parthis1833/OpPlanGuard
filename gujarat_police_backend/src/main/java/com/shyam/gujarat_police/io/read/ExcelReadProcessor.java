package com.shyam.gujarat_police.io.read;

import com.shyam.gujarat_police.exceptions.CustomException;
import com.shyam.gujarat_police.io.ExcelDataObject;

public interface ExcelReadProcessor<Sheet> {

    /*
    * param could be null, it is provided to
    * */
    ExcelDataObject processSheet(Sheet sheet, ExcelDataObject obj, Object param) throws CustomException;

    void initMethod(String firebaseNode);
}

package com.shyam.gujarat_police.io;


import com.shyam.gujarat_police.exceptions.CustomException;
import com.shyam.gujarat_police.exceptions.ExcelException;
import com.shyam.gujarat_police.io.read.ExcelReadProcessor;
import com.shyam.gujarat_police.util.FileUtils;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Objects;

public class XlsReader {

    ExcelReadProcessor<Sheet> excelParser;
    ExcelDataObject excelDataObj = new ExcelDataObject();

    private static final Logger LOGGER = LoggerFactory.getLogger(XlsReader.class);

    public XlsReader(ExcelReadProcessor<Sheet> importParser) {
        this.excelParser = importParser;
    }

    public XlsReader(ExcelReadProcessor<Sheet> importParser, String pigeonNo) {
        this.excelParser = importParser;
        this.excelParser.initMethod(pigeonNo);
    }

    public ExcelDataObject read(File file, Object param) {

        if (Objects.nonNull(file)) {
            OPCPackage pkg = null;
            Workbook workbook = null;

            try {
                if (".xlsx".equalsIgnoreCase(FileUtils.getExtension(file.getAbsolutePath()))) {
                    FileInputStream excelFile = new FileInputStream(new File(file.getAbsolutePath()));
                    // pkg = OPCPackage.open(file.getAbsolutePath());
                    workbook = new XSSFWorkbook(excelFile);
                    for (Sheet sheet : workbook) {
                        if (Objects.nonNull(sheet)) {
                            if (!"ReadMe".equalsIgnoreCase(sheet.getSheetName())) {
                                ExcelDataObject data = excelParser.processSheet(sheet, excelDataObj, param);
                            }

                        }
                    }

                    excelFile.close();

                } else if (".xls".equalsIgnoreCase(FileUtils.getExtension(file.getAbsolutePath()))) {

                    workbook = WorkbookFactory.create(file, null, true);
                    for (Sheet sheet : workbook) {
                        if (Objects.nonNull(sheet)) {
                            if (!"ReadMe".equalsIgnoreCase(sheet.getSheetName())) {
                                if (sheet.getPhysicalNumberOfRows() > 0) {
                                    ExcelDataObject data = excelParser.processSheet(sheet, excelDataObj, param);
                                }
                            }
                        }
                    }

                } else {
                    throw new InvalidFormatException("Invalid format please try, xlsx or xls format");
                }
            } catch (CustomException e) {
                LOGGER.error(null, e);

            } catch (IOException e) {
                LOGGER.error(null, e);
                throw new CustomException(e.getMessage());
            } catch (EncryptedDocumentException e) {
                LOGGER.error(null, e);
                throw new ExcelException("document cannot be encrypted, please enter valid document");
            } catch (InvalidFormatException e) {
                LOGGER.error(null, e);
                throw new ExcelException(e.getMessage());
            } finally {
                if (workbook != null) {
                    try {
                        workbook.close();
                    } catch (IOException e) {
                        LOGGER.error(null, e);
                    }
                }
                /*
                 * if (pkg != null) { try { pkg.close(); } catch (Exception e) {
                 * LOGGER.error(null, e); } }
                 */
            }
        }
        return excelDataObj;
    }

}
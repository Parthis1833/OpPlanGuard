package com.shyam.gujarat_police.io.write;

import com.shyam.gujarat_police.annotations.ExcelValue;
import com.shyam.gujarat_police.util.TextUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class ExportXlsView {

    Workbook workbook = null;

    File file;

    int rowCount = 0;

    int sheetIndex = 0;

    Sheet currentSheet;

    CellStyle cellStyle;

    CellStyle cellStyleTime;

    private static final int MAX_ROWS = 59999;

    private static final Logger LOGGER = LoggerFactory.getLogger(ExportXlsView.class);

    public ExportXlsView(String fileName) {
        createWorkBook(fileName);
    }

    private void createWorkBook(String fileName) {
        workbook = new SXSSFWorkbook(3000);
        file = new File(fileName);
        initStyle();

    }

    private void initStyle() {

        cellStyle = workbook.createCellStyle();
        CreationHelper createHelper = workbook.getCreationHelper();
        cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd/MM/yyyy"));

        cellStyleTime = workbook.createCellStyle();
        CreationHelper createHelperTime = workbook.getCreationHelper();
        cellStyleTime.setDataFormat(createHelperTime.createDataFormat().getFormat("dd/MM/yyyy HH:mm"));
    }

    private void createNewSheet() {
        LOGGER.info("creating new sheet");
        sheetIndex++;
        currentSheet = workbook.createSheet("Order Export " + sheetIndex);
        rowCount = 0;
    }

    private <T> void writeHeader(List<T> data) {
        try {
            Font font = workbook.createFont();
            font.setFontName("Times New Roman");
            font.setBold(true);
            font.setFontHeightInPoints((short) 11);
            CellStyle style = workbook.createCellStyle();
            style.setFont(font);
            style.setVerticalAlignment(VerticalAlignment.CENTER);

            Row row = currentSheet.createRow(rowCount++);
            Map<String, ExcelValue> fieldNames = getFieldNamesForClass(data.get(0).getClass());
            for (Map.Entry<String, ExcelValue> fieldName : fieldNames.entrySet()) {
                Cell cell = row.createCell(fieldName.getValue().position());
                if (TextUtils.isEmpty(fieldName.getValue().name())) {
                    cell.setCellValue(fieldName.getKey());
                } else {
                    cell.setCellValue(fieldName.getValue().name());
                }
                cell.setCellStyle(style);
                row.setHeightInPoints(16f);
            }
            currentSheet.createFreezePane(0, 1);
        } catch (Exception e) {

        }

    }

    private <T> void checkSheetIndex(List<T> data) {

        if (rowCount > 0 && (rowCount + data.size() >= MAX_ROWS)) {
            processCurrentSheet();

        }

        if (rowCount == 0) {
            createNewSheet();
            writeHeader(data);
        }
    }

    private void processCurrentSheet() {
        // adjustColumnSize();
        rowCount = 0;
    }

    public void finishWriting() {
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(file, true);
            workbook.write(fos);
            fos.flush();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException e) {
                LOGGER.error("Export XLS Error", e);
            }
            try {
                if (workbook != null) {
                    workbook.close();
                }
            } catch (IOException e) {
                LOGGER.error("Export XLS Error", e);
            }
        }

    }

    public <T> void writeToExcel(List<T> data) {

        checkSheetIndex(data);

        try {
            Map<String, ExcelValue> fieldNames = getFieldNamesForClass(data.get(0).getClass());

            Class<? extends Object> classz = data.get(0).getClass();
            for (T t : data) {
                Row row = currentSheet.createRow(rowCount++);
                for (Map.Entry<String, ExcelValue> fieldName : fieldNames.entrySet()) {
                    Cell cell = row.createCell(fieldName.getValue().position());
                    Method method = null;
                    try {
                        method = classz.getMethod("get" + capitalize(fieldName.getKey()));
                    } catch (NoSuchMethodException nme) {
                        method = classz.getMethod("get" + fieldName.getKey());
                    }

                    Object value = method.invoke(t, (Object[]) null);
                    if (Objects.nonNull(value)) {
                        if (value instanceof String) {
                            cell.setCellValue((String) value);
                        } else if (value instanceof Long) {
                            cell.setCellValue((Long) value);
                        } else if (value instanceof Integer) {
                            cell.setCellValue((Integer) value);
                        } else if (value instanceof Double) {
                            cell.setCellValue((Double) value);
                        } else if (value instanceof BigDecimal) {
                            cell.setCellValue(((BigDecimal) value).doubleValue());
                        } else if (value instanceof Date) {
                            Date date = (Date) value;

                            if (hasTime(date)) {
                                Calendar c = Calendar.getInstance();
                                c.setTime(date);
                                c.add(Calendar.MINUTE, 330);
                                date = c.getTime();
                                cell.setCellStyle(cellStyleTime);
                            } else {
                                cell.setCellStyle(cellStyle);
                            }

                            cell.setCellValue(date);

                        }

                    } else {
                        cell.setCellValue("");
                    }
                }

            }

        } catch (Exception e) {
            LOGGER.error("Export XLS Error", e);
        }
    }

    public static boolean hasTime(Date date) {
        if (date == null) {
            return false;
        }
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        if (c.get(Calendar.HOUR_OF_DAY) > 0) {
            return true;
        }
        if (c.get(Calendar.MINUTE) > 0) {
            return true;
        }
        if (c.get(Calendar.SECOND) > 0) {
            return true;
        }
        if (c.get(Calendar.MILLISECOND) > 0) {
            return true;
        }
        return false;
    }

    // retrieve field names from a POJO class
    private static Map<String, ExcelValue> getFieldNamesForClass(Class<?> clazz) throws Exception {
        Map<String, ExcelValue> fieldNames = new HashMap<>();
        Field[] fields = clazz.getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            ExcelValue column = fields[i].getAnnotation(ExcelValue.class);
            if (column != null) {
                fieldNames.put(fields[i].getName(), column);
            }
        }
        return fieldNames;
    }

    // capitalize the first letter of the field name for retrieving value of the
    // field later
    private static String capitalize(String s) {
        if (s.length() == 0)
            return s;
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

}

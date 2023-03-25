package com.shyam.gujarat_police.util;

import com.shyam.gujarat_police.io.ExcelDataObject;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;

import java.io.FileWriter;
import java.util.*;

public class ImportUtil {

	public static boolean isEmptyRow(Row row) {
		for (int c = 0; c < row.getLastCellNum(); c++) {
			Cell cell = row.getCell(c);
			if (cell != null && cell.getCellTypeEnum() != CellType.BLANK)
				return false;
		}
		return true;
	}

	public static String getExcelValue(Object obj) {
		if (obj instanceof Number) {
			return String.valueOf(obj);
		} else {
			return obj == null ? null : obj.toString().trim();
		}
	}

	public static String parseCellValue(Object object) {
		if (object instanceof Number) {
			Double doubleValue = (Double) object;
			if (doubleValue % 1 == 0) {
				return String.valueOf(doubleValue.longValue());
			} else {
				return String.valueOf(doubleValue);
			}
		} else {
			return object == null ? null : String.valueOf(object).trim();
		}
	}

	public static Object cellValue(Cell cell) {

		if (cell != null) {

			switch (cell.getCellTypeEnum()) {
			case NUMERIC:
				return cell.getNumericCellValue();
			case BOOLEAN:
				return cell.getBooleanCellValue();
			case STRING:
				return cell.getStringCellValue();
			case FORMULA:
				switch (cell.getCachedFormulaResultTypeEnum()) {
				case BOOLEAN:
					return cell.getBooleanCellValue();

				case NUMERIC:
					return cell.getNumericCellValue();

				case STRING:
					return cell.getStringCellValue();
				default:
					break;

				}
			default:
				return null;
			}
		}
		return null;
	}

	public static Map<String, Integer> columnNameColumnIndex(Row row) {
		Map<String, Integer> columnNameColumnIndex = new HashMap<>(0);
		if (Objects.nonNull(row)) {
			int index = 0;
			for (Cell cell : row) {
				columnNameColumnIndex.put(cell.getStringCellValue(), index++);
			}
		}
		return columnNameColumnIndex;
	}

	public static List<String> verifyHeader(Map<String, Integer> defaultHeader, List<String> list) {
		List<String> temporaryHeader = new ArrayList<>(list);
		temporaryHeader.removeAll(defaultHeader.keySet());

		if (temporaryHeader.isEmpty()) {
			// All required columns found.
			return null;
		} else {
			return temporaryHeader;
		}
	}

	public static String createOrderUpdateErrorFile(ExcelDataObject importProcessResult) {
		FileWriter fw = null;
		String fileName = null;
		try {
			fileName = FileUtils.createTempFile("txt");
			fw = new FileWriter(fileName);
			fw.write("\nSuccessfully Inserted: " + importProcessResult.getSuccessCount());
			fw.write("\nFailed: " + importProcessResult.getFailureCount());

			if (importProcessResult.getErrorList().size() > 0) {
				fw.write("\n\nErrors:");
			}
			StringBuilder sb = new StringBuilder("");

			importProcessResult.getErrorList().forEach(v -> {
				sb.append("\n" + v);

			});
			fw.write(sb.toString());

		} catch (Exception e) {
		} finally {
			try {
				if (Objects.nonNull(fw))
					fw.close();
			} catch (Exception e) {

			}
		}

		return fileName;

	}

}

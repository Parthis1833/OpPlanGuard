package com.shyam.gujarat_police.util;

import java.util.Date;
import java.util.Objects;

public class ObjectUtil {

	public static String optString(Object object) {
		if (Objects.nonNull(object)) {
			return String.valueOf(object);
		}
		return null;
	}

	public static Long optLong(Object object) {
		String number = optString(object);
		if (RegExUtil.isNumber(number)) {
			return Long.valueOf(number);
		}
		return null;
	}

	public static Long optLong(Object object, Long def) {
		String number = optString(object);
		if (RegExUtil.isNumber(number)) {
			return Long.valueOf(number);
		}
		return def;
	}

	public static Boolean optBoolean(Object obj) {
		return Boolean.parseBoolean(String.valueOf(obj));
	}

	public static Integer optInteger(Object object) {
		String number = optString(object);
		if (RegExUtil.isNumber(number)) {
			return Integer.valueOf(number);
		}
		return null;
	}

	public static Integer optInteger(Object object, Integer defaultVal) {
		String number = optString(object);
		if (RegExUtil.isNumber(number)) {
			return Integer.valueOf(number);
		}
		return defaultVal;
	}

	public static Integer optIntegerDashToZero(Object object, Integer defaultVal) {
		String number = optString(object);
		if (RegExUtil.isNumber(number)) {
			return Integer.valueOf(number);
		}
		return defaultVal;
	}

	public static Short optShort(Object object) {
		String number = optString(object);
		if (RegExUtil.isNumber(number)) {
			return Short.valueOf(number);
		}
		if (RegExUtil.isBoolean(number)) {
			return (short) (Boolean.valueOf(number) ? 1 : 0);
		}
		return null;
	}



	public static Short optShort(Object object, Short defaultVal) {
		String number = optString(object);
		if (RegExUtil.isNumber(number)) {
			return Short.valueOf(number);
		}
		if (RegExUtil.isBoolean(number)) {
			return (short) (Boolean.valueOf(number) ? 1 : 0);
		}
		return defaultVal;
	}

	public static Double optDouble(Object object) {
		String number = optString(object);
		if (RegExUtil.isFloatingNumber(number)) {
			return Double.valueOf(number);
		}
		return null;
	}

	public static Float optFloat(Object object) {
		String number = optString(object);
		if (RegExUtil.isFloatingNumber(number)) {
			return Float.valueOf(number);
		}
		return null;
	}

	public static Float optFloat(Object object, float f) {
		String number = optString(object);
		if (RegExUtil.isFloatingNumber(number)) {
			return Float.valueOf(number);
		}
		return f;
	}

	public static Double optDouble(Object object, Double defaultValue) {
		Double dVal = optDouble(object);

		return (Objects.isNull(dVal) ? defaultValue : dVal);
	}

	public static Date optDate(Object object) {
		String date = optString(object);
		if (Objects.nonNull(date)) {
			return CustomDateUtils.parse(date, CustomDateUtils.DatePatern.Y_M_D__HMS);
		}
		return null;
	}


	public static Date parseExcelDate(Object object) {
		String date = optString(object);
		if (Objects.nonNull(date)) {
			return CustomDateUtils.parse(date, CustomDateUtils.DatePatern.DEFAULT_PATTERN);
		}
		return null;
	}

	public static Date optDateWithoutTime(Object object) {
		String date = optString(object);
		if (Objects.nonNull(date)) {
			return CustomDateUtils.parse(date, CustomDateUtils.DatePatern.Y_M_D);
		}
		return null;
	}
}

package com.shyam.gujarat_police.util;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegExUtil {

	public static boolean isNumber(String value) {
		return value != null ? value.matches("^-?[0-9]\\d*(\\.\\d+)?$") : false;
	}
	public static boolean isNumber(Integer value) {
		return value != null ? String.valueOf(value).matches("^-?[0-9]\\d*(\\.\\d+)?$") : false;
	}

	public static boolean isBoolean(String value) {
		return value != null ? value.matches("^(?i)(true|false)$") : false;
	}

	public static boolean isAlphaNumeric(String value) {
		return value != null && !value.isEmpty() ? value.matches("^[a-zA-Z0-9]*$") : false;
	}

	public static boolean isFloatingNumber(String value) {
		return value != null ? (value.matches("[0-9]*\\.?[0-9]+") || value.matches("[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)"))
				: false;
	}

	public static boolean isFloatingNumberWithNegative(String value) {
		return value != null ? value.matches("^([+-]?\\d*\\.?\\d*)$") : false;
	}

	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	private static Pattern emailPattern = Pattern.compile(EMAIL_PATTERN);

	public static boolean validEmail(String email) {
		if (Objects.nonNull(email)) {
			return emailPattern.matcher(email).matches();
		}
		return false;
	}

	public static boolean validPhone(String phone) {

		if(null == phone){
			return false;
		}
		Pattern regex = Pattern.compile("(0/91)?[6-9][0-9]{9}");
		return regex.matcher(phone).find();

	}

	public static String getMatchedPatternContent(Pattern matchPattern, String str) {
		String strBody = "";
		Matcher matcher = matchPattern.matcher(str);
		if (matcher.find()) {
			strBody = matcher.group(1);
		}
		return strBody;
	}

	public static boolean isEmail(String query) {
		try {
			if (TextUtils.isEmpty(query)) {
				return false;
			}
			Pattern regex = Pattern.compile("\\b[\\w.%-]+@[-.\\w]+\\.[A-Za-z]{2,4}\\b");
			return regex.matcher(query).find();
		} catch (Exception e) {
			return false;
		}
	}
}

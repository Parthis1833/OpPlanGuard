package com.shyam.gujarat_police.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;


public class CustomDateUtils {

	private static Date	startDate;

	private static final TimeZone DEFAULT_TIMEZONE = TimeZone.getTimeZone("UTC");

	public enum DatePatern {
		DEFAULT_PATTERN("dd/MM/yyyy HH:mm:ss"), Y_M_D_T_HMSX("yyyy-MM-dd'T'HH:mm:ssXXX"), Y_M_D_T_HMSZ(
			"yyyy-MM-dd'T'HH:mm:ss'Z'"),
		Y_M_D_T_HMSZ2("yyyyMMdd'T'HHmmss'Z'"),
		// Y_M_D_T_HMSZ("yyyy-MM-dd'T'HH:mm:ss'Z'"),
		Y_M_D__HMS("yyyy-MM-dd HH:mm:ss"), Y_M_D__HM("yyyy-MM-dd HH:mm"), Y_M_D__HMZ("yyyy-MM-dd HH:mm'Z'"), Y_M_D(
			"yyyy-MM-dd"),
		Y_M_D_2("yyyyMMdd"), E_D_M_Y__HMSZ("EEE, dd MMM yyyy HH:mm:ss +0000"), Y_M_D__HMSZ(
			"yyyy-MM-dd HH:mm:ss'Z'"),
		SYSTEM_TIME("dd MMM yyyy hh:mm:ss a"), D_M_Y(
			"dd-MM-yyyy"),
		Y_M_d_HMSZ0("yyyy-MM-dd HH:mm:ssZ"), Y_M_D_T_HMS(
			"yyyy-MM-dd'T'HH:mm:ss"),
		M_D_Y("MM-dd-yyyy");

		private String pattern;

		private DatePatern(String pattern) {
			this.pattern = pattern;
		}

		public String getPattern() {

			return this.pattern;
		}
	}

	private static SimpleDateFormat getDateFormatter(DatePatern pattern, TimeZone timeZone) {

		SimpleDateFormat sdf = null;
		if (pattern != null) {
			sdf = new SimpleDateFormat(pattern.getPattern());
		} else {
			sdf = new SimpleDateFormat(DatePatern.DEFAULT_PATTERN.getPattern());
		}
		sdf.setTimeZone(timeZone);
		return sdf;
	}

	/**
	 * @author vicky.thakor
	 * @param pattern
	 * @param timeZone
	 * @return
	 */
	private static SimpleDateFormat getDateFormatter(String pattern, TimeZone timeZone) {

		SimpleDateFormat sdf = null;
		if (pattern != null) {
			sdf = new SimpleDateFormat(pattern);
		} else {
			sdf = new SimpleDateFormat(DatePatern.DEFAULT_PATTERN.getPattern());
		}
		sdf.setTimeZone(timeZone);
		return sdf;
	}

	public static long getCurrentTimeInMillis() {

		return System.currentTimeMillis();
	}

	public static String formatAndEncode(Date date, DatePatern pattern, String encoding) throws UnsupportedEncodingException {

		return URLEncoder.encode(format(date, pattern), encoding);
	}

	public static String formatAndEncode(Date date, DatePatern pattern, TimeZone timeZone, String encoding) throws UnsupportedEncodingException {

		return URLEncoder.encode(format(date, pattern, timeZone), encoding);
	}

	public static String format(Date date, DatePatern pattern) {

		return format(date, pattern, DEFAULT_TIMEZONE);
	}

	/**
	 * @author vicky.thakor
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String format(Date date, String pattern) {

		return format(date, pattern, DEFAULT_TIMEZONE);
	}

	public static String format(Date date, DatePatern pattern, TimeZone timeZone) {

		SimpleDateFormat sdf = getDateFormatter(pattern, timeZone);
		return sdf.format(date);
	}

	/**
	 * @author vicky.thakor
	 * @param date
	 * @param pattern
	 * @param timeZone
	 * @return
	 */
	public static String format(Date date, String pattern, TimeZone timeZone) {

		SimpleDateFormat sdf = getDateFormatter(pattern, timeZone);
		return sdf.format(date);
	}

	public static String reduceAndFormat(Date date, int type, int amount, DatePatern pattern) {

		return format(addInDate(date, type, -amount), pattern);
	}

	/**
	 * 
	 * @param date
	 * @param type
	 *            Calendar.DAY_OF_MONTH
	 * @param amount
	 * @param pattern
	 * @return
	 */
	public static String incrementAndFormat(Date date, int type, int amount, DatePatern pattern) {

		return format(addInDate(date, type, amount), pattern);
	}

	public static Date parse(String dateString, DatePatern pattern) {

		return parse(dateString, pattern, DEFAULT_TIMEZONE);
	}

	public static Date parse(String dateString, DatePatern pattern, TimeZone timeZone) {

		SimpleDateFormat sdf = getDateFormatter(pattern, timeZone);
		try {
			return sdf.parse(dateString);
		} catch (ParseException e) {
			return null;
		} finally {}
	}

	public static long dateToEpochSeconds(Date date) {

		return date.getTime() / 1000;
	}

	public static Date epochSecondsToDate(long epochSeconds, TimeZone timeZone) {

		return Date.from(Instant.ofEpochSecond(epochSeconds).atZone(timeZone.toZoneId()).toInstant());
	}

	public static Date epochSecondsToDate(long epochSeconds) {

		return epochSecondsToDate(epochSeconds, DEFAULT_TIMEZONE);
	}

	public static Date reduce(Date date, int type, int amount) {

		return addInDate(date, type, -amount);
	}

	public static Date increment(Date date, int type, int amount) {

		return addInDate(date, type, amount);
	}

	public static long daysBetween(Date dateFrom, Date dateTo) {

		return ChronoUnit.DAYS.between(dateFrom.toInstant(), dateTo.toInstant());
	}

	private static Date addInDate(Date date, int type, int amount) {

		Calendar cal = Calendar.getInstance();
		if (date != null) {
			cal.setTime(date);
			cal.add(type, amount);
		}
		return cal.getTime();
	}

	public static Date today() {

		return new Date();
	}

	public static boolean isFutureDate(Date date) {

		if (date.after(today())) {
			return true;
		}
		return false;
	}

	/**
	 * Get date 1970-01-01
	 * 
	 * @return
	 */
	public static Date startOfCalender() {

		if (startDate == null) {
			Calendar calendar = Calendar.getInstance();
			calendar.set(1970, Calendar.JANUARY, 1);
			startDate = calendar.getTime();
		}
		return startDate;
	}

	public static Date getDate(int year, int month, int date) {

		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month, date);
		return calendar.getTime();
	}

	/**
	 * 
	 * @param date1
	 * @param date2
	 * @return Time difference in milliseconds between two dates
	 */
	public static Long millisecondsBetween(Date date1, Date date2) {

		if (date1 != null && date2 != null) {
			return Math.abs(date1.getTime() - date2.getTime());
		}
		return null;
	}
	// public static void main(String[] args) {
	// Calendar c = Calendar.getInstance();
	// c.set(2016, Calendar.JANUARY, 1);
	//
	// Calendar c2 = Calendar.getInstance();
	// c2.set(2016, Calendar.APRIL, 6, 5, 25);
	// DatePatern.Y_M_D__HM));
	// DatePatern.Y_M_D_T_HMSX));
	// }

	/**
	 * @author vicky.thakor
	 * @since 2017-07-12
	 * @param dateFrom
	 * @param dateTo
	 * @return
	 */
	public static int minutesBetween(Date dateFrom, Date dateTo) {
		return (int) ChronoUnit.MINUTES.between(dateFrom.toInstant(), dateTo.toInstant());
	}

	/**
	 * @author Harsh
	 * @since 21 Aug, 2017
	 * @param dateString
	 * @param pattern
	 * @param fromZoneId
	 * @param toZoneId
	 * @return dateString in same pattern
	 */
	public static String convertDateTimeZone(String dateString, DatePatern pattern, ZoneId fromZoneId, ZoneId toZoneId) {

		LocalDateTime ldt = LocalDateTime.parse(dateString, DateTimeFormatter.ofPattern(pattern.getPattern()));
		ZonedDateTime toZonedDateTime = ldt.atZone(fromZoneId).withZoneSameInstant(toZoneId);

		return toZonedDateTime.format(DateTimeFormatter.ofPattern(pattern.getPattern()));
	}
}

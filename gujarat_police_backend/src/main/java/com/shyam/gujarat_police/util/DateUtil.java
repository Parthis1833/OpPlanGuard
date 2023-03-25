package com.shyam.gujarat_police.util;

import com.shyam.gujarat_police.exceptions.InvalidDateFormatException;
import org.joda.time.DateTimeComparator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {

	private static final Logger LOG = LoggerFactory.getLogger(DateUtil.class);
	private static final String[] MONTHINT = new String[] { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
			"11", "12" };

	public static boolean isValidFormat(String format, String value) {
		Date date = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			date = sdf.parse(value);
			if (!value.equals(sdf.format(date))) {
				date = null;
			}
		} catch (Exception ex) {
			LOG.error("dateUtil", ex);
			throw new InvalidDateFormatException("Invalid date format: " + value + " it should be dd/MM/yyyy" );
		}
		return date != null;
	}

	public static Date stringToDate(String pattern, String schedule) {
		Date date = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			date = sdf.parse(schedule);

		} catch (Exception e) {
			// TODO: handle exception
			throw new InvalidDateFormatException("Invalid date format: " + schedule + " it should be dd/MM/yyyy" );
		}
		return date;
	}

	public static Date addSeconds(Date date, Integer sec) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.SECOND, sec);
		return calendar.getTime();
	}

	public static String dateToString(Date date) {
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return null;
	}
	public static String dateToString(Date date, String pattern) {
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat(pattern);
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return null;
	}

	public static String dateToISTString(Date date) {
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			dateFormat_DMY.setTimeZone(TimeZone.getTimeZone("IST"));
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return null;
	}

	public static String exportDate(Date date) {

		if (date == null) {
			return "";
		}
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			dateFormat_DMY.setTimeZone(TimeZone.getTimeZone("IST"));
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return null;
	}

	public static String dateToISTString(Date date, String format) {

		if(null == date){
			return null;
		}
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat(format);
			dateFormat_DMY.setTimeZone(TimeZone.getTimeZone("IST"));
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return null;
	}

	public static String dateToString(String pattern, Date expiryDate) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(expiryDate);
	}

	public static String dateToYMDString(Date date) {
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return null;
	}

	public static String dateToYMDString(Date date, String pattern) {
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat(pattern);
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return null;
	}

	public static Date dateStringToISTDate(String fromDate, boolean isFromDate) {
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat("yyyy-MM-dd");
			Date d = dateFormat_DMY.parse(fromDate);
			Calendar c = Calendar.getInstance();
			c.setTime(d);
			if (isFromDate) {
				c.add(Calendar.DATE, -1);
			}
			c.set(Calendar.HOUR_OF_DAY, 18);
			c.set(Calendar.MINUTE, 30);
			c.set(Calendar.SECOND, 0);
			return c.getTime();
		} catch (Exception ex) {

		}

		return null;
	}

	public static String formatDelhiveryDate(String date) {
		if (TextUtils.isBlank(date)) {
			return "";
		}

		if (date.contains(".")) {
			date = date.split("\\.")[0];
		}

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		try {
			Date da = dateFormat.parse(date);
			SimpleDateFormat dateFormatNew = new SimpleDateFormat("dd-MMM-yyyy hh:mm a");
			String s = dateFormatNew.format(da);
			return s;
		} catch (ParseException e) {

		}

		return "";

	}

	public static Date getExportIstDateValue(String fromDate, boolean isStart) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d;
		try {
			d = sdf.parse(fromDate);
			Calendar c = Calendar.getInstance();
			c.setTime(d);
			if (isStart) {
				c.add(Calendar.DATE, -1);
			}
			c.set(Calendar.HOUR_OF_DAY, 18);
			c.set(Calendar.MINUTE, 30);
			c.set(Calendar.SECOND, 00);
			return c.getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public static String getExportIstDate(String fromDate, boolean isStart) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfNew = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d;
		try {
			d = sdf.parse(fromDate);
			Calendar c = Calendar.getInstance();
			c.setTime(d);
			if (isStart) {
				c.add(Calendar.DATE, -1);
			}
			c.set(Calendar.HOUR_OF_DAY, 18);
			c.set(Calendar.MINUTE, 30);
			c.set(Calendar.SECOND, 00);
			return sdfNew.format(c.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public static String formatMMYYYY(Double mon, Double yr) {
		int month = mon.intValue();
		int year = yr.intValue();
		return year + "-" + MONTHINT[month - 1];
	}

	public static String getDelhiveryEdd(String string) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfNew = new SimpleDateFormat("dd MMMM yyyy");
		try {
			Date d = sdf.parse(string);
			return sdfNew.format(d);
		} catch (ParseException e) {

		}

		return null;
	}

	public static String getPickrrEdd(String string) {
		/*
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); SimpleDateFormat
		 * sdfNew = new SimpleDateFormat("dd MMMM yyyy"); try { Date d =
		 * sdf.parse(string); return sdfNew.format(d); } catch (ParseException e) {
		 * 
		 * }
		 */
		try {
			return string.split(",")[0];
		} catch (Exception e) {

		}
		return null;
	}

	public static String dateToDisplayDate(Date fromDate, boolean isFrom) {
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat("dd-MMM-yyyy");
			if (isFrom) {
				dateFormat_DMY.setTimeZone(TimeZone.getTimeZone("IST"));
			}
			return dateFormat_DMY.format(fromDate);
		} catch (Exception ex) {

		}

		return null;
	}

	public static String appDisplay(Date date) {
		if (date == null) {
			return "";
		}
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat("dd-MMM-yyyy");
			dateFormat_DMY.setTimeZone(TimeZone.getTimeZone("IST"));
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return "";
	}

	public static String appDisplayTime(Date date) {
		if (date == null) {
			return "";
		}
		try {
			SimpleDateFormat dateFormat_DMY = new SimpleDateFormat("hh:mm a");
			dateFormat_DMY.setTimeZone(TimeZone.getTimeZone("IST"));
			return dateFormat_DMY.format(date);
		} catch (Exception ex) {

		}

		return "";
	}

	public static String isValidBluedartEdd(String edd) {
		try {

			String[] val = edd.split("-");

			Calendar cal = Calendar.getInstance();
			cal.set(Integer.parseInt(val[2]), Integer.parseInt(val[1]) - 1, Integer.parseInt(val[0]));
			if ((cal.getTimeInMillis() - System.currentTimeMillis()) < 6 * 3600 * 1000L) {
				return null;
			}

			SimpleDateFormat sdfNew = new SimpleDateFormat("dd MMMM yyyy");
			return sdfNew.format(cal);
		} catch (Exception ex) {

		}

		return null;
	}

	public static String isValidShipRocketEdd(String etd) {
		try {

			DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			DateFormat outputFormat = new SimpleDateFormat("dd MMMM yyyy");
			Date date = inputFormat.parse(etd);

			if ((date.getTime() - System.currentTimeMillis()) < 6 * 3600 * 1000L) {
				return null;
			}

			String result_date = outputFormat.format(date);
			return result_date;
		} catch (Exception ex) {
			return null;
		}
	}

    public static String getDate(Date date) {
		try {
			DateFormat outputFormat = new SimpleDateFormat("dd MMM");
			return outputFormat.format(date);
		} catch (Exception ex) {
			return null;
		}
    }

    public static Date extractDateFromEdd(String edd1, String courier) {
		try {
			if(TextUtils.isBlank(edd1)){
				return null;
			}
			if(courier != null && courier.equalsIgnoreCase("pickrr")){
				DateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
				return inputFormat.parse(edd1.split(" ")[0]);
			} else {
				DateFormat inputFormat = new SimpleDateFormat("dd MMMM yyyy");
				return inputFormat.parse(edd1);
			}

		} catch (Exception ex) {
			return null;
		}
    }



	public static Date extractDateStringFromEdd(String edd1, String courier) {
		try {
			if(TextUtils.isBlank(edd1)){
				return null;
			}
			if(courier != null && courier.equalsIgnoreCase("pickrr")){
				DateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
				return inputFormat.parse(edd1.split(" ")[0]);
			} else {
				DateFormat inputFormat = new SimpleDateFormat("dd MMMM yyyy");
				return inputFormat.parse(edd1);
			}

		} catch (Exception ex) {
			return null;
		}
	}

    public static boolean IsEqualDates(Date expDate, Date edd) {
		return DateTimeComparator.getDateOnlyInstance().compare(expDate, edd) == 0;
    }

	public static boolean isDateBeforeOrEqual(Date startDate, Date endDate) {
		return startDate.before(endDate) || sameDay(startDate, endDate);
	}

	public static boolean isDateAfterOrEqual(Date startDate, Date endDate) {
		return startDate.after(endDate) || sameDay(startDate, endDate);
	}


	public static boolean sameDay(Date d1, Date d2){
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
		return fmt.format(d1).equals(fmt.format(d2));
	}
}

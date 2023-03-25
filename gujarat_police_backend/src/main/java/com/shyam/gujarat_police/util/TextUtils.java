package com.shyam.gujarat_police.util;


import com.shyam.gujarat_police.exceptions.CustomException;

/**
 * @since 4.3
 */
public final class TextUtils {

    /**
     * Returns true if the parameter is null or of zero length
     */
    public static boolean isEmpty(final CharSequence s) {
        if (s == null) {
            return true;
        }
        return s.length() == 0;
    }

    /**
     * Returns true if the parameter is null or contains only whitespace
     */
    public static boolean isBlank(final CharSequence s) {
        if (s == null) {
            return true;
        }
        for (int i = 0; i < s.length(); i++) {
            if (!Character.isWhitespace(s.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean notBlankNotEmpty(String s) {
        if (s == null) {
            return false;
        }
        return s.trim().length() != 0;
    }
    public static String notBlankNotEmptyWithDefault(String s, String defaultValue){
        if (s == null){
            return defaultValue;
        }
        return s.trim().length() == 0 ? defaultValue : s;
    }
    /**
     * @since 4.4
     */
    public static boolean containsBlanks(final CharSequence s) {
        if (s == null) {
            return false;
        }
        for (int i = 0; i < s.length(); i++) {
            if (Character.isWhitespace(s.charAt(i))) {
                return true;
            }
        }
        return false;
    }

    public static String notBlankNotEmptyOrError(String s, String errorMsg) {
        if (notBlankNotEmpty(s)){
            return s;
        }
        throw new CustomException(errorMsg);
    }

}


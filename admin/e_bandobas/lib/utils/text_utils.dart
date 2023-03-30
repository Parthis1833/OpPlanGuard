import 'package:e_bandobas/app/Exceptions/custom_exception.dart';

class TextUtils {

    /**
     * Returns true if the parameter is null or of zero length
     */
    static bool isEmpty(final String? s) {
        if (s == null) {
            return true;
        }
        return s.isEmpty;
    }

    static bool notBlankNotEmpty(String? s) {
        if (s == null) {
            return false;
        }
        return s.trim().isNotEmpty;
    }
    
    static String notBlankNotEmptyWithDefault(String? s, String defaultValue){
        if (s == null){
            return defaultValue;
        }
        return s.trim().isEmpty ? defaultValue : s;
    }
    /**
     * @since 4.4
     */
    static bool containsBlanks(final String? s) {
        if (s == null) {
            return false;
        }
        for (int i = 0; i < s.length; i++) {
            if (s[i] == " ") {
                return true;
            }
        }
        return false;
    }

    static String notBlankNotEmptyOrError(String s, String errorMsg) {
        if (notBlankNotEmpty(s)){
            return s;
        }
        throw CustomException(errorMsg);
    }

}


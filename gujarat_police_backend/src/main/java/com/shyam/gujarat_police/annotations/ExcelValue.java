package com.shyam.gujarat_police.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface ExcelValue {

    /**
     * Header name associated with this field name.
     *
     * @since 30-Apr-2018 - 5:22:57 AM
     * @author mihir
     * @return
     */
    String name() default "";

    /**
     * column position to write to excel.
     *
     * @since 30-Apr-2018 - 5:23:20 AM
     * @author mihir
     * @return
     */
    int position();
}

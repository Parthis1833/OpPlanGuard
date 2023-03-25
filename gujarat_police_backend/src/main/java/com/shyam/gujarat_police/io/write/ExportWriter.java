package com.shyam.gujarat_police.io.write;

import java.util.List;

public interface ExportWriter<T> {
    void exportToExcel(List<T> t);

}

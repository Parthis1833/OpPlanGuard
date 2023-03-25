package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.PoliceStation;

public interface PoliceStationBaseRepository {
    boolean isStationExists(PoliceStation station);
    boolean isStationExists(String stationName);

}

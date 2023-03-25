package com.shyam.gujarat_police.repositories.impl;

import com.shyam.gujarat_police.entities.PoliceStation;
import com.shyam.gujarat_police.repositories.BaseRepository;
import com.shyam.gujarat_police.repositories.PoliceStationBaseRepository;

import javax.persistence.Query;
import javax.persistence.Tuple;
import java.util.List;

public class PoliceStationBaseRepositoryImpl extends BaseRepository<PoliceStation> implements PoliceStationBaseRepository {

    @Override
    public boolean isStationExists(PoliceStation station) {
        String queryString = "select ps from PoliceStation ps where " +
                "(ps.district = :district " +
                "or ps.districtInGuj = :districtInGuj) " +
                "and (ps.policeStationName = :policeStationName " +
                "or ps.policeStationNameInGujarati = :policeStationNameInGujarati) ";
//        String queryString = "Select ps from PoliceStation ps";
        Query query = entityManager.createQuery(queryString, Tuple.class);
        query.setParameter("district", station.getDistrict());
        query.setParameter("districtInGuj", station.getDistrictInGuj());
        query.setParameter("policeStationName", station.getPoliceStationName());
        query.setParameter("policeStationNameInGujarati", station.getPoliceStationNameInGujarati());

        List<Tuple> tupleList = query.getResultList();
        return tupleList.size() > 0;
    }

    @Override
    public boolean isStationExists(String stationName) {
        String queryString = "select ps from PoliceStation ps where " +
                "ps.stationName = :stationName or ps.stationNameInGujarati = :stationName";
//        String queryString = "Select ps from PoliceStation ps";
        Query query = entityManager.createQuery(queryString, Tuple.class);
        query.setParameter("stationName", stationName);

        List<Tuple> tupleList = query.getResultList();
        return tupleList.size() > 0;
    }

//    @Override
//    public PoliceStation findbyPoliceStationName(String stationName) {
//        String queryString = "select ps from PoliceStation ps where " +
//                "ps.stationName = :stationName or ps.stationNameInGujarati = :stationName";
////        String queryString = "Select ps from PoliceStation ps";
//        Query query = entityManager.createQuery(queryString, Tuple.class);
//        query.setParameter("stationName", stationName);
//
//        List<Tuple> tupleList = query.getResultList();
//        PoliceStation policeStation = new PoliceStation();
//        Tuple tuple = tupleList.get(0);
//        policeStation.setId(ObjectUtil.optLong(tuple.get("id")));
//        policeStation.setPolice(tuple.get("police"));
//        return policeStation;
//        return query.getResultList().get(0);
//    }

}

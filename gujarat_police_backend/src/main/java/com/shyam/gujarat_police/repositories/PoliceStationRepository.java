package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.dto.response.DistrictTalukaAndPoliceStationNameRespDto;
import com.shyam.gujarat_police.entities.PoliceStation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PoliceStationRepository extends JpaRepository<PoliceStation, Long>, PoliceStationBaseRepository {
    Optional<PoliceStation> findByPoliceStationName(String stationName);

    @Query("select station from PoliceStation station where station.policeStationName like ?1 or station.policeStationNameInGujarati like ?2")
    List<PoliceStation> findByNameInGujaratiOrEnglish(String nameInEnglish, String nameInGujarati);

//    @Query("select new com.smytten.order.dto.ProductRatingDto(count(id), round(ratingNumber), count(comment) as c) from OrderFeedback where productId = ?1 and ratingNumber > 0 and orderType = 'trial' group by round(ratingNumber) order by 2")

    @Query("select new com.shyam.gujarat_police.dto.response.DistrictTalukaAndPoliceStationNameRespDto( ps.district, ps.districtInGuj, ps.taluko, ps.talukoInGuj, ps.policeStationName, ps.policeStationNameInGujarati ) from PoliceStation ps")
    List<DistrictTalukaAndPoliceStationNameRespDto> getDistrictTalukaAndPoliceStation();

    @Query("select ps from PoliceStation ps where ps.policeStationName = ?1 or ps.policeStationNameInGujarati = ?1")
    List<PoliceStation> findbyPoliceStationNameOrNameInGuj(String stationName);

}

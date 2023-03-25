package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.PointPoliceCount;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PointPoliceCountRepository extends PagingAndSortingRepository<PointPoliceCount, Long>, PointPoliceCountBaseRepository {

    @Query("select count(eppc.eventId) > 0  from PointPoliceCount as eppc where eppc.eventId = :eventId and eppc.pointId = :pointId")
    boolean checkEventAndPointAllocationExists(Long eventId, Long pointId);

    @Query("select ppc from PointPoliceCount as ppc where ppc.eventId = :eventId and ppc.pointId = :pointId")
    List<PointPoliceCount> getAllByEventAndPointId(Long eventId, Long pointId);


    List<PointPoliceCount> findByEventId(Long eventId);

    @Query("select ppc from PointPoliceCount ppc where ppc.eventId = ?1")
    List<PointPoliceCount> getAllByEventId(Long eventId);

    @Query("select ppc.pointId from PointPoliceCount ppc where ppc.eventId = ?1 group by ppc.pointId")
    List<Long> getAllPointIdsForEvent(Long eventId);
}

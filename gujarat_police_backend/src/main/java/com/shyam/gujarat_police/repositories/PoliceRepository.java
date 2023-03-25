package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.Police;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
public interface PoliceRepository extends PagingAndSortingRepository<Police, Long>, PoliceBaseRepository     {
    @Query("select p from Police p where p.buckleNumber = ?1 and p.event.id = ?2")
    Optional<Police> getByBuckleNumberAndEventId(String buckleNumber, Long eventId);

    @Query("select p from Police p where p.event.id = :eventId and p.isAssigned=false and p.designation.id = :designationId")
    List<Police> getUnassignedPoliceOfDesignation(Long eventId, Long designationId);

    @Query("select p from Police p where p.event.id = :eventId and p.isAssigned=false")
    List<Police> getUnassignedPoliceInEvent(Long eventId);

    @Query("select p from Police p where p.event.id = :eventId and p.designation.id = :designationId")
    List<Police> getPoliceByEventIdAndDesignation(Long eventId, Long designationId);

    @Query("SELECT p FROM Police p where p.event.id = :eventId and p.isAssigned = false and p.fullName LIKE CONCAT('%',:searchPoliceName,'%')")
    List<Police> getUnassignedPoliceBySearchInEvent(Long eventId, String searchPoliceName);

    @Transactional
    @Modifying
    @Query("update Police p set p.isAssigned = true where p.id in (?1)")
    void updatePoliceAssignStatusAssigned(List<Long> ids);

    @Transactional
    @Modifying
    @Query("update Police p set p.isAssigned = false where p.event.id = ?1")
    int unAssignFromEventId(Long eventId);

    @Query("select p from Police p where p.event.id = ?1")
    List<Police> getByEventId(Long eventId);
}

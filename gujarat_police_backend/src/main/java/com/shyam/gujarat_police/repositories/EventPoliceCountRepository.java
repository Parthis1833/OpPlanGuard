package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.EventPoliceCount;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EventPoliceCountRepository extends PagingAndSortingRepository<EventPoliceCount, Long>,  EventPoliceCountBaseRepository{

    @Query("select epc from EventPoliceCount as epc where epc.event.id = :eventId")
    List<EventPoliceCount> getAllByEvent(Long eventId);

    @Query("select epc.event.id from EventPoliceCount as epc group by epc.event.id")
    List<Long> getAllEventIds();

    @Query("select epc from EventPoliceCount as epc where epc.event.id = ?1 and epc.designationId = ?2")
    Optional<EventPoliceCount> getByEventIdAndDesignationId(Long eventId, Long id);
}

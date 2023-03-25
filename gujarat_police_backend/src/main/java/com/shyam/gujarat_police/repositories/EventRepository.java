package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.Event;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface EventRepository extends PagingAndSortingRepository<Event, Long>, EventBaseRepository {

    @Query("SELECT e from Event e where e.eventStartDate >= ?1 AND e.eventEndDate <= ?2")
    List<Event> getEventsBetweenGivenEvent(Date startDate, Date endDate);
}

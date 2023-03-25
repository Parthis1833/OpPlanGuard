package com.shyam.gujarat_police.repositories.impl;

import com.shyam.gujarat_police.dto.request.DesignationCountDto;
import com.shyam.gujarat_police.dto.response.DesignationCountRespDto;
import com.shyam.gujarat_police.entities.AssignPolice;
import com.shyam.gujarat_police.entities.Designation;
import com.shyam.gujarat_police.entities.Police;
import com.shyam.gujarat_police.repositories.AssignPoliceBaseRepository;
import com.shyam.gujarat_police.repositories.BaseRepository;
import com.shyam.gujarat_police.util.ObjectUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.jpa.repository.Modifying;

import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class AssignPoliceBaseRepositoryImpl extends BaseRepository<AssignPolice> implements AssignPoliceBaseRepository {
    private static final Logger LOGGER = LoggerFactory.getLogger(AssignPoliceBaseRepositoryImpl.class);

    @Override
    public List<Police> findFreePoliceOrNotAssigned(Date eventDate) {
//        String queryString = "select p from Police p " +
//                "left join AssignPolice ap on ap.id = p.id " +
        return null;
    }

    @Override
    public List<Police> findFreePoliceOrNotAssignedByDesignation(DesignationCountDto designationCountDto) {
        return null;
    }

    @Override
    public boolean isPoliceAssigned(Long pId, Date dutyStartDate, Long eId) {
        String queryString = "select true from AssignPolice asp " +
                "where asp.police.id <> :pId or " +
                "( asp.event.id = :eId and :dutyStartDate >= asp.event.eventStartDate )";
        Query query = entityManager.createQuery(queryString, Tuple.class);
        query.setParameter("pId", pId);
        query.setParameter("dutyStartDate", dutyStartDate);
        query.setParameter("eId", eId);

        List<Tuple> tupleList = query.getResultList();
        System.out.println(tupleList);
        return tupleList.size() > 0;
    }


    @Modifying
    @Transactional
    @Override
    public void removeAssignedPoliceFromPointInEvent(Long eventId, Long pointId) {
        try {
            LOGGER.info("Inside removeAssignedPoliceFromPointInEvent" + eventId + " " + pointId);
            StringBuilder queryString = new StringBuilder("update police set is_assigned = false where id in ( SELECT police_id from assign_police where event_id = ")
                    .append(eventId).append(" and point_id = ").append(pointId).append(")");

            Query query = entityManager.createNativeQuery(queryString.toString());
            query.executeUpdate();
            LOGGER.info("updated successful");
            queryString = new StringBuilder("delete from assign_police where event_id = ").append(eventId).append(" and point_id = ").append(pointId);
            query = entityManager.createNativeQuery(queryString.toString());
            query.executeUpdate();
            queryString = new StringBuilder("delete from point_police_count where event_id = ").append(eventId).append(" and point_id = ").append(pointId);
            query = entityManager.createNativeQuery(queryString.toString());
            query.executeUpdate();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
    }
}

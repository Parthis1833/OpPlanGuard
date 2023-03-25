package com.shyam.gujarat_police.repositories.impl;

import com.shyam.gujarat_police.dto.request.PoliceDto;
import com.shyam.gujarat_police.dto.response.DesignationCountRespDto;
import com.shyam.gujarat_police.entities.Police;
import com.shyam.gujarat_police.repositories.BaseRepository;
import com.shyam.gujarat_police.repositories.PoliceBaseRepository;
import com.shyam.gujarat_police.util.ObjectUtil;

import javax.persistence.Query;
import javax.persistence.Tuple;
import java.util.ArrayList;
import java.util.List;

public class PoliceBaseRepositoryImpl extends BaseRepository<Police> implements PoliceBaseRepository {

    @Override
    public boolean isPoliceExists(Police police) {
        String queryString = "select p from Police p where " +
                "p.buckleNumber = :buckleNumber";
        Query query = entityManager.createQuery(queryString, Tuple.class);
        query.setParameter("buckleNumber", police.getBuckleNumber());

        List<Tuple> tupleList = query.getResultList();
        return tupleList.size() > 0;
    }

    @Override
    public List<DesignationCountRespDto> getFreePoliceMappingByDesignation(Long eventId) {
        List <DesignationCountRespDto> resp = new ArrayList<>();
        StringBuilder queryString = new StringBuilder("select count(designation_id), d.id, d.name from police left join designation d on designation_id = d.id  where is_assigned = false and ");
        queryString.append(" event_id = ").append(eventId).append(" group by d.id");
        Query query = entityManager.createNativeQuery(queryString.toString(), Tuple.class);
        List<Tuple> result = query.getResultList();
        result.stream().forEach(tuple -> {
            DesignationCountRespDto d = new DesignationCountRespDto();
            d.setDesignationId(ObjectUtil.optLong(tuple.get("id")));
            d.setDesignationName(ObjectUtil.optString(tuple.get("name")));
            d.setDesignationCount(ObjectUtil.optInteger(tuple.get("count")));
            resp.add(d);
        });
        return resp;
    }
}

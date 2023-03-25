package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.BaseModel;
import com.shyam.gujarat_police.exceptions.CustomException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Objects;

public abstract class BaseRepository <T extends BaseModel>{

    private static final Logger LOGGER = LoggerFactory.getLogger(BaseRepository.class);

    @PersistenceContext
    protected EntityManager entityManager;

    public BaseRepository() {
        super();
    }

    public void saveEntity(T entity) {
        try {

            if (Objects.nonNull(entity.getId())) {
                throw new CustomException("Identity is not a part of new Operation");
            }

            this.entityManager.persist(entity);
            this.entityManager.flush();
            this.entityManager.refresh(entity);
        } catch (Exception e) {
            LOGGER.error("Error in Save", e);
            throw e;
        }
    }

    public void updateEntity(T entity) {
        try {
            if (Objects.isNull(entity.getId()) || entity.getId() == 0) {
                throw new CustomException("Identity is required for update operation");
            }
            this.entityManager.persist(entity);
            this.entityManager.flush();
            this.entityManager.refresh(entity);
        } catch (Exception e) {
            LOGGER.error("Error in Save", e);
            throw e;
        }
    }
}

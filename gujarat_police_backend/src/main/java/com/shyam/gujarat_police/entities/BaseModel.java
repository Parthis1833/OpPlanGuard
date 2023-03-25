package com.shyam.gujarat_police.entities;

import ma.glasnost.orika.MapperFacade;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.persistence.MappedSuperclass;
import java.io.Serializable;

@MappedSuperclass
public abstract class BaseModel implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -2794333936591116344L;
    protected static final Logger LOGGER = LoggerFactory.getLogger(BaseModel.class);

    public abstract Long getId();

    public <S> S toDTO(Class<S> clazz, MapperFacade mapper) throws RuntimeException {

        try {
            return mapper.map(this, clazz);
        } catch (SecurityException e) {
            LOGGER.error("BaseConversionException", e);
            throw new RuntimeException(e);
        } catch (Exception e) {
            LOGGER.error(null, e);
            throw new RuntimeException(e);
        }
    }
}

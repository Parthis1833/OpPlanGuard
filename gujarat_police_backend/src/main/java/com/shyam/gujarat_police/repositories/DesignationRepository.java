package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.Designation;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DesignationRepository extends PagingAndSortingRepository<Designation, Long>, DesignationBaseRepository {
    Optional<Designation> findByName(String designationName);

    @Query("select d from Designation d where d.name = ?1 or d.nameInGujarati = ?2 ")
    List<Designation> findbyNameOrNameInGujarati(String designationName, String designationNameInGujarati);

    @Query("select d from Designation d where d.name = ?1 or d.nameInGujarati = ?1 ")
    List<Designation> findbyNameOrNameInGujarati(String designationName);

    @Query("select d from Designation d where d.id <> ?1 and (d.name = ?2 or d.nameInGujarati = ?3)")
    Optional<Designation> getWhereNotIdAndByNameOrNameInGuj(Long designationId, String name, String nameInGujarati);
}

package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.Point;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PointRepository extends PagingAndSortingRepository<Point, Long>, PointBaseRepository {
}

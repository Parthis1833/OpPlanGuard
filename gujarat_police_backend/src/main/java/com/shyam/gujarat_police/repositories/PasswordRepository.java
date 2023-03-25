package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.Passwords;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface PasswordRepository extends JpaRepository<Passwords, Long> {

    @Transactional
    @Modifying
    @Query("update Passwords p set p.isExpired = true where p.eventId = ?1")
    void expireAllPasswordForEvent(Long eventId);

    @Query("select p from Passwords p where p.eventId = ?1 and p.isExpired = false ORDER BY p.createdAt DESC")
    Page<Passwords> findMostRecentPassword(Long eventId, Pageable pageable);
}

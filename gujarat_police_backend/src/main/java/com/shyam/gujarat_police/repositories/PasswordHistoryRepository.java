package com.shyam.gujarat_police.repositories;

import com.shyam.gujarat_police.entities.PasswordHistory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PasswordHistoryRepository extends JpaRepository<PasswordHistory, Long> {
}

package com.boots.repository;

import com.boots.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.scheduling.annotation.Schedules;

import java.util.List;
import java.util.Set;

public interface ContestsRepository extends JpaRepository<Contest, Integer> {
    List<Contest> findByContestants(Student contestants);
}

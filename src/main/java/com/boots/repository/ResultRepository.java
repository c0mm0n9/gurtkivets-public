package com.boots.repository;

import com.boots.entity.Contest;
import com.boots.entity.Result;
import com.boots.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ResultRepository extends JpaRepository<Result,Integer> {
    List<Result> findByStudent(Student student);
    List<Result> findByContest(Contest contest);
}

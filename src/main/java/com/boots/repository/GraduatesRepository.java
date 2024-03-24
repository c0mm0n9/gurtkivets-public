package com.boots.repository;

import com.boots.entity.Graduates;
import com.boots.entity.Student;
import com.boots.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GraduatesRepository extends JpaRepository<Graduates, Integer> {
    List<Graduates> findByUser(User user);
}

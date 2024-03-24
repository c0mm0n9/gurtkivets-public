package com.boots.repository;

import com.boots.entity.Student;
import com.boots.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Integer> {
    List<Student> findByUser(User user);
    List<Student> findByGender(String gender);
}

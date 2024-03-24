package com.boots.repository;

import com.boots.entity.Student;
import com.boots.entity.TypeClass;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TypeClassRepository extends JpaRepository<TypeClass, Integer> {
}

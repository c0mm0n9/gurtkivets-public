package com.boots.repository;

import com.boots.entity.Parent;
import com.boots.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ParentRepository extends JpaRepository<Parent, Integer> {
    List<Parent> findByUser(User user);
}

package com.boots.repository;

import com.boots.entity.Role;
import com.boots.entity.Staff;
import com.boots.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface StaffRepository extends JpaRepository<Staff, Integer> {
    Staff findByUser(User user);


}


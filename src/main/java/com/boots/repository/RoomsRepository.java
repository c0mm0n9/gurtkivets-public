package com.boots.repository;

import com.boots.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomsRepository extends JpaRepository<Room, Integer> {
}

package com.boots.repository;

import com.boots.entity.Classes;
import com.boots.entity.Schedule;
import com.boots.entity.Student;
import com.boots.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.time.DayOfWeek;
import java.util.List;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
    List<Schedule> findByDay(String day);
    List<Schedule> findByRoomId(int room_id);



    @Query (value = "SELECT * FROM schedule s Where s.day=:day and s.room_id= :roomId and " +
            "( (s.time_start<time(:start) and s.time_end>time(:start)) or " +
            " (s.time_start<time(:end) and s.time_end>time(:end)))", nativeQuery = true)
    List<Schedule> findScheduleConflicts(@Param("day") String day,@Param("roomId") int roomId,@Param("start") String time_start,@Param("end") String time_end);


}

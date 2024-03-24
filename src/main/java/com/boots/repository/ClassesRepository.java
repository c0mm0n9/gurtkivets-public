package com.boots.repository;

import com.boots.entity.Classes;
import com.boots.entity.Schedule;
import com.boots.entity.Staff;
import com.boots.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.scheduling.annotation.Schedules;

import java.util.List;
import java.util.Set;

public interface ClassesRepository extends JpaRepository<Classes, Integer> {
    List<Classes> findByStaff(Staff staff);
    List<Classes> findByStudent(Student student);
    Classes findBySchedules(Schedule schedules);
    @Query(value = "SELECT * FROM classes WHERE classes.id not in (SELECT classes_id from classes_student WHERE student_id = :student_id)" , nativeQuery = true)
    List<Classes> findNotAttendedByStudentId(@Param("student_id") int student_id);

    @Query(value = "SELECT * from classes_student_requests JOIN classes on classes_id=classes.id WHERE student_requests_id = :student_id", nativeQuery = true)
    List<Classes> findRequestsByStudentId (@Param("student_id") int student_id);
}

package com.boots.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "schedule")
public class Schedule {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    private int id;

    @Column(name = "day")
    String day;

    @Column(name="time_start")
    String time_start;

    @Column(name="time_end")
    String time_end;

    @ManyToOne
    @JoinColumn(name="room_id", nullable=true)
    Room room;


    @Transient
    @ManyToMany(mappedBy = "schedules")
    Set<Classes> classes = new HashSet<>();



}

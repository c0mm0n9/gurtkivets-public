package com.boots.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name="rooms")
public class Room {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    private int id;


    @Column(name = "name")
    private String name;

    @Transient
    @OneToMany(mappedBy="room")
    private Set<Schedule> schedules = new HashSet<>();
}

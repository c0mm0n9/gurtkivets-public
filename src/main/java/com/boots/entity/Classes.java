package com.boots.entity;


import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name="classes")
public class Classes {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    int id;
    @Column(name = "name")
    String name;
    @Column(name = "description")
    String description;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    Set<Student> student = new HashSet<>();

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    Set<Student> studentRequests = new HashSet<>();


    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    Set<Staff> staff = new HashSet<>();

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    Set<Schedule> schedules = new HashSet<>();

    @ManyToOne
    @JoinColumn(name="type_class_id", nullable=true)
    TypeClass typeClass;

}

package com.boots.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "contest")
public class Contest {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    int id;
    @Column(name = "name")
    String name;
    @Column(name = "description")
    String description;
    @Column(name = "date_start")
    String date_start;
    @Column(name = "registration_open")
    boolean registration_open;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private Set<Student> contestants = new HashSet<>();

    @Transient
    @OneToMany(mappedBy="contest")
    Set<Result> result = new HashSet<>();

}

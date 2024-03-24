package com.boots.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.*;

@Data
@Entity
@Table(name="students")
public class Student {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    int id;
    @Column(name = "name")
    String name;
    @Column(name = "surname")
    String surname;
    @Column(name = "gender")
    String gender;
    @Column(name = "birthdate")
    String birthdate;
    @Column(name = "phone")
    String phone;
    @Column(name = "adress")
    String adress;
    @Column(name = "school")
    String school;
    @Column(name = "form")
    int form;
    @Column(name = "otherClasses")
    String otherClasses;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="user_id", nullable=false)
    private User user;

    @Transient
    @ManyToMany(mappedBy = "student")
    private List<Classes> classes;

    @Transient
    @ManyToMany(mappedBy = "student")
    private List<Classes> classesRequest;

    @Transient
    @ManyToMany(mappedBy = "contestant")
    private List<Contest> contests;

    @Transient
    @OneToMany(mappedBy = "student")
    Set<Result> result = new HashSet<>();

}

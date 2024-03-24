package com.boots.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@Table(name="type_class")
public class TypeClass {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    int id;
    @Column(name = "name")
    String name;
    @Transient
    @OneToMany(mappedBy="typeClass")
    private Set<Classes> classesSet;
}

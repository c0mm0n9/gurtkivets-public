package com.boots.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name="result")
public class Result{
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    int id;

    @Column(name = "details")
    String details;





    @ManyToOne
    @JoinColumn(name="contest_id", nullable=false)
    Contest contest;



    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    Student student;
}

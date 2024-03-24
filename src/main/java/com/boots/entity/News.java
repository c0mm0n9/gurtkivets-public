package com.boots.entity;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Data
@Entity
@Table(name="news")
public class News {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    int id;

    @Column(name = "title")
    String title;
    @Column(name = "text")
    String text;
    @Column(name = "publish_date")
    String publish_date;
}

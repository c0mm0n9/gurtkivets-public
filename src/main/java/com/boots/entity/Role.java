package com.boots.entity;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@Table(name = "role")
public class Role implements GrantedAuthority {
    @Id
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;

    @Transient
    @ManyToMany(mappedBy = "roles")
    private Set<User> users;
    public Role() {
    }

    public Role(int id) {
        this.id = id;
    }

    public Role(int id, String name) {
        this.id = id;
        this.name = name;
    }
    @Override
    public String getAuthority() {
        return getName();
    }
}

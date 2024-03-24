package com.boots.entity;
import lombok.Data;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;
import java.util.*;

@Data
@Entity
@Table(name = "user")
public class User implements UserDetails {
    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    private int id;
    @Size(min=2, message = "Не меньше 2 знаків")
    private String username;
    @Column(name="email")
    @Email
    private String email;
    @Size(min=5, message = "Не меньше 5 знаків")
    private String password;
    @Transient
    private String passwordConfirm;

    @Column(name="enabled", nullable = false)
    @ColumnDefault("0")
    private boolean enabled;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Role> roles;
    @Transient
    @OneToMany(mappedBy = "user")
    private Set<Student> students;
    @Transient
    @OneToMany(mappedBy = "user")
    private Set<Graduates> graduates;
    @Transient
    @OneToMany(mappedBy = "user")
    private Set<Parent> parents;
    @Transient
    @OneToOne(mappedBy = "user")
    private Staff staff;


    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }


        public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }


}

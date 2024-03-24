package com.boots.repository;

import com.boots.entity.User;
import com.boots.entity.VerificationToken;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TokenRepository extends JpaRepository<VerificationToken, Integer> {
    VerificationToken findByToken(String token);
    List<VerificationToken> findByUser(User user);
}

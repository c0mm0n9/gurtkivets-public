package com.boots.repository;

import com.boots.entity.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NewsRepository extends JpaRepository<News, Integer> {

    @Query(value="SELECT * FROM news ORDER BY id DESC LIMIT :limit", nativeQuery = true)
    List<News> lastNews(@Param("limit") int limit);

}

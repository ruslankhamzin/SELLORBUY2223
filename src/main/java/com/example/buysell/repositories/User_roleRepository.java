package com.example.buysell.repositories;

import com.example.buysell.models.UserROLES;
import org.springframework.data.jpa.repository.JpaRepository;

public interface User_roleRepository extends JpaRepository<UserROLES, Long> {
}
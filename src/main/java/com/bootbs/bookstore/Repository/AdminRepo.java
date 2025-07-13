package com.bootbs.bookstore.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bootbs.bookstore.Model.AdminModel;

public interface AdminRepo extends JpaRepository<AdminModel, Integer> {
    AdminModel findByUsername(String username);
}

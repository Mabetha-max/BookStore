package com.bootbs.bookst.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bootbs.bookst.Model.UserModel;

public interface UserRepo extends JpaRepository<UserModel,String> {
	UserModel findByUsername(String username);
}
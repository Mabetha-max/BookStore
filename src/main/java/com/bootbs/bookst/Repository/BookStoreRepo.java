package com.bootbs.bookst.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bootbs.bookst.Model.BookStoreModel;

public interface BookStoreRepo extends JpaRepository<BookStoreModel,Integer>{
	
	

}
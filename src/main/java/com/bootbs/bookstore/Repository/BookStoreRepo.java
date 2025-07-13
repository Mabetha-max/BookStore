package com.bootbs.bookstore.Repository;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;


import org.springframework.data.jpa.repository.JpaRepository;

import com.bootbs.bookstore.Model.BookStoreModel;

public interface BookStoreRepo extends JpaRepository<BookStoreModel,Integer>{
	
	List<BookStoreModel> findByBookContainingIgnoreCaseOrAuthorContainingIgnoreCase(String book, String author);
	Page<BookStoreModel> findByBookContainingIgnoreCaseOrAuthorContainingIgnoreCase(String book, String author, Pageable pageable);


}
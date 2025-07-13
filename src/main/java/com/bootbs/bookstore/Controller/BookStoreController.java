package com.bootbs.bookstore.Controller;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;

//import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bootbs.bookstore.Model.AdminModel;
import com.bootbs.bookstore.Model.BookStoreModel;
import com.bootbs.bookstore.Model.UserModel;
import com.bootbs.bookstore.Repository.AdminRepo;
//import org.springframework.web.bind.annotation.RestController;
import com.bootbs.bookstore.Repository.BookStoreRepo;
import com.bootbs.bookstore.Repository.UserRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

//import com.bootbs.bookstore.Model.BookStoreModel;

@Controller
public class BookStoreController {
	
	//with database using hibernate
	@Autowired
	private BookStoreRepo repo;
	
	@Autowired
	private AdminRepo adminRepo;

	@Autowired
	private UserRepo userrepo;
	
	@GetMapping("/login")
	public String showlogin(HttpServletRequest request) {
		request.setAttribute("action","login");
		return "page/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("username") String username,@RequestParam("password") String password ,HttpServletRequest request) {
		UserModel user = userrepo.findByUsername(username);
		if(user!=null && username.equals(user.getUsername()) && password.equals(user.getPassword())) {
			request.setAttribute("msg", "Welcome Back to the Book Store");
			return "page/home";
		}
		else {
			request.setAttribute("msg", "Invalid User");
			return "page/login";
		}
	}
	
	@GetMapping("/signup")
	public String showsigin(HttpServletRequest request) {
		request.setAttribute("action","signup");
		return "page/login";
	}
	
	@PostMapping("/signup")
	public String signin(@RequestParam("username") String username,@RequestParam("password") String password ,HttpServletRequest request) {
		UserModel user = userrepo.findByUsername(username);
		if(user==null) {
			UserModel newuser = new UserModel(username,password);
			userrepo.save(newuser);
			request.setAttribute("msg","Welcome to Book Store");
			return "page/home";
		}
		else {
			request.setAttribute("msg", "User Already exist");
			return "page/login";
		}
	}
	
	@GetMapping("/home")
	public String home() {
		return "page/home";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "page/login";
	}

	
	@GetMapping("/books")
	public String showBooks(
	        @RequestParam(defaultValue = "1") int page,
	        @RequestParam(value = "keyword", required = false) String keyword,
	        HttpServletRequest request) {

	    Pageable pageable = PageRequest.of(page - 1, 5); // Fixed 5 books per page
	    Page<BookStoreModel> bookPage;

	    if (keyword != null && !keyword.trim().isEmpty()) {
	        bookPage = repo.findByBookContainingIgnoreCaseOrAuthorContainingIgnoreCase(keyword, keyword, pageable);
	        if (bookPage.isEmpty()) {
	            request.setAttribute("msg", "No results found for '" + keyword + "'");
	        }
	    } else {
	        bookPage = repo.findAll(pageable);
	    }

	    request.setAttribute("books", bookPage.getContent());  // current page content
	    request.setAttribute("currentPage", page);
	    request.setAttribute("totalPages", bookPage.getTotalPages());
	    request.setAttribute("keyword", keyword);

	    return "page/books"; // maps to books.jsp
	}
	
	@GetMapping("/admin/signup")
	public String showAdminSignup() {
	    return "page/adminsignup";  // create this JSP
	}

	@PostMapping("/admin/signup")
	public String signupAdmin(@RequestParam String username,
	                          @RequestParam String password,
	                          HttpServletRequest request,
	                          HttpSession session) {

	    AdminModel admin = adminRepo.findByUsername(username);
	    if (admin == null) {
	        adminRepo.save(new AdminModel(username, password));
	        session.setAttribute("admin", true); // auto login
	        return "admin/dashboard";
	    } else {
	        request.setAttribute("error", "Admin already registered");
	        return "page/adminSignup"; // or wherever your signup form is
	    }
	}



	@GetMapping("/admin/login")
	public String showAdminLogin(HttpServletRequest request) {
	    String error = (String) request.getSession().getAttribute("error");
	    request.setAttribute("error", error);
	    request.getSession().removeAttribute("error");
	    return "page/admin";
	}

	@PostMapping("/admin/login")
	public String processAdminLogin(@RequestParam String username,
	                                @RequestParam String password,
	                                HttpSession session,
	                                HttpServletRequest request) {
	    AdminModel admin = adminRepo.findByUsername(username);
	    if (admin != null && admin.getPassword().equals(password)) {
	        session.setAttribute("admin", true);
	        //session.setAttribute("adminName", username);
	        return "page/admin/dashboard";
	    } else {
	        request.setAttribute("error", "Invalid credentials");
	        return "page/admin/login";
	    }
	}


	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
	    session.invalidate(); // Clear session
	    return "page/signup"; // Go to signup page after logout
	}

	@GetMapping("/admin/dashboard")
	public String showAdminDashboard(HttpSession session) {
	    if (session.getAttribute("admin") == null) {
	        return "page/admin/login";
	    }
	    return "page/admindashboard";
	}

	@GetMapping("/admin/books")
	public String manageBooks(HttpServletRequest request, HttpSession session) {
	    if (session.getAttribute("admin") == null) {
	        return "page/admin/login";
	    }

	    List<BookStoreModel> books = repo.findAll();
	    long totalBooks = books.size();

	    // Optionally add sold count if tracked
	    request.setAttribute("books", books);
	    request.setAttribute("totalBooks", totalBooks);

	    return "page/adminBooks";
	}
	@GetMapping("/update")
	public String showUpdateForm() {
	    return "page/updateBook"; // rename update.jsp to updateBook.jsp if needed
	}



	@GetMapping("/admin/users")
	public String manageUsers(HttpServletRequest request, HttpSession session) {
	    if (session.getAttribute("admin") == null) {
	        return "page/admin/login";
	    }
	    // Dummy for now
	    return "page/adminUsers"; // create adminUsers.jsp
	}

	@GetMapping("/admin/status")
	public String viewStats(HttpServletRequest request, HttpSession session) {
	    if (session.getAttribute("admin") == null) {
	        return "page/admin/login";
	    }
	    // Add dummy stats if needed
	    return "page/adminStatus"; // create adminStats.jsp
	}

	
	@GetMapping("/add")
	public String showform() {
		return "page/form";
	}
	
	@PostMapping("/add")
	public String addBook(@ModelAttribute BookStoreModel book,HttpServletRequest request) {
		repo.save(book);
		request.setAttribute("msg","Book Added Successfully");
		return "page/form";
	}
	
	@GetMapping("/delete")
	public String showdelete() {
		return "page/deleteBook";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("id") int id,HttpServletRequest request) {
		String message = "";
		try {
			if(repo.existsById(id)) {
				repo.deleteById(id);
				message = "Book deleted Successfully";
			}
			else {
				message = "Book not found";
			}
		}
		catch(Exception e){
			message = "Invalid Input";
		}
		request.setAttribute("msg", message);
		return "page/deleteBook";
	}
	
	@GetMapping("/sell")
	public String showsell(HttpServletRequest request) {
		request.setAttribute("action","sell");
		return "page/updateBook";
	}
	
	@PostMapping("/sell")
	public String sell(@RequestParam("id") int id,
						@RequestParam("quantity") int quantity,HttpServletRequest request) {
		String message="";
		try {
			if(repo.existsById(id)) {
				BookStoreModel book = repo.findById(id).get();
				if(book.getQuantity() >= quantity && book.getQuantity()>0) {
					book.setQuantity(book.getQuantity()-quantity);
					repo.save(book);
					message="Book Sold";
				}
				else {
					message="Book out of stock";
				}
			}
			else {
				message="Book Not Found";
			}
		}
		catch(Exception e) {
			message="Invalid Id";
		}
		request.setAttribute("msg", message);
		return "page/updateBook";
	}
	
	@GetMapping("/buy")
	public String showbuy(HttpServletRequest request) {
		request.setAttribute("action","buy");
		return "page/updateBook";
	}
	
	@PostMapping("/buy")
	public String buy(@RequestParam("id") int id,@RequestParam("quantity") int quantity,HttpServletRequest request) {
		String message="";
		try {
			if(repo.existsById(id)) {
				BookStoreModel book = repo.findById(id).get();
				book.setQuantity(book.getQuantity()+quantity);
				repo.save(book);
				message="Book get bought";
			}
			else {
				message="Book Not Found";
			}
		}
		catch(Exception e) {
			message="Invalid Id";
		}
		request.setAttribute("msg", message);
		return "page/updateBook";
	}
	
	/*//without database
	List<BookStoreModel> books = new ArrayList<>();
	
	@PostMapping
	public String addBook(@RequestBody BookStoreModel book) {
		books.add(book);
		return "Book added to the store";
	}
	
	@GetMapping
	public List<BookStoreModel> getBooks(){
		return books;
	}
	
	@PostMapping("/buy/{id}")
	public String buyBook(@PathVariable int id) {
		for(BookStoreModel book : books) {
			if(book.getId() == id) {
				if(book.getQuantity() > 0) {
					book.setQuantity(book.getQuantity()-1);
					return "Book purchase successful!";
				}
				else {
					return "Book out of stock";
				}
			}
		}
		return "Book Not Found";
	}*/
	
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.bootbs.bookst.Model.BookStoreModel"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%List<BookStoreModel> books = (List<BookStoreModel>) request.getAttribute("books"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>
<link rel="stylesheet" type="text/css" href="/css/home.css">
</head>
<body>
	<nav id="navi">
		<a href="add"><button>Add Book</button></a>
			<a href="delete"><button>Delete a Book</button></a>
			<a href="sell"><button>Sell</button></a>
			<a href="buy"><button>Buy</button></a>
	</nav>
	<div id="whole">
		<h1>Book Store</h1>
		<h3>Available Books</h3>
		<table id="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Book</th>
					<th>Author</th>
					<th>Stock</th>
				</tr>
			</thead>
			<tbody>
				<% for(BookStoreModel book:books){%>
				    <tr>
				    	<td><%=book.getId() %></td>
				        <td><%=book.getBook() %></td>
				        <td><%=book.getAuthor() %></td>
				        <td><%=book.getQuantity() %></td>
				    </tr>
				<%}%>
			</tbody>
		</table>
	</div>
</body>
</html>
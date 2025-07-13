<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8" import="java.util.*, com.bootbs.bookst.Model.BookStoreModel"%>
    
=======
    pageEncoding="UTF-8" import="java.util.*, com.bootbs.bookstore.Model.BookStoreModel"%>

>>>>>>> e82a673 (database commit)
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
<<<<<<< HEAD
			<a href="delete"><button>Delete a Book</button></a>
			<a href="sell"><button>Sell</button></a>
			<a href="buy"><button>Buy</button></a>
	</nav>
	<div id="whole">
		<h1>Book Store</h1>
		<h3>Available Books</h3>
=======
		<a href="delete"><button>Delete a Book</button></a>
		<a href="sell"><button>Sell</button></a>
		<a href="buy"><button>Buy</button></a>
		<a href="logout"><button>Logout</button></a>
		
	</nav>

	<div id="whole">
		<h1>Book Store</h1>
		<h3>Available Books</h3>

		<!-- ✅ Fix: Use EL for keyword -->
		<form action="/books" method="get" style="margin-bottom: 20px;">
			<input type="text" name="keyword" value="${keyword != null ? keyword : ''}" placeholder="Search by title or author">
			<button type="submit">Search</button>
			<a href="/books"><button type="button">Reset</button></a>
		</form>

		<!-- ✅ No results message -->
		<% if (books != null && books.isEmpty()) { %>
			<p style="color: crimson;">No books found for your search.</p>
		<% } %>

		<!-- ✅ Book list -->
		<% if (books != null && !books.isEmpty()) { %>
		<c:if test="${empty books}">
    <p style="color: red;">No books found 
        <c:if test="${not empty keyword}">
            for: '<c:out value="${keyword}" />'
        </c:if>
    </p>
</c:if>
<div style="margin-top: 20px;">
    <c:if test="${totalPages > 1}">
        <div>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <a href="/books?page=${i}&keyword=${keyword}" style="${i == currentPage ? 'font-weight:bold;' : ''}">${i}</a>
                &nbsp;
            </c:forEach>
        </div>
    </c:if>
</div>

		
>>>>>>> e82a673 (database commit)
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
<<<<<<< HEAD
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
=======
				<% for(BookStoreModel book : books) { %>
				    <tr>
				    	<td><%= book.getId() %></td>
				        <td><%= book.getBook() %></td>
				        <td><%= book.getAuthor() %></td>
				        <td><%= book.getQuantity() %></td>
				    </tr>
				<% } %>
			</tbody>
		</table>
		<% } %> <!-- ✅ close the if condition -->
	</div>
</body>
</html>
>>>>>>> e82a673 (database commit)

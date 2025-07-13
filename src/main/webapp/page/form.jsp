<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Delete Book</title>
<link rel="stylesheet" type="text/css" href="/css/deleteBookstyle.css">
</head>
<body>
	<div id="whole">
		<h1>Book Store</h1>
		<form id="container" action="/delete" method="post">
			<h3>Delete a Book</h3>
			<label class="label">Book Id:</label>
			<input class="input" type="number" name="id">
			<button id="button" type ="submit">Delete</button>
		</form>
		<nav id="navi">
			<a href="books"><button>View List</button></a>
		</nav>
	</div>
	<%
=======
<title>Add Books</title>
<link rel="stylesheet" type="text/css" href="/css/formstyle.css">
</head>
<body>
	<div id="whole">
        <h1>Book Store</h1>
        <form id="container" action="/add" method="post" >    
                <h3>Form for Adding Books</h3>
                <label class="label">Book Name:</label>
                <input class="input" type="text" name="book" required>
                <label class="label">Author:</label>
                <input class="input" type="text" name="author" required>
                <label class="label">Quantity:</label>
                <input class="input" type="number" name="quantity" required>
                <button id="button" type="submit">Add</button>
        </form>
        <nav id="navi">
			<a href="books">View List</a>
		</nav>
    </div>
    <%
>>>>>>> e82a673 (database commit)
	    String msg = (String) request.getAttribute("msg");
	    if (msg != null) {
	%>
	    <script>
	        alert("<%= msg %>");
	    </script>
	<%
	    }
	%>
</body>
</html>
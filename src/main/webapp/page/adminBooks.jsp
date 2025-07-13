<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("/admin/login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .low-stock {
            color: red;
            font-weight: bold;
        }
        .btn {
            padding: 8px 15px;
            margin: 5px;
            font-weight: bold;
            border: none;
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #218838;
        }
        .actions {
            margin-top: 20px;
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .search-box {
            padding: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<h1>📚 Manage Books</h1>

<div class="top-bar">
    <p>Total Books: <strong>${books.size()}</strong></p>
    <form action="/books" method="get">
        <input type="text" name="keyword" class="search-box" placeholder="Search by title or author"/>
        <input type="submit" value="Search" class="btn" />
    </form>
</div>

<table border="1" cellpadding="10" cellspacing="0">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th> Author</th>
            <th> Price</th>
            <th> Quantity</th>
            <th> Sold</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.id}</td>
                <td>${book.book}</td>
                <td>${book.author}</td>
                <td>${book.price}</td>
                <td class="${book.quantity < 5 ? 'low-stock' : ''}">
                    ${book.quantity} ${book.quantity < 5 ? '⚠️' : ''}
                </td>
                <td>${book.sold}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="actions">
    <!-- Add Book Button -->
<form action="/add" method="get" style="display:inline;">
    <button type="submit" style="background-color:#28a745; color:white; padding:8px 16px; border:none; border-radius:4px; cursor:pointer;">
         Add Book
    </button>
</form>

<!-- Delete Book Button -->
<form action="/delete" method="get" style="display:inline; margin-left:10px;">
    <button type="submit" style="background-color:#dc3545; color:white; padding:8px 16px; border:none; border-radius:4px; cursor:pointer;">
        Delete Book
    </button>
</form>
    
   <form action="/update" method="get" style="display:inline;">
    <button type="submit" style="background-color:#ffc107;">Update Book</button>
</form>
   
</div>

</body>
</html>

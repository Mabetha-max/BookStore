<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Signup</title>
</head>
<body>
    <h2>Admin Signup</h2>
    <form action="/admin/signup" method="post">
        <input type="text" name="username" placeholder="Username"/><br/>
        <input type="password" name="password" placeholder="Password"/><br/>
        <input type="submit" value="Signup"/>
    </form>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <p style="color:red;"><%= error %></p>
    <% } %>

    <% String msg = (String) request.getAttribute("msg"); %>
    <% if (msg != null) { %>
        <p style="color:green;"><%= msg %></p>
    <% } %>
</body>
</html>

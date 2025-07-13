<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("/admin/login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<title>MANAGE USERS</title>
</head>
<body>
<h1> Manage Users </h1>
    <p>This page will show list of users. Later you can add buttons to ban/delete/edit.</p>
</body>
</html>
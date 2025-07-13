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
<meta charset="UTF-8">
<title>VIEW STSTUS</title>
</head>
<body>
<h1>View Status (Admin Panel)</h1>
    <p>This page will show statistics like total users, books sold etc.</p>
</body>
</html>
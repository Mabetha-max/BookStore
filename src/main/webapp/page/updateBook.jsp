<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<meta charset="UTF-8">
<title>Update Book</title>
<link rel="stylesheet" type="text/css" href="css/formstyle.css">
</head>
<body>
	<div id="whole">
		<h1>Book Store</h1>
		<%
			String action = (String) request.getAttribute("action");
			if("sell".equals(action)){
		%>
				<form id="container" action="/sell" method="post">
					<h3>Sell Book(s)</h3>
					<label class="label">Book Id:</label>
					<input class="input" type="number" name="id">
					<label class="label">Quantity</label>
					<input class="input" type="number" name="quantity">
					<button id="button" type ="submit">Sell</button>
				</form>
		<%
			}else if ("buy".equals(action)) { 
		%>	
				<form id="container" action="/buy" method="post">
					<h3>Buy Book(s)</h3>
					<label class="label">Book Id:</label>
					<input class="input" type="number" name="id">
					<label class="label">Quantity</label>
					<input class="input" type="number" name="quantity">
					<button id="button" type ="submit">Buy</button>
				</form>
		<%} %>
		<nav id="navi">
			<a href="books"><button>View List</button></a>
		</nav>
	</div>
	<%
           String msg = (String) request.getAttribute("msg");
           if (msg != null) {
     %>
            <script>alert("<%= msg %>");</script>
      <%
            }
      %>
</body>
</html>
=======
    <meta charset="UTF-8">
    <title>Update Book (Sell/Buy)</title>
    <link rel="stylesheet" type="text/css" href="css/formstyle.css">
    <style>
        select {
            padding: 8px;
            margin: 10px 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div id="whole">
        <h1>Book Store</h1>
        <form id="container" method="post">
            <h3>Sell or Buy Book</h3>

            <label class="label">Book ID:</label>
            <input class="input" type="number" name="id" required>

            <label class="label">Quantity:</label>
            <input class="input" type="number" name="quantity" required>

            <label class="label">Operation:</label>
            <select id="operation" onchange="updateAction()">
                <option value="/sell">Sell</option>
                <option value="/buy">Buy</option>
            </select>

            <button id="button" type="submit">Submit</button>
        </form>

        <nav id="navi">
            <a href="books"><button>View List</button></a>
        </nav>
    </div>

    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
        <script>alert("<%= msg %>");</script>
    <%
        }
    %>

    <script>
        function updateAction() {
            const op = document.getElementById("operation").value;
            document.getElementById("container").action = op;
        }
        // Set default action on load
        window.onload = updateAction;
    </script>
</body>
</html>
>>>>>>> e82a673 (database commit)

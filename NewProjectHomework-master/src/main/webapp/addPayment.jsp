<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/3/2024
  Time: 5:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>To'lov Kiritish</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        .student-name {
            font-size: 18px;
            margin-bottom: 15px;
            color: #555;
        }
    </style>
</head>
<body>
<h1>To'lov Kiritish</h1>
<div class="form-container">
    <%
        String studentName = request.getParameter("studentName");
        String studentId = request.getParameter("studentId");
    %>
    <div class="student-name">
        <strong>Talaba:</strong> <%= studentName %>
    </div>
    <form action="/addPayment" method="post">
        <input type="hidden" name="studentId" value="<%= studentId %>">
        <div class="form-group">
            <h2>Tolov summasini kiriting</h2>
            <input type="text" id="amount" name="amount" placeholder="To'lov summasini kiriting">
        </div>
        <button type="submit">Saqlash</button>
    </form>
</div>
</body>
</html>

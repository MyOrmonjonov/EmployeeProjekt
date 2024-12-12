<%@ page import="org.example.demo6.repo.EmployRepo" %>
<%@ page import="org.example.demo6.entity.Users" %>
<%@ page import="org.example.demo6.entity.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin-top: 20px;
        }

        .form-container h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-container input:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
        }

        .form-container button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        .extra-buttons {
            margin-top: 20px;
        }

        .extra-buttons a {
            text-decoration: none;
            color: white;
            background-color: #2196F3;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: inline-block;
            margin: 5px;
        }

        .extra-buttons a:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add Employee</h2>
    <form action="/add" method="GET">
        <label>
            <input type="text" name="firstName" placeholder="First Name" required>
        </label>
        <label>
            <input type="text" name="lastName" placeholder="Last Name" required>
        </label>
        <label>
            <input type="text" name="salary" placeholder="Salary" required>
        </label>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>

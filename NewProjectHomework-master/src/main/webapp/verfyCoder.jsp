<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify Code</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .verify-container {
            background-color: #ffffff;
            width: 350px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .verify-header {
            background-color: #007bff;
            border-radius: 10px 10px 0 0;
            color: #ffffff;
            text-align: center;
            padding: 15px 0;
            font-size: 20px;
        }
        .verify-form {
            padding: 20px;
        }
        .verify-form label {
            font-size: 14px;
            color: #555555;
            margin-bottom: 5px;
            display: block;
        }
        .verify-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        .verify-form button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .verify-form button:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="verify-container">
    <div class="verify-header">Verify Code</div>
    <form class="verify-form" action="verifyCode" method="post">
        <label for="code">Enter Verification Code</label>
        <input type="text" id="code" name="code" placeholder="Enter your code" required>
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>

        <button type="submit">Verify</button>
    </form>
</div>
</body>
</html>

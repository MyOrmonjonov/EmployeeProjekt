<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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

        .login-container {
            background-color: #ffffff;
            width: 350px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .login-header {
            background-color: #28a745;
            border-radius: 10px 10px 0 0;
            color: #ffffff;
            text-align: center;
            padding: 15px 0;
            font-size: 20px;
        }

        .login-form {
            padding: 20px;
        }

        .login-form label {
            font-size: 14px;
            color: #555555;
            margin-bottom: 5px;
            display: block;
        }

        .login-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .login-form button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-form button:hover {
            background-color: #218838;
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            width: 20px;
        }

        .remember-me input[type="checkbox"] {
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }


        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .login-footer {
            text-align: center;
            margin-top: 15px;
        }

        .login-footer a {
            color: #28a745;
            text-decoration: none;
            font-size: 14px;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        Login
    </div>
    <form class="login-form" action="login" method="post">
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>
        <label for="password">Email</label>
        <input type="text" id="email" name="email" placeholder="Enter your email" required>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
        <div class="remember-me">

            <input type="checkbox" id="rememberMe" name="rememberMe">
            <label for="rememberMe">Remember Me</label>
        </div>
        <button type="submit">Login</button>
    </form>
    <div class="login-footer">
        <p>Don't have an account? <a href="register.html">Register</a></p>
    </div>
</div>
</body>
</html>

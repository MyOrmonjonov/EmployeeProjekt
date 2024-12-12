<%@ page import="org.example.demo6.repo.EmployRepo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e8f5e9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2e7d32;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #1b5e20;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #a5d6a7;
            border-radius: 4px;
            font-size: 14px;
        }
        .form-group select {
            cursor: pointer;
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: #2e7d32;
            outline: none;
            box-shadow: 0 0 4px rgba(46, 125, 50, 0.5);
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 15px;
            text-align: center;
        }
        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: #43a047;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-submit:hover {
            background-color: #2e7d32;
        }
    </style>
</head>
<body>
<% Integer id = Integer.parseInt(request.getParameter("id")); %>
<div class="form-container">
    <h2>Payment Form</h2>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
    <div class="error-message"><%= errorMessage %></div>
    <% } %>
    <form action="addEmployeeEntity" method="GET">
        <input type="hidden" id="id" name="id" value="<%= id %>">
        <div class="form-group">
            <label for="amount">Amount</label>
            <input type="text" id="amount" name="amount" placeholder="Enter Amount" required>
        </div>
        <div class="form-group">
            <label for="payType">Pay Type</label>
            <select id="payType" name="payType" required>
                <option value="" disabled selected>Choose Payment Type</option>
                <option value="Cash">Cash</option>
                <option value="Card">Card</option>
                <option value="Bank">Bank</option>
            </select>
        </div>
        <button type="submit" class="btn-submit">Save</button>
    </form>
</div>
</body>
</html>

<%@ page import="org.example.demo6.repo.EmployRepo" %>
<%@ page import="org.example.demo6.entity.Report" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            border-radius: 10px;
            overflow: hidden;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 12px;
        }
        th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }
        td {
            font-size: 14px;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9f5e9;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .back-button {
            display: block;
            margin: 20px auto;
            text-align: center;
        }
        .back-button a {
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
        }
        .back-button a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Payment Report</h1>
    <table>
        <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Cash</th>
            <th>Card</th>
            <th>Bank</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Report> reportList = EmployRepo.showReport();
            if (reportList != null && !reportList.isEmpty()) {
                for (Report report : reportList) {
                    String firstname = report.getFirstname();
                    String lastname = report.getLastname();
                    Integer cash = report.getCashSum();
                    Integer card = report.getCardSum();
                    Integer bank = report.getBankSum();
        %>
        <tr>
            <td><%= firstname %></td>
            <td><%= lastname %></td>
            <td><%= cash %></td>
            <td><%= card %></td>
            <td><%= bank %></td>
        </tr>
        <%
            }
        } else {
        %>

        <%
            }
        %>
        </tbody>
    </table>
    <div class="back-button">
        <a href="Home.jsp">Back</a>
    </div>
</div>
</body>
</html>

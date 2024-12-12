<%@ page import="org.example.demo6.repo.EmployRepo" %>
<%@ page import="org.example.demo6.entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .report-button {
            position: absolute;
            top: 20px;
            right: 20px;
            text-decoration: none;
            color: white;
            background-color: #f44336;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-size: 14px;
        }

        .report-button:hover {
            background-color: #d32f2f;
        }

        .container {
            width: 90%;
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

        .add-button {
            text-align: left;
            margin: 10px 0;
        }

        .add-button a {
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .add-button a:hover {
            background-color: #45a049;
        }

        .action-buttons a {
            text-decoration: none;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            margin: 0 5px;
            transition: background-color 0.3s ease;
        }

        .btn-pay {
            background-color: #ff9800;
        }

        .btn-pay:hover {
            background-color: #e68900;
        }

        .btn-info {
            background-color: #2196F3;
        }
        .logout-button {
            margin-left: -2px;
            position: absolute;
            top: 20px;
            right: 150px;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .logout-button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }


        .logout-button:active {
            transform: translateY(0);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<a href="report.jsp" class="report-button">Report</a>

<a href="logout" class="logout-button">Logout</a>
<div class="container">
    <div class="add-button">
        <a href="addEmployee.jsp">Add Employee</a>
    </div>

    <table>
        <thead>
        <tr>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Salary</th>
            <th>Paid</th>
            <th>Unpaid</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Employee> show = EmployRepo.show();
            if (show != null && !show.isEmpty()) {
                for (Employee emp : show) {
                    Integer paid = (emp.getPaid() != null) ? emp.getPaid() : 0;
                    Integer unpaid = emp.getSalary() - paid;
        %>
        <tr>
            <td><%= emp.getUsers().getFirstName() %>
            </td>
            <td><%= emp.getUsers().getLastName() %>
            </td>
            <td><%= emp.getSalary() %>
            </td>
            <td><%= paid %>
            </td>
            <td><%= unpaid %>
            </td>
            <td class="action-buttons">
                <%
                    if (unpaid != 0) {
                %>
                <a href="payEmp.jsp?id=<%= emp.getId() %>" class="btn-pay">Pay</a>
                <%
                    }
                    if (paid > 0) {

                %>
                <a href="infoEmp.jsp?id=<%= emp.getId() %>" class="btn-info">Info</a>
                <%}%>
            </td>
        </tr>
        <%

            }
        } else {
        %>
        <tr>
            <td colspan="6">Employee not found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>

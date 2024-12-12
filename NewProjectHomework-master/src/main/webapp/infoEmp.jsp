<%@ page import="org.example.demo6.repo.EmployRepo" %>
<%@ page import="org.example.demo6.entity.EmployeeEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px 0;
            border-radius: 10px;
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
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9f5e9;
        }

        .info-section {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            width: 80%;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .info-section .details {
            margin-left: 20px;
            text-align: left;
        }

        .info-section .details h2 {
            font-size: 24px;
            margin-bottom: 5px;
        }

        .info-section .details p {
            font-size: 16px;
            margin: 0;
            color: #333;
        }

        .no-data {
            color: red;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        }

        .back-button {
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }

        .back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        Integer id = Integer.parseInt(request.getParameter("id"));
        List<EmployeeEntity> employeeEntities = EmployRepo.FindAll(id);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy, HH:mm");

        if (employeeEntities != null && !employeeEntities.isEmpty()) {
            String firstName = employeeEntities.get(0).getEmployee().getUsers().getFirstName();
            String lastName = employeeEntities.get(0).getEmployee().getUsers().getLastName();
            double totalSalary = employeeEntities.get(0).getEmployee().getSalary();
            double totalPaid = employeeEntities.get(0).getEmployee().getPaid();
            double Unpaid = totalSalary - totalPaid;
    %>


    <div class="info-section">
        <div class="details">
            <h2>User: <%= firstName %> <%= lastName %>
            </h2>
            <p>Salary: <strong><%= String.format("%.2f", totalSalary) %>
            </strong></p>
            <%if(totalPaid!=totalSalary){%>
            <p>Total Paid: <strong><%= String.format("%.2f", totalPaid) %>

            </strong></p>
            <p>Unpaid: <strong><%= String.format("%.2f", Unpaid) %>
            </strong></p>
            <%}%>
        </div>
    </div>


    <table>
        <thead>
        <tr>
            <th>Amount</th>
            <th>Pay Type</th>
            <th> Date</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (EmployeeEntity empEntity : employeeEntities) {
        %>
        <tr>
            <td><%= empEntity.getAmount() %>
            </td>
            <td><%= empEntity.getTyupe() %>
            </td>
            <td><%= empEntity.getLocalDateTime().format(formatter) %>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <%
    } else {
    %>
    <div class="no-data">No data available</div>
    <%
        }
    %>


    <a href="Home.jsp" class="back-button">Back</a>
</div>
</body>
</html>

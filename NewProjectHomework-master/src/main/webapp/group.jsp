<%@ page import="org.example.demo6.GroupRepo" %>
<%@ page import="org.example.demo6.Groups" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guruhlar</title>

    <!-- Basic Styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            color: #333;
            text-align: center;
            font-size: 24px;
        }

        .group-container {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }

        .group-card {
            background-color: #007bff;
            color: #fff;
            text-align: center;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .group-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .group-card h2 {
            color: #fff;
            margin-bottom: 15px;
        }

        .btn-enter {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-enter:hover {
            background-color: #218838;
        }
    </style>
</head>

<body>
<div class="container">
    <h1>Guruhlar Ro'yxati</h1>
    <div class="group-container">
        <%

            List<Groups> groups = GroupRepo.getGroups(Integer.parseInt(request.getParameter("modulId")));

            for (Groups group : groups) {
        %>
        <div class="group-card">
            <h2><%= group.getName() %></h2>
            <form action="student.jsp">
                <input type="hidden" name="groupId" value="<%=group.getId()%>">
                <input type="hidden" name="courseId" value="<%=Integer.parseInt(request.getParameter("courseId"))%>">
                <button class="btn-enter">Kirish</button>
            </form>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>

<%@ page import="org.example.demo6.ModulRepo" %>
<%@ page import="org.example.demo6.Modul" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modul Royxati</title>
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
        .card {
            display: inline-block;
            width: 300px;
            margin: 15px;
            padding: 20px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        .card h3 {
            margin-bottom: 10px;
        }
        .button {
            display: inline-block;
            padding: 10px 15px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }
        .button:disabled {
            background-color: #6c757d;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
<div class="container">
    <%-- Modullarni olish --%>
    <%
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        List<Modul> moduls = ModulRepo.getModulsByCourseId(courseId);

        for (Modul modul : moduls) {
    %>
    <div class="card">
        <h3><%= modul.getName() %></h3>

       <form action="group.jsp">
        <input type="hidden" name="modulId" value="<%=modul.getId()%>">
           <button class="button">Kirish</button>
       </form>
    </div>
    <%
        }
    %>
</div>
</body>
</html>

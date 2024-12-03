<%@ page import="org.example.demo6.CourseshowRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.demo6.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kurslar ro'yxati</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        h1 {
            text-align: center;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            margin: 0;
        }
        .course-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px 0;
        }
        .course-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
            margin: 10px;
            padding: 20px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .course-card h3 {
            margin: 0 0 10px 0;
            font-size: 1.5em;
        }
        .course-card button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .course-card button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>Kurslar ro'yxati</h1>
<div class="course-container">
    <%
        List<Course> courses = CourseshowRepo.showCourse();
        if (courses != null && !courses.isEmpty()) {
            for (Course course : courses) {
    %>
    <div class="course-card">
        <h3><%= course.getName() %></h3>
        <form action="modul.jsp" >
            <input type="hidden" name="courseId" value="<%= course.getId() %>">
            <button type="submit">Kirish</button>
        </form>
    </div>
    <%
        }
    } else {
    %>
    <p>Hech qanday kurs topilmadi.</p>
    <%
        }
    %>
</div>
</body>
</html>

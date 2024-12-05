<%@ page import="org.example.demo6.CourseshowRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.demo6.Course" %>
<%@ page import="java.util.Objects" %>
<%@ page import="org.example.demo6.BaseRepo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<html>
<head>
    <title>Kurslar ro'yxati</title>

    <style>
        .pagination {
            display: flex;
            justify-content: center; /* Markazlash */
            margin: 20px 0; /* Yuqori va pastdagi bo‘shliq */
        }

        .pagination a {
            margin: 0 5px; /* Tugmalar orasidagi bo‘shliq */
            padding: 10px 15px; /* Tugma kattaligi */
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            transition: background-color 0.3s, transform 0.2s;
        }

        .pagination a:hover {
            background-color: #45a049;
            transform: scale(1.1); /* Kattalashish effekti */
        }

        .pagination .active {
            background-color: #333;
            color: white;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
        }
        header h1 {
            margin: 0;
            font-size: 1.8em;
        }
        header .report-button {
            background-color: white;
            color: #4CAF50;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }
        header .report-button:hover {
            background-color: #45a049;
            color: white;
        }
        .course-container {
            display: flex; /* Flexboxni yoqish */
            flex-wrap: wrap; /* Elementlar qatorga sig‘masa o‘zi bilan yangi qatorga tushadi */
            justify-content: center; /* Kartalarni markazlash */
            gap: 20px; /* Kartalar orasidagi bo‘shliq */
            padding: 20px;
        }
        .course-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px; /* Har bir kartaning kengligi */
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
<header>
    <h1>Kurslar ro'yxati</h1>
    <form method="get" action="" style="display: flex; gap: 10px;">
        <input type="text" name="search" placeholder="Qidiruv..." value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>" class="form-control">
        <button type="submit" class="btn btn-primary">Qidirish</button>
    </form>
    <a href="Reprot.jsp" class="report-button">Report</a>
</header>
<div class="course-container">
    <%
        String searchQuery =Objects.requireNonNullElse(request.getParameter("search"),"");
        int page1 = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));

        CourseshowRepo courses1 = new CourseshowRepo();
        List<Course> courses = courses1.show(page1, searchQuery); // Qidiruv qo‘llab-quvvatlovchi metod

        if (courses != null && !courses.isEmpty()) {
            for (Course course : courses) {
    %>
    <div class="course-card">
        <h3><%= course.getName() %></h3>
        <form action="modul.jsp">
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

<div class="pagination">
    <%
        Long count = BaseRepo.count(searchQuery);
        int ceil = (int) Math.ceil((double) count / 10);

        for (int i = 1; i <= ceil; i++) {
    %>
    <a href="?page=<%= i %>&search=<%=searchQuery%>"><%= i %></a>
    <%
        }
    %>
</div>

</body>
</html>

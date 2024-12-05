<%@ page import="java.util.*" %>
<%@ page import="org.example.demo6.ReportRepo" %>
<%@ page import="org.example.demo6.Reprot" %>
<html>
<head>
    <title>Course Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        .course-section {
            margin-bottom: 20px;
            background: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }
        .course-name {
            font-size: 1.5em;
            font-weight: bold;
            color: #007BFF;
        }
        .total-amount {
            margin-top: 10px;
            font-size: 1.2em;
            color: #FF5733;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Course Reports</h1>
    <%
        // Reportlarni olish
        List<Reprot> reports = ReportRepo.findAllRepo();
        if (reports != null && !reports.isEmpty()) {
            for (Reprot reprot : reports) {
    %>
    <div class="course-section">
        <div class="course-name">
            Kurs nomi: <%= reprot.getCourseName() %>
        </div>
        <div class="total-amount">
            Talabalar soni: <%= reprot.getCourseStudentAmount() %>
        </div>
        <div class="total-amount">
            Umumiy summa: <%= reprot.getTotalsum() %> so'm
        </div>
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

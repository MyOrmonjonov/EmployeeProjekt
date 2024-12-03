<%@ page import="org.example.demo6.StudentRepo" %>
<%@ page import="org.example.demo6.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Payment List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .student-container {
            margin: 20px auto;
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .student-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .student-row:last-child {
            border-bottom: none;
        }

        .student-info {
            flex: 1;
            font-size: 16px;
        }

        .btn-add-payment {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-add-payment:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<h1>Talabalar Ro'yxati</h1>
<div class="student-container">
    <%
        List<Student> students = StudentRepo.getStudents(Integer.parseInt(request.getParameter("groupId")));

        for (Student student : students) {
    %>
    <div class="student-row">
        <div class="student-info">
            <strong>Talaba:</strong> <%= student.getName() %><br>
            <strong>To'langan summa:</strong> <%= student.getAmount() %> so'm
        </div>
        <form action="addPayment.jsp" method="get">
            <input type="hidden" name="studentId" value="<%= student.getId() %>">
            <input type="hidden" name="studentName" value="<%= student.getName() %>">
            <button class="btn-add-payment">Add Payment</button>
        </form>
    </div>
    <%
        }
    %>
</div>
</body>
</html>

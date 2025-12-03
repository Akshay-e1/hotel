<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>devops Hotel Management – Guest List</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg?auto=compress&cs=tinysrgb&w=1600') 
                        no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: blur(3px);
            color: white;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            background: rgba(0,0,0,0.65);
            padding: 25px;
            border-radius: 15px;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #ffcc66;
            letter-spacing: 2px;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .add-btn {
            display: inline-block;
            background: #ffcc00;
            color: black;
            padding: 10px 18px;
            text-decoration: none;
            font-weight: bold;
            border-radius: 6px;
            margin-bottom: 20px;
            transition: 0.2s;
        }

        .add-btn:hover {
            background: #ffdb4d;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255,255,255,0.1);
        }

        th {
            background: #ffcc00;
            color: black;
            padding: 12px;
            font-size: 17px;
        }

        td {
            padding: 12px;
            color: white;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        a.action {
            color: #00eaff;
            text-decoration: none;
            font-weight: bold;
        }

        a.action:hover {
            color: #66faff;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Hotel Management – Guest List</h2>

    <a href="guests?action=new" class="add-btn">+ Add New Guest</a>

    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Phone</th><th>Email</th><th>Actions</th>
        </tr>

        <c:forEach var="g" items="${guests}">
            <tr>
                <td>${g.id}</td>
                <td>${g.name}</td>
                <td>${g.phone}</td>
                <td>${g.email}</td>

                <td>
                    <a class="action" href="guests?action=view&id=${g.id}">View</a> |
                    <a class="action" href="guests?action=edit&id=${g.id}">Edit</a> |
                    <a class="action" href="guests?action=delete&id=${g.id}"
                       onclick="return confirm('Delete this guest?');">Delete</a>
                </td>
            </tr>
        </c:forEach>

    </table>

</div>
</body>
</html>

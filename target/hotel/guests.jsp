<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Guest List</title>
</head>
<body>
    <h2>Guest List</h2>

    <a href="guests?action=new">Add New Guest</a>
    <br/><br/>

    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th><th>Name</th><th>Phone</th><th>Email</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="g" items="${guests}">
            <tr>
                <td>${g.id}</td>
                <td>${g.name}</td>
                <td>${g.phone}</td>
                <td>${g.email}</td>

                <td>
                    <a href="guests?action=view&id=${g.id}">View</a> |
                    <a href="guests?action=edit&id=${g.id}">Edit</a> |
                    <a href="guests?action=delete&id=${g.id}"
                       onclick="return confirm('Delete guest?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>

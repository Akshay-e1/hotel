<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Guest Form</title>
</head>
<body>

<h2>${guest != null ? "Edit Guest" : "Add New Guest"}</h2>

<form action="guests" method="post">

    <input type="hidden" name="action" 
        value="${guest != null ? 'update' : 'insert'}" />

    <c:if test="${guest != null}">
        <input type="hidden" name="id" value="${guest.id}" />
    </c:if>

    Name: <input type="text" name="name" value="${guest.name}"/><br/><br/>
    Phone: <input type="text" name="phone" value="${guest.phone}"/><br/><br/>
    Email: <input type="text" name="email" value="${guest.email}"/><br/><br/>
    Address: <textarea name="address">${guest.address}</textarea><br/><br/>
    ID Proof: <input type="text" name="id_proof" value="${guest.idProof}"/><br/><br/>

    <c:if test="${guest != null}">
        Active: 
        <input type="checkbox" name="is_active" ${guest.isActive ? "checked" : ""}/>
        <br/><br/>
    </c:if>

    <button type="submit">Save</button>
</form>

<br/>
<a href="guests">Back</a>

</body>
</html>

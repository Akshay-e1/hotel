<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Guest Details</title>
</head>
<body>
<h2>Guest Details</h2>

<p><b>ID:</b> ${guest.id}</p>
<p><b>Name:</b> ${guest.name}</p>
<p><b>Phone:</b> ${guest.phone}</p>
<p><b>Email:</b> ${guest.email}</p>
<p><b>Address:</b> ${guest.address}</p>
<p><b>ID Proof:</b> ${guest.idProof}</p>
<p><b>Created:</b> ${guest.createdAt}</p>

<br/>
<a href="guests">Back</a>

</body>
</html>

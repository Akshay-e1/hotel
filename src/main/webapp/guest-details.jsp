<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Guest Details</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1501117716987-c8e9d1bbf30d')
                        no-repeat center center fixed;
            background-size: cover;
            color: white;
            padding: 40px;
        }

        .card {
            background-color: rgba(0,0,0,0.75);
            padding: 30px;
            border-radius: 15px;
            width: 50%;
            margin: auto;
            font-size: 18px;
            line-height: 1.8;
        }

        h1 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .btn {
            background-color: #ff914d;
            padding: 10px 18px;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            margin-right: 10px;
            display: inline-block;
        }

        .btn:hover {
            background-color: #ff7300;
        }
    </style>
</head>

<body>

<div class="card">
    <h1>Guest Details</h1>

    <label>ID:</label> ${guest.id} <br/>
    <label>Name:</label> ${guest.name} <br/>
    <label>Phone:</label> ${guest.phone} <br/>
    <label>Email:</label> ${guest.email} <br/>
    <label>Address:</label> ${guest.address} <br/>
    <label>ID Proof:</label> ${guest.idProof} <br/>
    <label>Created At:</label> ${guest.createdAt} <br/>
    <label>Status:</label> ${guest.isActive ? "Active" : "Inactive"} <br/><br/>

    <a class="btn" href="guests?action=edit&id=${guest.id}">Edit</a>
    <a class="btn" href="guests">Back to List</a>
</div>

</body>
</html>

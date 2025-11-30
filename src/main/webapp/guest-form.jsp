<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hotel Management – Guest Form</title>

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <!-- FONT AWESOME -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- AOS ANIMATION LIBRARY -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1582719478250-c89cae4dc85b')
                no-repeat center center fixed;
            background-size: cover;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to   { opacity: 1; }
        }

        .overlay {
            background: rgba(0,0,0,0.65);
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0; left: 0;
            backdrop-filter: blur(2px);
        }

        .container {
            position: relative;
            z-index: 2;
            width: 45%;
            margin: 70px auto;
            background: rgba(255,255,255,0.12);
            padding: 35px;
            border-radius: 16px;
            backdrop-filter: blur(12px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.5);
            animation: slideUp 1s ease-out;
        }

        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to   { transform: translateY(0); opacity: 1; }
        }

        h2 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 25px;
            font-weight: 700;
            color: #ffd875;
            text-shadow: 0 0 12px rgba(255,215,100,0.8);
        }

        label {
            font-weight: 600;
            color: #ffdd88;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin: 8px 0 18px 0;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            background: rgba(255,255,255,0.25);
            color: white;
            outline: none;
            transition: 0.3s;
        }

        input:focus, textarea:focus {
            box-shadow: 0 0 10px #ffcc00;
            background: rgba(255,255,255,0.35);
        }

        textarea {
            height: 90px;
        }

        .btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #ffcc00, #ff8800);
            border: none;
            color: black;
            border-radius: 10px;
            font-weight: 700;
            font-size: 17px;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 0 15px rgba(255,200,50,0.8);
        }

        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 0 25px rgba(255,200,50,1);
        }

        a.back-link {
            display: block;
            margin-top: 25px;
            text-align: center;
            color: #ffcc00;
            text-decoration: none;
            font-weight: 700;
            transition: 0.3s;
        }

        a.back-link:hover {
            color: #ffaa00;
            text-shadow: 0 0 10px #ffaa00;
        }

    </style>
</head>

<body>

<div class="overlay"></div>

<div class="container" data-aos="zoom-in">

    <h2 data-aos="fade-down">${guest != null ? "Edit Guest" : "Add New Guest"}</h2>

    <form action="guests" method="post" data-aos="fade-up">

        <!-- Action -->
        <input type="hidden" name="action"
               value="${guest != null ? 'update' : 'insert'}"/>

        <c:if test="${guest != null}">
            <input type="hidden" name="id" value="${guest.id}"/>
        </c:if>

        <label><i class="fa fa-user"></i> Name:</label>
        <input type="text" name="name" value="${guest.name}" required/>

        <label><i class="fa fa-phone"></i> Phone:</label>
        <input type="text" name="phone" value="${guest.phone}" required/>

        <label><i class="fa fa-envelope"></i> Email:</label>
        <input type="email" name="email" value="${guest.email}" required/>

        <label><i class="fa fa-location-dot"></i> Address:</label>
        <textarea name="address">${guest.address}</textarea>

        <label><i class="fa fa-id-card"></i> ID Proof:</label>
        <input type="text" name="id_proof" value="${guest.idProof}"/>

        <c:if test="${guest != null}">
            <label style="display:flex;align-items:center;margin:10px 0;">
                <input type="checkbox" name="is_active"
                       ${guest.isActive ? "checked" : ""}/>
                &nbsp; Active
            </label>
        </c:if>

        <button class="btn" type="submit"><i class="fa fa-save"></i> Save</button>
    </form>

    <a class="back-link" href="guests"><i class="fa fa-arrow-left"></i> Back to Guest List</a>

</div>

<!-- AOS JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>AOS.init();</script>

</body>
</html>

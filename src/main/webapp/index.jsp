<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>devops Hotel Management</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;500;700;800&display=swap" rel="stylesheet">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- AOS Animation Library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.1/aos.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1501117716987-c8e1ecb2100f?auto=format&fit=crop&w=1600&q=90') no-repeat center center fixed;
            background-size: cover;
        }

        /* Dark Gradient Overlay */
        .overlay {
            height: 100vh;
            width: 100%;
            background: linear-gradient(to bottom, rgba(0,0,0,0.7), rgba(0,0,0,0.4));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        h1 {
            font-size: 70px;
            font-weight: 800;
            letter-spacing: 4px;
            margin-bottom: 25px;
            color: #ffeb9c;
            text-shadow: 0px 0px 15px black;
        }

        .sub {
            font-size: 22px;
            margin-bottom: 40px;
            opacity: 0.9;
            letter-spacing: 1px;
        }

        /* Glass Card */
        .glass-box {
            background: rgba(255,255,255,0.1);
            padding: 40px;
            border-radius: 25px;
            backdrop-filter: blur(10px);
            box-shadow: 0px 0px 20px rgba(0,0,0,0.4);
            animation: fadeIn 1.5s ease-in-out;
        }

        .buttons {
            margin-top: 20px;
            display: flex;
            gap: 30px;
        }

        .btn {
            padding: 18px 45px;
            border-radius: 50px;
            background: linear-gradient(45deg, #ffdd55, #ffeaa7);
            color: #000;
            font-size: 19px;
            font-weight: 700;
            cursor: pointer;
            border: none;
            transition: 0.3s;
            text-decoration: none;
            box-shadow: 0 0 15px rgba(255,255,255,0.4);
        }

        .btn i {
            margin-right: 10px;
        }

        .btn:hover {
            background: white;
            transform: translateY(-5px) scale(1.08);
            box-shadow: 0 0 25px rgba(255,255,255,1);
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to   {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>

<body>
    <div class="overlay">

        <div class="glass-box" data-aos="zoom-in">

            <h1>devops HOTEL MANAGEMENT</h1>
            <div class="sub">Manage Guests · Reservations · Rooms</div>

            <div class="buttons">

                <a class="btn" href="guests">
                    <i class="fa-solid fa-users"></i> Guest List
                </a>

                <a class="btn" href="guests?action=new">
                    <i class="fa-solid fa-user-plus"></i> Add Guest
                </a>

                <a class="btn" href="guest-form.jsp">
                    <i class="fa-solid fa-file-pen"></i> Guest Form
                </a>

            </div>
        </div>
    </div>

    <!-- AOS Script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.1/aos.js"></script>
    <script>AOS.init();</script>
</body>
</html>

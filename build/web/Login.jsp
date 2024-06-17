<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/css-js.jsp" %>
        <style>
            .form {
                display: flex;
                flex-direction: column;
                gap: 10px;
                max-width: 350px;
                background-color: #fff;
                padding: 20px;
                border-radius: 20px;
                position: relative;
            }

            .title {
                font-size: 28px;
                color: royalblue;
                font-weight: 600;
                letter-spacing: -1px;
                position: relative;
                display: flex;
                align-items: center;
                padding-left: 30px;
            }

            .title::before,.title::after {
                position: absolute;
                content: "";
                height: 16px;
                width: 16px;
                border-radius: 50%;
                left: 0px;
                background-color: royalblue;
            }

            .title::before {
                width: 18px;
                height: 18px;
                background-color: royalblue;
            }

            .title::after {
                width: 18px;
                height: 18px;
                animation: pulse 1s linear infinite;
            }

            .message, .signin {
                color: rgba(88, 87, 87, 0.822);
                font-size: 14px;
            }

            .signin {
                text-align: center;
            }

            .signin a {
                color: royalblue;
            }

            .signin a:hover {
                text-decoration: underline royalblue;
            }

            .flex {
                display: flex;
                width: 100%;
                gap: 6px;
            }

            .form label {
                position: relative;
            }

            .form label .input {
                width: 100%;
                padding: 10px 10px 20px 10px;
                outline: 0;
                border: 1px solid rgba(105, 105, 105, 0.397);
                border-radius: 10px;
            }

            .form label .input + span {
                position: absolute;
                left: 10px;
                top: 15px;
                color: grey;
                font-size: 0.9em;
                cursor: text;
                transition: 0.3s ease;
            }

            .form label .input:placeholder-shown + span {
                top: 15px;
                font-size: 0.9em;
            }

            .form label .input:focus + span,.form label .input:valid + span {
                top: 30px;
                font-size: 0.7em;
                font-weight: 600;
            }

            .form label .input:valid + span {
                color: green;
            }

            .submit {
                border: none;
                outline: none;
                background-color: royalblue;
                padding: 10px;
                border-radius: 10px;
                color: #fff;
                font-size: 16px;
                transform: .3s ease;
            }

            .submit:hover {
                background-color: rgb(56, 90, 194);
            }

            @keyframes pulse {
                from {
                    transform: scale(0.9);
                    opacity: 1;
                }

                to {
                    transform: scale(1.8);
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body>
        <!--<h1 class="text-success">Hello World!</h1>-->
        <section class="hhh">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="components/bgn.png"
                             class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                        <form class="form" action="Login" method="post">
                            <p class="title">Login</p>        
                            <label>
                                <input required="" name="txtemail" placeholder="" type="email" class="input">
                                <span>Email</span>
                            </label> 

                            <label>
                                <input required="" name="txtpassword" placeholder="" type="password" class="input">
                                <span>Password</span>
                            </label>
                            <button class="submit">Login</button>
                            <p class="signin">Not have an account? <a href="Register.jsp">Signup</a> </p>
                        </form>

                    </div>
                </div>
            </div>

            <!-- Copyright -->


        </div>
    </section>
<marquee style="font-size: 1.1rem">get latest update with <b>DAILY NEWS</b></marquee>
    <%@ include file="footer.jsp" %>
</body>
</html>

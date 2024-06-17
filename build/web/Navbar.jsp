<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/css-js.jsp" %>
        <style>
            @import url(https://fonts.googleapis.com/css?family=Abril+Fatface|Roboto:400,400italic,500,500italic);

            * {
                margin: 0;
                padding: 0;
            }

            body,
            html {
                margin: 0;
                padding: 0;
                height: 100%;
            }

            .head {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 10%;
                padding: 20px 100px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                opacity: 1;
                font-weight: bold;
                z-index: 9999;
            }

            @keyframes navLinkFade {
                from {
                    opacity: 0;
                    transform: translateY(-15px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .logo {
                float: right;
                width: 150px;
                height: auto;
                margin-left: -6%;
            }

            .navbars a {
                font-size: 20px;
                text-decoration: none;
                margin-left: 35px;
                transition: 0.3s;
                font-weight: bold;
            }

            .navbars a span {
                color: white;
                font-weight: bolder;
            }

            .navbars a:hover {
                color: white;
            }

            .navbars {
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            #menu-icon {
                font-size: 3.6rem;
                color: white;
                display: none;
                scroll-behavior: smooth;
            }

            /* BREAKPOINTS */

            @media (max-width: 1200px) {
                html {
                    font-size: 55%;
                }
            }

            @media (max-width: 991px) {
                .head {
                    padding: 2rem 3%;
                }
                .logo {
                    width: 150px;
                    height: auto;
                    margin-left: -2%;
                }
            }

            @media (max-width: 1059px) {
                #menu-icon {
                    display: block;
                }
                .navbars {
                    position: absolute;
                    top: 100%;
                    left: 0;
                    width: 100%;
                    padding: 1rem 3%;
                    background-color: #3B71CA;
                    display: none;
                    transition: max-height 0.3s ease-in-out, opacity 0.3s ease-in-out;
                    max-height: 0;
                    opacity: 0.6;
                    overflow: hidden;
                }
                .navbars.active {
                    display: flex;
                }
                .navbars a {
                    display: block;
                    font-size: 2rem;
                    margin: 3rem 0;
                }
                .logo {
                    width: 130px;
                    height: auto;
                    margin-left: -1%;
                }
            }

            .nl {
                position: relative;
                text-decoration: none;
                color: white;
                transition: color 0.3s;
            }

            .nl::before {
                content: "";
                position: absolute;
                bottom: 0;
                left: 0;
                width: 0;
                height: 2px;
                background-color: black;
                transition: width 0.3s;
            }


            .nl:hover::before {
                width: 100%;
            }
            .carousel-container {
                margin-top: 60px; /* Adjust this value based on the height of your navbar */
            }


            .hover-underline-animation {
                display: inline-block;
                position: relative;
                color: #0087ca;
            }

            .hover-underline-animation::after {
                content: '';
                position: absolute;
                width: 100%;
                transform: scaleX(0);
                top: 10px;
                height: 2px;
                bottom: 0;
                left: 0;
                background-color: black;

                transform-origin: bottom right;
                transition: transform 0.25s ease-out;
            }

            .hover-underline-animation:hover::after {
                transform: scaleX(1);
                transform-origin: bottom left;

            }

            .container {
                margin-top: 2%;
            }



            /* Additional styles for responsiveness */
            @media (max-width: 768px) {
                .container {
                    margin-left: 0;
                }

                /* .contact_info {
                  margin-left: 0;
                  margin-right: 0;
                } */
            }

            .cdisplay {
                display: flex;
            }

            .containers {
                margin-left: 0%;
                margin-right: 5%;
                margin-top: 2%;
            }

            .contactbody {
                width: 100%;
                max-width: 800px; /* Set a maximum width for larger screens */
                height: auto; /* Instead of fixed height */
                border: 1px solid black;
                background-color: bisque;
                padding: 15px;
                margin-left: auto;
                margin-right: auto;
            }

            .contact_box {
                padding-left: 10%; /* Adjust as needed */
            }

            /* Responsive Styles */
            @media (max-width: 768px) {

                .contactbody {
                    padding: 10px; /* Adjust padding for smaller screens */
                }

                .contact_box {
                    padding-left: 0;
                }
            }

            /* Further Responsive Adjustments for Small Screens */
            @media (max-width: 576px) {
                .containers {
                    margin-left: -10%;
                    margin-right: 3%;
                }

                .contactbody {
                    padding: 8px; /* Further adjust padding for smaller screens */
                }
            }
        </style>
    </head>
    <body>
        <%
    if (session == null || session.getAttribute("userid") == null) {
        // If the session or "userid" attribute is not set, redirect the user to the login page
        response.sendRedirect("Login.jsp");
    } else {
    int rid = (int)session.getAttribute("userid");
%>
        <header class="head" style="background-color: #3b71ca; height: 60px">
            <div class="logo">
<!--                <a href=""> 
                    <img
                        id="logo"
                        class="site_logo"
                        src="components/DAILY.png";
                        style="filter: invert(100%)"
                        alt="logo"
                        width="200px"
                        />  
                </a>-->
<!--<a href="Home.jsp" ><h4 class="text-white">𝒟𝒜𝐼𝐿𝒴 𝒩𝐸𝒲𝒮</h4></a>-->
<a href="Home.jsp"><h5 style="color:#c7f7fc"><i class="fa-solid fa-newspaper fa-beat"></i> 𝐃𝐀𝐈𝐋𝐘 𝐍𝐄𝐖𝐒</h5></a>
            </div>
            <i class="bx bx-menu" id="menu-icon"></i>
            <nav class="navbars">
                <a href="Home.jsp"><span class="nl home">Home</span></a>
                <%
                    if(rid == 1)
                    {   %>
                        <a href="Addnews.jsp"><span class="nl tech">Add news</span></a>
                <a href="Listnews.jsp"><span class="nl tech">List news</span></a>
                <a href="About.jsp"><span class="nl tech">About us</span></a>
                    <%
                    }
                    %>
                    <%
                    if(rid == 2)
                    {   %>
<!--                        <a href="Home.jsp?cat=general"><span class="nl tech">general</span></a>-->
                        <a href="Home.jsp?cat=sports"><span class="nl tech">sports</span></a>
                        <a href="Home.jsp?cat=science"><span class="nl tech">science</span></a>
                        <a href="Home.jsp?cat=technology"><span class="nl tech">tech</span></a>
                        <a href="Home.jsp?cat=entertainment"><span class="nl tech">entertainment</span></a>
                        <a href="Home.jsp?cat=health"><span class="nl tech">health</span></a>
                        <a href="Home.jsp?cat=political"><span class="nl tech">politics</span></a>
                        <a href="Home.jsp?cat=food"><span class="nl tech">food</span></a>
                        <a href="Home.jsp?cat=business"><span class="nl tech">business</span></a>
                    <%
                    }
                    %>
                
                
<!--                <a href="#aboutus"><span class="nl tech">About Us</span></a>
                <a href="#contactus"><span class="nl non-tech">Contact Us</span></a>-->
                <a href="Logout"><span class="nl flagship">Logout</span></a>
            </nav>
        </header>
        <div style="margin-top: 50px;">&nbsp;</div>
        <script>
            let menuIcon = document.querySelector('#menu-icon');
            let navbars = document.querySelector('.navbars');
            let body = document.body;

            menuIcon.onclick = () => {
                menuIcon.classList.toggle('bx-x');
                navbars.classList.toggle('active');

                if (navbars.classList.contains('active')) {
                    // Open the navbars with a smooth animation
                    navbars.style.maxHeight = navbars.scrollHeight + 'px';
                    navbars.style.opacity = 1;
                } else {
                    // Close the navbars with a smooth animation
                    navbars.style.maxHeight = '0';
                    navbars.style.opacity = 0;
                }
            };

            window.addEventListener('resize', () => {
                if (window.innerWidth > 768) {
                    navbars.style.maxHeight = '';
                    navbars.style.opacity = '';
                }
            });
            function closenavbars() {
                menuIcon.classList.remove('bx-x');
                navbars.classList.remove('active');
                navbars.style.maxHeight = '0';
                navbars.style.opacity = '0';
            }

            body.addEventListener('click', (event) => {
                if (navbars.classList.contains('active') && event.target !== menuIcon && !navbars.contains(event.target)) {
                    closenavbars();
                }
            });
        </script>
        <% } %>
    </body>
</html>

<%-- 
    Document   : create
    Created on : May 17, 2023, 2:04:28 PM
    Author     : truon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif
            }

            body {
                height: 100vh;
                font-family: Arial, Helvetica, sans-serif;
                background-color: rgba(255, 1, 1, 0.1);
            }

            .container {
                margin: 50px auto
            }

            h5 {
                color: #ff0147;
                margin-bottom: 3px;
                font-weight: bold;
            }
            small {
                color: rgba(0, 0, 0, 0.3)
            }
            span.text-center {
                color: rgba(0, 0, 0, 0.3)
            }

            #forgot {
                min-width: 100px;
                margin-left: auto;
                text-decoration: none
            }

            a:hover {
                text-decoration: none
            }

            .form-inline label {
                padding-left: 10px;
                margin: 0;
                cursor: pointer
            }

            .btn.btn-primary {
                display: block;
                width: 100%;
                border-radius: 30px;
                border: none;
                background: linear-gradient(to right, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%);
                background: -webkit-linear-gradient(left, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%)
            }

            .panel {
                min-height: 380px;
                box-shadow: 20px 20px 80px rgb(218, 218, 218);
                border-radius: 12px
            }

            .form-control {
                border: 1px solid #dc354575;
                border-radius: 30px;
                background-color: rgba(0, 0, 0, .075);
                letter-spacing: 1px
            }

            .form-control:focus {
                border: 0.5px solid #dc354575;
                border-radius: 30px;
                box-shadow: none;
                background-color: rgba(0, 0, 0, .075);
                color: #000;
                letter-spacing: 1px
            }
            input {
                width: 100%;
                display: block;
                /*margin-bottom: 7px;*/
            }

            .fa-eye-slash.btn {
                border: none;
                outline: none;
                box-shadow: none
            }

            img {
                width: 50px;
                height: 50px;
                object-fit: cover;
                border-radius: 50%;
                position: relative;
                margin-left: 15px;    
            }

            a[target='_blank'] {
                position: relative;
                transition: all 0.1s ease-in-out
            }

            .bordert {
                border-top: 1px solid #aaa;
                position: relative
            }

            .bordert:after {
                content: "or connect with";
                position: absolute;
                top: -13px;
                left: 33%;
                background-color: #fff;
                padding: 0px 8px
            }

            @media(max-width: 360px) {
                #forgot {
                    margin-left: 0;
                    padding-top: 10px
                }

                body {
                    height: 100%
                }

                .container {
                    margin: 30px 0
                }

                .bordert:after {
                    left: 25%
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
                    <div class="panel border bg-white">
                        <div class="card-title text-center">
                            <h5 class="mt-5">HEY, THERE</h5> <small class="para">Register to your cool account below.</small>
                        </div>
                        <div class="panel-body p-3">
                            <form action="MainController" method="POST">
                                <div class="form-group">
                                    <div class="input-field"> <span class="far fa-user"></span> <input class="form-control" type="text" name="user"
                                                                                                       placeholder="Enter UserID" required> </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-field"> <span class="far fa-user"></span> <input class="form-control" type="text" name="name"
                                                                                                       placeholder="Enter your Name" required> </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-field"> <span class="fas fa-lock"></span> <input class="form-control" type="password" name="pass"
                                                                                                       placeholder="Enter your Password" required> 
                                        <!--                                        <button
                                                                                    class="btn bg-white text-muted"> 
                                                                                    <span class="far fa-eye-slash"></span>
                                                                                </button>-->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-field"> <span class="fas fa-lock"></span> <input class="form-control" type="password" name="cpass"
                                                                                                       placeholder="Confirm your Password" required> 
<!--                                        <button
                                            class="btn bg-white text-muted"> 
                                            <span class="far fa-eye-slash"></span>
                                        </button> -->
                                    </div>
                                </div> 
                                <p style="color: red"><strong>${CreateError}</strong></p>
                                <p style="color: red"><strong>${LoginError}</strong></p>
                                <input type="submit" class="btn btn-primary btn-block mt-3" name="action" value="Create"/>

                                <div class="text-center pt-4 text-muted">Haved an account? <a href="Login.jsp">Back to Login
                                    </a>
                                </div>
                            </form>
                        </div>
                        <div class="mx-3 my-2 py-2 bordert">
                            <div class="text-center py-3"> <a href="create.jsp" target="_blank" class="px-2">
                                    <img src="https://www.dpreview.com/files/p/articles/4698742202/facebook.jpeg" alt="">
                                </a> <a href="create.jsp" target="_blank" class="px-2"> <img
                                        src="https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png"
                                        alt=""> </a> <a href="create.jsp" target="_blank" class="px-2"> <img
                                        src="https://png.pngtree.com/png-vector/20221018/ourmid/pngtree-twitter-social-media-round-icon-png-image_6315985.png"
                                        alt=""> </a> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>

<%-- 
    Document   : Login
    Created on : May 22, 2023, 9:01:58 PM
    Author     : 84868
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Page</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <style>
                body {
                    font-family: Arial, Helvetica, sans-serif;
                    background-color: rgba(255, 1, 1, 0.1)
                }

                .card {
                    border: none;
                    border-radius: 0;
                    width: 420px !important;
                    margin: 0 auto
                }

                .signup {
                    display: flex;
                    flex-flow: column;
                    justify-content: center;
                    padding: 10px 50px
                }

                a{
                    text-decoration:none !important;
                }

                h5 {
                    color: #ff0147;
                    margin-bottom: 3px;
                    font-weight: bold
                }

                small {
                    color: rgba(0, 0, 0, 0.3)
                }

                input {
                    width: 10%;
                    display: inline-block;
                    margin-bottom: 7px
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

                .btn {
                    display: block;
                    width: 100%;
                    border-radius: 30px;
                    border: none;
                    background: linear-gradient(to right, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%);
                    background: -webkit-linear-gradient(left, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%)
                }

                .text-left {
                    color: rgba(0, 0, 0, 0.3);
                    font-weight: 400
                }

                .text-right {
                    color: #ff0147;
                    font-weight: bold
                }

                span.text-center {
                    color: rgba(0, 0, 0, 0.3)
                }

                .fab {
                    padding: 15px;
                    font-size: 23px
                }

                .fa-facebook {
                    color: #0303d9bf
                }

                .fa-twitter {
                    color: #0078fade
                }

                .fa-linkedin {
                    color: #18b1c0
                }
                .bordert {
                    border-top: 1px solid #aaa;
                    position: relative;
                }

                .bordert:after {
                    position: absolute;
                    top: -13px;
                    left: 33%;
                    background-color: #fff;
                    padding: 0px 8px;
                }
                img {
                    width: 50px;
                    height: 50px;
                    object-fit: cover;
                    border-radius: 50%;
                    position: relative;
                    margin-left: 15px;
                }
                .form-group.checkbox-group {
                    display: flex;
                    align-items: center;
                    margin-bottom: 10px;
                }

                input[type="checkbox"] {
                    margin: 0;
                    margin-right: 5px;
                }

                label.checkbox-label {
                    color: rgba(0, 0, 0, 0.3);
                    font-weight: 400;
                }
            </style>

        </head>

        <body>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mx-auto py-4 px-0">
                        <div class="card p-0">
                            <div class="card-title text-center">
                                <h5 class="mt-5">HEY, THERE</h5> <small class="para">Login to your cool account below.</small>
                            </div>
                            <form class="signup" action="MainController" method="POST">
                                <p class="text-danger">${mess}</p>
                                <div class="form-group">
                                    <input type="text" name="userId" value="${userID}" class="form-control" placeholder="UserID" required class="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" value="${password}" class="form-control" placeholder="Password" required class="">
                                </div> 
                                <div class="form-group checkbox-group">
                                    <input type="checkbox" name="remember" id="rememberMe"> 
                                    <label for="rememberMe" class="checkbox-label">Remember me</label>
                                </div>
                                <input type="submit" name="action" class="btn btn-primary" value="Login"/>

                                <div class="row">
                                    <div class="col-6 col-sm-6">
                                        <a href="#"><p class="text-left pt-2 ml-1">Forgot password?</p></a>
                                    </div>
                                    <div class="col-6 col-sm-6">
                                        <a href="create.jsp"> <p class="text-right pt-2 mr-1">Sign Up Now</p></a>
                                    </div>
                                </div> 
                                <span class="text-center">Or</span> <span class="text-center pt-3">Login Using</span>
                                <div class="mx-3 my-2 py-2 bordert">
                                    <div class="text-center py-3"> <a href="create.jsp" target="_blank" class="px-2">
                                            <img src="https://www.dpreview.com/files/p/articles/4698742202/facebook.jpeg" alt="">
                                        </a> <a href="create.jsp" target="_blank" class="px-2"> <img
                                                src="https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png"
                                                alt=""> </a> <a href="create.jsp" target="_blank" class="px-2"> <img
                                                src="https://png.pngtree.com/png-vector/20221018/ourmid/pngtree-twitter-social-media-round-icon-png-image_6315985.png"
                                                alt=""> </a> </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </body>

    </html>

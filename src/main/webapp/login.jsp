<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="signup-header">
    <h2>Login to <mark>Tiazon</mark></h2>
</div>

<form method="post" action="Controller">

    <input type="hidden" name="page" value="login-credentials">

    <!-- Validations errors -->
    <font color="#F24638"><c:out value="${msg }"></c:out></font>

    <div class="signup-group">
        <label>Username</label>
        <input type="text" name="username" placeholder="Your Username">
    </div>
    <div class="signup-group">
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password">
    </div>
    <div class="signup-group">
        <label>Email</label>
        <input type="text" name="username" placeholder="Your Email">
    </div>
    <div class="signup-group">
        <label>Username</label>
        <input type="text" name="cardType" placeholder="Your Card Type">
    </div>
    <div class="signup-group">
        <label>Username</label>
        <input type="text" name="cardNumber" placeholder="Your card number">
    </div>
    <div class="signup-group">
        <button type="submit" name="login" class="signup-btn">Log in</button>
    </div>
    <p>
        New to Tiazon? <a href="Controller?page=sign-up" style="color:#F24638;">Create Account</a>
    </p>
</form>

</body>
</html>
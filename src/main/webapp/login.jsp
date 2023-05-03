<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/login.css">
    <title>Sign up - Music</title>
</head>
<body>
<div class="main-container">
    <div class="form-container">
        <div class="form-header">
            <div class="logo-container">
                <a href="Controller?page=index"><img src="assets/images/logo.png" alt="app logo"></a>
            </div>
            <div class="text-container">
                <a href="Controller?page=index"><p>.music</p></a>
            </div>
        </div>
        <form class="form-prueba" id="sample-form" method="post" action="Controller">
            <div class = "form-group">
                <input type="hidden" name="page" value="login-credentials">
                <fieldset class="fldst1">
                    <c:choose>
                        <c:when test="${badLogin != null}">
                            <p style="color: red; font-size: 0.8em; height: 0.8em; margin-top: 0; text-decoration: underline"><c:out value="${badLogin}"></c:out></p>
                        </c:when>
                    </c:choose>
                    <label for="email">Email<input id="email" type="text"  name="email" required></label>
                    <label for="password">Password<input id="password" type="password"  maxlength="20" name="password" required></label>
                </fieldset>
                <div class="submit-button-container">
                    <button class="submit-button" type="submit">Log in</button>
                </div>
                <div class = "no-account">
                    <p>New costumer? <a href="Controller?page=signup">Sign Up!</a></p>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/signup.css">
    <title>Sign up - .music</title>
</head>
    <body>
    <div class="main-container">
        <div class="form-header">
            <div class="logo-container">
                <a href="Controller?page=index"><img src="assets/images/logo.png" alt="app logo"></a>
            </div>
            <div class="text-container">
                <a href="Controller?page=index"><p>.music</p></a>
            </div>
        </div>
        <div class="form-container">
            <form class="form-prueba" id="sample-form" method="post" action="Controller">
                <input type="hidden" name="page" value="signup-credentials">
                <fieldset class="fldst1">
                    <label for="username">Usuario<input id="username" type="text"  name="username" placeholder="Username" required></label>
                    <label for="password">Contraseña<input id="password" type="password" maxlength="20" name="password" placeholder="***********" required></label>
                    <label for="email">Correo Electrónico<input id="email" type="text" name="email" placeholder=" example@example.com" required></label>
                </fieldset>
                <fieldset class="fldst2">
                    <p>Select yout card type:</p>
                    <label for="cardType">
                        <select name="cardType" id="cardType">
                            <option value="Credit">Credit</option>
                            <option value="Debit">Debit</option>
                            <option value="Prepaid">Prepaid</option>
                        </select>
                    </label>
                </fieldset>
                <fieldset>
                    <label for="cardNumber">Card Number<input id="cardNumber" type="text"  name="cardNumber" required></label>
                </fieldset>
                <fieldset class="fldst3">
                    <label for="terms-and-conditions">
                        <input id="terms-and-conditions" type="checkbox" name="terms-and-conditions" required>I accept <a href="#">terms & conditions</a>
                    </label>
                </fieldset>
                <div class="submit-button-container">
                    <button class="submit-button" type="submit">Sign Up</button>
                </div>
            </form>
        </div>
    </div>
    </body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header>
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand nav-item" href="Controller?page=index">
                <img src="assets/images/logo.png" alt="Logo" width="80px" height="80px" class="d-inline-block">
                .music
            </a>
            <ul class="nav-item">
                <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=index">HOME</a></li>
                <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=cart">CART</a></li>
            </ul>
            <div class="nav_item account-manage">
                <ul class="nav-item">
                    <c:choose>
                        <c:when test="${session == null}">
                            <li class="navbar-text hoverable manage-account"><a class="nav-link" href="Controller?page=login">Login</a></li>
                            <li class="navbar-text manage-account"> / </li>
                            <li class="navbar-text hoverable manage-account"><a class="nav-link" href="Controller?page=sign-up">Sign-up</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="navbar-text hoverable manage-account"><a class="nav-link" href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <a href="Controller?page=login" class="profile-link">
                    <img src="assets/images/user.png" width="50px" height="50px" alt="notificaciones">
                </a>
            </div>
        </div>
    </nav>
</header>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/index.css">
    <title>.music</title>
</head>
<body>
<c:set var="items" value="${cart.getCart().keySet().size()}"></c:set>
<header>
    <nav class="navbar navbar-expand-sm navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand nav-item" href="Controller?page=index">
                <img src="assets/images/logo.png" alt="Logo" width="80px" height="80px" class="d-inline-block">
                .music
            </a>
            <ul class="nav-item">
                <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=index">HOME</a></li>
                <c:choose>
                    <c:when test="${items >= 1}">
                        <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=cart">CART (<c:out value="${items}"></c:out>)</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="navbar-text hoverable"><a class="nav-link" href="Controller?page=cart">CART</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <div class="nav_item account-manage">
                <ul class="nav-item">
                    <c:choose>
                        <c:when test="${username == null}">
                            <li class="navbar-text hoverable manage-account"><a class="nav-link" href="Controller?page=login">Login</a></li>
                            <li class="navbar-text manage-account"> / </li>
                            <li class="navbar-text hoverable manage-account"><a class="nav-link" href="Controller?page=signup">Sign-up</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="navbar-text hoverable manage-account"><a class="nav-link" href="#"><c:out value="${username}"></c:out></a></li>
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

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:choose>
                <c:when test="${not empty products}">
                    <c:forEach items="${products}" var="productItem">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <h5 class="fw-bolder"><c:out value="${productItem.key.getName()}"></c:out></h5><c:out value="${productItem.key.getPrice()}"></c:out>€
                                    </div>
                                </div>
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">

                                    <div class="text-center">
                                        <a href="Controller?page=decreaseQuantityIndex&name=${productItem.key.getName()}"> <span class="btn btn-danger">-</span></a>
                                        <a class="btn mt-auto" href="Controller?page=CD-selection&name=${productItem.key.getName()}&quantity=${products.get(productItem.key)}">Add: ${products.get(productItem.key)}</a>
                                        <a href="Controller?page=increaseQuantityIndex&name=${productItem.key.getName()}"><span class="btn btn-success">+</span></a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">WELCOME TO .music</h5>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">

                                <div class="text-center">
                                    <a class="btn mt-auto" href="Controller?showProducts=true&page=index">See Products</a>
                                </div>

                            </div>
                        </div>
                    </div>

                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>
</body>

</html>
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
<div id="header" style ="min-height: 105px;"></div>
<script src = "js/header-loader.js"></script>

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:choose>
                <c:when test="${not empty products}">
                    <c:forEach items="${products}" var="product">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <img class="card-img-top" src="" alt="<c:out value="${product.getName()}"></c:out>">
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <h5 class="fw-bolder"><c:out value="${product.getName()}"></c:out></h5><c:out value="${product.getPrice()}"></c:out>€
                                    </div>
                                </div>
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn mt-auto" href="#">Add to cart</a></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <a href="Controller?showProducts=true&page=index">See Products</a>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
</section>






<div class = "form-container">
    <form action="Controller" method="post">
        <input type="hidden" name="page" value="CD-selection">
        <b>CD:</b>
        <label for="dropdown">
            <select id = "dropdown" name = "title">
                <option>Yuan | The Guo Brothers | China | $14.95</option>
                <option>Drums of Passion | Babatunde Olatunji | Nigeria | $16.95</option>
                <option>Kaira | Tounami Diabate| Mali | $16.95</option>
                <option>The Lion is Loose | Eliades Ochoa | Cuba | $13.95</option>
                <option>Dance the Devil Away | Outback | Australia | $14.95</option>
                <option>Record of Changes | Samulnori | Korea | $12.95</option>
                <option>Djelika | Tounami Diabate | Mali | $14.95</option>
                <option>Rapture | Nusrat Fateh Ali Khan | Pakistan | $12.95</option>
                <option>Cesaria Evora | Cesaria Evora | Cape Verde | $16.95</option>
                <option>DAA | GSTIC | Spain | $50.00</option>
            </select>
        </label>
        <b>Cantidad:</b>
        <label>
            <input type="text" name="cantidad" value="1">
        </label>
        <p>
        <div style="text-align: center;">
            <button type="submit" value="Selecciona Producto">Añadir al carrito</button>
        </div>
    </form>
</div>
</body>

</html>